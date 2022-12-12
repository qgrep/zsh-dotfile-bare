[ -n "$DISPLAY" ] &&
if ! pgrep -f conky &> /dev/null 2>&1; then
  conky -q -c ~/conky/conky-grapes/conky_gen.conkyrc > /dev/null 2>&1 &
fi
