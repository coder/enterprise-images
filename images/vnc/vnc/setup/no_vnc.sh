#!/usr/bin/env bash
set -euo pipefail

echo "Install noVNC - HTML5 based VNC viewer"
mkdir -p "$NO_VNC_HOME/utils/websockify"
wget -qO- https://github.com/novnc/noVNC/archive/v1.2.0.tar.gz | tar xz --strip 1 -C "$NO_VNC_HOME"
wget -qO- https://github.com/novnc/websockify/archive/v0.9.0.tar.gz | tar xz --strip 1 -C "$NO_VNC_HOME/utils/websockify"
chmod +x -v "$NO_VNC_HOME"/utils/*.sh

# Add our index with settings optimized for Coder
ln -s "$VNC_ROOT_DIR/index.html" "$NO_VNC_HOME/index.html"