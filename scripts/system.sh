
#!/usr/bin/env bash

selected=`echo "alacritty firefox poweroff reboot hibernate" | tr ' ' '\n' | dmenu`

$selected

