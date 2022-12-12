# ALT + Backspace bis zum nächsten Slash zu löschen,
function backward-kill-partial-word {
         local WORDCHARS="${WORDCHARS//[\/.]/}"
         zle backward-kill-word "$@"
     }
     zle -N backward-kill-partial-word
     for x in '^Xw' '^[^?' '^[^H'; do
         bindkey "$x" backward-kill-partial-word
     done; unset x


 
