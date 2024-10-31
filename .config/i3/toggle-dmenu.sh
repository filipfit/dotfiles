#!/bin/bash

# Check if dmenu is running
DMENU_PID=$(pgrep -x rofi)

if [ -n "$DMENU_PID" ]; then
  # If dmenu is running, kill the process
  kill "$DMENU_PID"
else
  # If dmenu is not running, launch it
  rofi -show
fi

# pkill -x dmenu || dmenu_run
