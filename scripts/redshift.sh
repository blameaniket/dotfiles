#!/usr/bin/bash

STATE_FILE="/tmp/redshift_state"

if [ -f "$STATE_FILE" ]; then
    rm "$STATE_FILE"
    redshift -b 0.5 -P -O 6500
else
    touch "$STATE_FILE"
    redshift -b 0.5 -P -O 3000
fi

