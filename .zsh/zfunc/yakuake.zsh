[ -n "$DISPLAY" ] &&
if ! pgrep -f yakuake &> /dev/null 2>&1; then
  /usr/bin/yakuake > /dev/null 2>&1 &
fi
