pid=$(ps aux | grep libinput-gestures-wrapped$ | awk '{ print $2 }')
kill $pid
libinput-gestures & disown
