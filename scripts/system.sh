
#!/usr/bin/env bash

selected=`echo "st alacritty firefox poweroff reboot hibernate" | tr ' ' '\n' | dmenu`

$selected

