# Finish if there isn't a plugins directory.
if (! [[ -d "$ZDOTDIR/plugins/" ]]) {
  return 1
}


# zsh-autopair: Insert or delete brackets, parens, quotes in pair.
source "$ZDOTPLUGINSDIR/zsh-autopair/autopair.zsh"

source $ZSH/custom/fzf-tab/fzf-tab.plugin.zsh 

source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

#source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-completions.plugin.zsh

