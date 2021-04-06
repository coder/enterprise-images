#!/usr/bin/env bash
#
# This script installs dependencies to /usr/local/bin.

set -euo pipefail
cd "$(dirname "$0")"
source "./lib.sh"

TMPDIR="$(mktemp -d)"
BINDIR="/usr/local/bin"

curl_flags=(
  --silent
  --show-error
  --location
)

DRY_RUN=false

function usage() {
  echo "Usage: $(basename "$0") [options]"
  echo
  echo "This script installs dependencies required for building"
  echo "Coder images."
  echo
  echo "Options:"
  echo " -h, --help                   Show this help text and exit"
  echo " --dry-run                    Show commands that would run, but"
  echo "                              do not run them"
  exit 1
}

# Allow a failing exit status, as user input can cause this
set +o errexit
options=$(getopt \
            --name="$(basename "$0")" \
            --longoptions=" \
                help, \
                dry-run" \
            --options="h" \
            -- "$@")
# allow checking the exit code separately here, because we need both
# the response data and the exit code
# shellcheck disable=SC2181
if [ $? -ne 0 ]; then
  usage
fi
set -o errexit

eval set -- "$options"
while true; do
  case "${1:-}" in
  --dry-run)
    DRY_RUN=true
    ;;
  -h|--help)
    usage
    ;;
  --)
    shift
    break
    ;;
  *)
    # Default case, print an error and quit. This code shouldn't be
    # reachable, because getopt should return an error exit code.
    echo "Unknown option: $1"
    usage
    ;;
  esac
  shift
done

TRIVY_VERSION="0.16.0"

run_trace $DRY_RUN curl "${curl_flags[@]}" "https://github.com/aquasecurity/trivy/releases/download/v${TRIVY_VERSION}/trivy_${TRIVY_VERSION}_Linux-64bit.tar.gz" \| \
  tar -C "$TMPDIR" -zxf - trivy

run_trace $DRY_RUN sudo install --mode=0755 --target-directory="$BINDIR" "$TMPDIR/*"

run_trace $DRY_RUN which \
  trivy

run_trace false trivy --version

run_trace false rm -vrf "$TMPDIR"
