# auto start tmux
if [ "$TMUX" = "" ]; then
    # check for old session
    if [ "$(tmux ls | grep -v attached | wc -l)" -gt "0" ]; then
        # attach to old session
#        tmux a -t "$(tmux ls | grep -v attached | cut -d ":" -f1 | head -n 1)"
    else
        # start new session - dont use exec so it's possible to run without tmux
#        tmux
    fi
fi
