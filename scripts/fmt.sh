#!/bin/bash

set -euo pipefail

# shellcheck source=scripts/lib.sh
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"
cdroot

check_dependencies dprint shfmt

dprint fmt
shfmt . >/dev/null 2>&1
