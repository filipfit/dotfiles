#!/bin/bash
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
  brave --ozone-platform=wayland "$@"
else
  brave "$@"
fi
