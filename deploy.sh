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
git clone --bare https://gitlab.raphael-christopher.de/xmg/zsh-dotfile-bare.git ~/.dotfiles


# oh my 
banner sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# p10
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
exec zsh


# plugins 
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
}



curl -L git.io/antigen > $HOME/antigen.zsh
source $HOME/.antigen.zsh
# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-syntax-highlighting
antigen bundle ellie/atuin@main

# Load the theme.
antigen theme powerlevel10k

# Tell Antigen that you're done.
antigen apply


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
DOTGITFILES=($(cmd ls-tree -r HEAD | awk '{print $NF}'))
BACKUPDIR=.dotfiles.backup
for f in "${DOTGITFILES[@]}"; do
  # File at root ==> back up file
  if [[ $(basename "$f") = "$f" ]]; then
    [[ -f "$HOME/$f" ]] && mkdir -p "$HOME/$BACKUPDIR" && mv "$HOME/$f" "$HOME/$BACKUPDIR" && echo "> Backing up: $f ==> $BACKUPDIR/$f"
  # File in nested directory ==> back up outermost directory
  else
    d=${f%%/*}
    echo "d = $d"
    echo "------------------------------------" 
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
