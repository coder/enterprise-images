#!/usr/bin/env bash

set -euo pipefail

# Emit a message to stderr and exit.
#
# This prints the arguments to stderr before exiting.
#
# Example:
#   error "Missing flag abc"
#   program-failure-info | error
function error() {
  set +x
  echo
  echo "$@" "$(cat)" >&2
  echo
  exit 1
}

# Check if dependencies are available.
#
# If any dependencies are missing, an error message will be printed to
# stderr and the program will exit, running traps on EXIT beforehand.
#
# Example:
#   check_dependencies git bash node
function check_dependencies() {
  local missing=false
  for command in "$@"; do
    if ! command -v "$command" &> /dev/null; then
      echo "$0: script requires '$command', but it is not in your PATH" >&2
      missing=true
    fi
  done

  if [ "$missing" = true ]; then
    exit 1
  fi
}

# Indent output by (indent) levels
#
# Example:
#   echo "example" | indent 2
#   cat file.txt | indent
function indent() {
  local indentSize=2
  local indent=1
  if [ -n "${1:-}" ]; then
    indent="$1"
  fi
  pr --omit-header --indent=$((indent * indentSize))
}

# Run a command, with tracing.
#
# This prints a command to stderr for tracing, in a format similar to
# the bash xtrace option (i.e. set -x, set -o xtrace), then runs it using
# eval if the first argument (dry run) is false.
#
# If dry run is true, the command and arguments will be printed, but
# not executed.
#
# Example:
#   run_trace $DRY_RUN rm -rf /
#   run_trace false echo "abc" \| indent
function run_trace() {
  local args=("$@")
  local dry_run="${args[0]}"
  args=("${args[@]:1}")

  # If we're running in GitHub Actions, use the special syntax
  # to start/end a group for each traced command
  if [[ -n "${GITHUB_ACTIONS:-}" && "$dry_run" = false ]]; then
    echo "::group::Run ${args[*]}" >&2
  else
    echo "+ ${args[*]}" >&2
  fi

  local exit_status=0
  if [ "$dry_run" = false ]; then
    eval "${args[@]}"

    # Save the exit status code from eval, otherwise it will be
    # obscured by future commands.
    exit_status="$?"
  fi

  if [[ -n "${GITHUB_ACTIONS:-}" && "$dry_run" = false ]]; then
    echo "::endgroup::" >&2
  fi

  return "$exit_status"
}
