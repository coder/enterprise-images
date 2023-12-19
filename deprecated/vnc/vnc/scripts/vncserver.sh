#!/bin/bash
set -euo pipefail

mkdir -p $VNC_LOG_DIR

if [[ -v VNC_DISPLAY_ID ]]; then
  echo "Removing previous VNC locks..."

  vncserver -kill "$VNC_DISPLAY_ID" &> "$VNC_LOG_DIR/vnc_startup.log" || true
  rm -rfv /tmp/.X90-lock /tmp/.X11-unix &> "$VNC_LOG_DIR/vnc_startup.log" || true
fi

echo -e "Starting vncserver with param: VNC_COL_DEPTH=$VNC_COL_DEPTH, VNC_RESOLUTION=$VNC_RESOLUTION\n..."

exec vncserver "$VNC_DISPLAY_ID" \
 -SecurityTypes None \
 -alwaysshared \
 -depth "$VNC_COL_DEPTH" \
 -geometry "$VNC_RESOLUTION" \
 -fg \
 -xstartup "$VNC_XSTARTUP"
