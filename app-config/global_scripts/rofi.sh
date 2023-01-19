curr=$(~/.config/global_scripts/get-current-theme.sh)
if [ "$curr" = "'prefer-light'" ]; then
    theme_arg="-theme Arc"
else
    theme_arg="-theme Arc-Dark"
fi

rofi -dpi 192 -modi drun,run -show drun -show-icons $theme_arg -theme-str "element-icon { size: 2.65ch ; }"
