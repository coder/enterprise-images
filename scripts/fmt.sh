#!/bin/bash

set -euo pipefail

# shellcheck source=scripts/lib.sh
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"
cdroot

log "Fetching Dependencies"
go mod download

log "Formatting Markdown..."
go run github.com/shurcooL/markdownfmt@latest -w .

log "Formatting Dockerfiles..."
for dockerfile in $(find ./images -iname 'Dockerfile.*'); do
    log "${dockerfile}"
    go run github.com/jessfraz/dockfmt@latest fmt -w "${dockerfile}"
done