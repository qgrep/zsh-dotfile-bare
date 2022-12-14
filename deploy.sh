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


alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME $@'

#------------------------------------------------------------------------------#
# Download
#------------------------------------------------------------------------------#
echo "> Downloading dotfiles..."


dot clone --bare --recurse-submodules https://github.com/qgrep/zsh-dotfile-bare.git "$HOME/.dotfiles"

#wget -O /tmp/deploy.sh --no-check-certificate --content-disposition   https://raw.githubusercontent.com/qgrep/zsh-dotfile-bare/main/deploy.sh && chmod +x /tmp/deploy.sh && source /tmp/deploy.shdot() { git --git-dir="$HOME/$ddasdas" --work-tree="$HOME" "$@"; }

#------------------------------------------------------------------------------#
# Backup already existing dotfiles
#------------------------------------------------------------------------------#
#files=($(dot ls-tree -r HEAD | awk '{print $NF}'))
#bkp=.dotfiles.backup
#for f in "${files[@]}"; do
#  # File at root ==> back up file
#  if [[ $(basename "$f") = "$f" ]]; then
#    [[ -f "$HOME/$f" ]] && mkdir -p "$HOME/$bkp" && mv "$HOME/$f" "$HOME/$bkp" && echo "> Backing up: $f ==> $bkp/$f"
  # File in nested directory ==> back up outermost directory
#  else
#    d=${f%%/*}
#    if [[ -d "$HOME/$d" ]]; then
#      [[ -d "$HOME/$bkp/$d" ]] && rm -rf "$HOME/$bkp/$d"
#      mkdir -p "$HOME/$bkp" && mv "$HOME/$d" "$HOME/$bkp" && echo "> Backing up: $d/ ==> $bkp/$d/"
#    fi
#  fi
#done

#------------------------------------------------------------------------------#
# Install
#------------------------------------------------------------------------------#
#dot checkout
#dot submodule init
#dot submodule update
#dot config status.showUntrackedFiles no
#echo "> Success! The following dotfiles have been installed to $HOME:"
#printf '    %s\n' "${files[@]}"

git clone --bare https://github.com/qgrep/zsh-dotfile-bare.git $HOME/.dotfiles
function config {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no