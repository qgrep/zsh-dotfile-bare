#!/bin/bash


banner() {
  printf "%s\n" \
    '
   @@@@@@@   @@@@@@  @@@@@@@ @@@@@@@@ @@@ @@@      @@@@@@@@  @@@@@@
   @@!  @@@ @@!  @@@   @@!   @@!      @@! @@!      @@!      !@@    
   @!@  !@! @!@  !@!   @!!   @!!!:!   !!@ @!!      @!!!:!    !@@!! 
   !!:  !!! !!:  !!!   !!:   !!:      !!: !!:      !!:          !:!
   :: :  :   : :. :     :     :       :   : ::.: : : :: ::: ::.: : 
      '
}

install () { 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

git clone              https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k  $HOME
   git clone           https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting  $HOME
    git clone          https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions  $HOME
    git clone          https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions  $HOME

 
}




clone_repo_and_backup () {
alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME $@'
#dot clone --bare --recurse-submodules https://github.com/qgrep/zsh-dotfile-bare.git "$HOME/.dotfiles"
#------------------------------------------------------------------------------#
# Download
#------------------------------------------------------------------------------#
echo "> Downloading dotfiles..."
DOTDIR="$HOME/.dotfiles"
git clone --quiet --bare https://github.com/qgrep/zsh-dotfile-bare "$DOTDIR"

cmd() { git --git-dir="$DOTDIR" --work-tree="$HOME" "$@"; }

#------------------------------------------------------------------------------#
# Backup already existing dotfiles
#------------------------------------------------------------------------------#
[ -d "$DOTDIR" ] && rm -rf $DOTDIR
DOTGITFILES=($(cmd ls-tree -r HEAD | awk '{print $NF}'))
BACKUPDIR=.dotfiles.backup
for f in "${DOTGITFILES[@]}"; do
  # File at root ==> back up file
  if [[ $(basename "$f") = "$f" ]]; then
    [[ -f "$HOME/$f" ]] && mkdir -p "$HOME/$BACKUPDIR" && mv "$HOME/$f" "$HOME/$BACKUPDIR" && echo "> Backing up: $f ==> $BACKUPDIR/$f"
  else
    d=${f%%/*}
    if [[ -d "$HOME/$d" ]]; then
      [[ -d "$HOME/$BACKUPDIR/$d" ]] && rm -rf "$HOME/$BACKUPDIR/$d"
      mkdir -p "$HOME/$BACKUPDIR" && mv "$HOME/$d" "$HOME/$BACKUPDIR" && echo "> Backing up: $d/ ==> $BACKUPDIR/$d/"
    fi
  fi
done

#------------------------------------------------------------------------------#
# Install
#------------------------------------------------------------------------------#
cmd checkout
cmd submodule --quiet init
cmd submodule --quiet update
cmd config status.showUntrackedFiles no
echo "> Success! The following dotfiles have been installed to $HOME:"
printf '    %s\n' "${files[@]}"
}

main () {
banner
install
clone_repo_and_backup
} >> /tmp/dotfiles.log
main