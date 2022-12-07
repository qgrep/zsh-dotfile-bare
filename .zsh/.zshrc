#################################################################
#                        .zshrc                                 #
#################################################################
# What goes in i                                                #
#  Befehle zum Einrichten von                                   #
#  Aliasen                                                      #
#  Funktionen                                                   #
#  Optionen                                                     #
#  Tastenbelegungen                                             #
#  zur interaktiven Nutzung etc.                                #
#################################################################

#!/usr/bin/env zsh

# Splitting the Zsh settings
for file in $ZDOTCONFIGDIR/**/*(.N)
do 
    source "$file" > /dev/null 2>&1 && echo "config file load: $file"
done


# zsh funktionen
for file in $ZFUNC/**/*(.N)
do 
    source "$file"  && echo "zfunc file load: $file"
done

# all of our zsh files
#typeset -U config_files
#config_files=($ZSH/**/*.zsh)

# load the path files
#for file in ${(M)config_files:#*/path.zsh}
#do
#     source "$file"  && echo "zfunc file load: $file"
#done

#for file in ${${config_files:#*/path.zsh}:#*/completion.zsh}
#do
#  source $file
#done


# Sofortige Powerlevel10k-Eingabeaufforderung aktivieren.
# Sollte nahe am Anfang von ~/.zshrc bleiben.
# Initialisierungscode, der möglicherweise eine Konsoleneingabe erfordert (Passwortabfragen, [y/n]
# Bestätigungen usw.) müssen über diesen Block gehen;  alles andere kann unten stehen.

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
#typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# standart öffnen mit
alias -s {index}="$BROWSER"
alias -s {txt,md}="$MDEDITOR"
alias -s {gif,GIF,jpeg,JPEG,jpg,JPG,png,PNG}="$IMAGEVIEWER"

# VSCode
#if [[ $TERM_PROGRAM == "vscode" ]]; then
  # start a tmux session
#  if [[ $VSCODE_TERM_PROFILE == "tmux" ]]; then
#    if [ -z "$TMUX" ]; then
#      $HOME/.dotfiles/scripts/tmux-folder-session.sh
#    fi
#  fi
#fi


#LOG="/var/log/session/$user_$(date +"%d-%b-%y")"
#    test "$(ps -ocommand= -p $PPID | awk '{print $1}')" = 'script' || 
#  for ((i=-0 ; i <= 100 ; i++)); do printf ✀; done >> $LOG
#        echo -e "PID=$$\n" >> $LOG
#            (script -fa $LOG)
#LOG="/var/log/session/$(date +"%H_%M_%S-$USER-%d-%b-%y"_$$)"
#test "$(ps -ocommand= -p $PPID | awk '{print $1}')" = 'script' || script -f $LOG
#echo $TTY
#test "$(ps -aux | grep $PPID | grep -q script) -eq 0)" | echo -e "$CHECK_MARK FUNCNAME" ||  echo -e  "$MARKCROSS FUNCNAME";
#precmd() { "$(ps -ocommand= -p $PPID | awk '{print $1}')" script -f $LOG }


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Abschluss ohne Berücksichtigung der Groß-/Kleinschreibung l
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'


# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
  zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time


# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"


# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# Highlight the current autocomplete option
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Better SSH/Rsync/SCP Autocomplete
zstyle ':completion:*:(scp|rsync):*' tag-order ' hosts:-ipaddr:ip\ address hosts:-host:host files'
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'

# fzf -tab gänge configs
# disable sort when completing `git checkout`
  #zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
  #zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
  zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
  zstyle ':fzf-tab:*' switch-group ',' '.'

# Allow for autocomplete to be case insensitive
#zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' \
#  '+l:|?=** r:|?=**'

# cache 
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

# Load compsys
zmodload zsh/complist
autoload -Uz compinit
compinit
# And set some styles...
zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:*:descriptions' format "- %d -"
zstyle ':completion:*:corrections' format "- %d - (errors %e})"
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose yes
zstyle ':completion:*' rehash yes
zstyle -e ':completion:*:approximate:*' max-errors \
          'reply=( $(( ($#PREFIX + $#SUFFIX) / 3 )) )'


# complete manual by their section
zstyle ':completion:*:manuals'                      separate-sections true
zstyle ':completion:*:manuals.*'                    insert-sections   true
zstyle ':completion:*:man:*'                        menu yes select

# Persistent rehash
zstyle ':completion:*' rehash true

# faerbt man-pages ein
man() {
env \
LESS_TERMCAP_mb=$(printf "\e[1;31m") \
LESS_TERMCAP_md=$(printf "\e[1;31m") \
LESS_TERMCAP_me=$(printf "\e[0m") \
LESS_TERMCAP_se=$(printf "\e[0m") \
LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
LESS_TERMCAP_ue=$(printf "\e[0m") \
LESS_TERMCAP_us=$(printf "\e[1;32m") \
man "$@"
}






# host completion /* add brackets as vim can't parse zsh's complex cmdlines 8-) {{{ */
[ -r ~/.ssh/known_hosts ] && _ssh_hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
[ -r /etc/hosts ] && : ${(A)_etc_hosts:=${(s: :)${(ps:\t:)${${(f)~~"$(</etc/hosts)"}%%\#*}##[:blank:]#[^[:blank:]]#}}} || _etc_hosts=()

hosts=(`hostname` "$_ssh_hosts[@]" "$_etc_hosts[@]" localhost)
zstyle ':completion:*:hosts'                        hosts $hosts


# Zurücksetzen des Terminals mit Escape-Sequenzen # test= print '\e(0\e)B'
autoload -Uz add-zsh-hook

 Funktion reset_broken_terminal () {
	 printf '%b' '\e[0m\e(B\e)0\017\e[?5l\e7\e[0;0r\e8'
 }
 add-zsh-hook -Uz precmd reset_broken_terminal 






# Initialize the autocompletion
autoload -Uz compinit && compinit -i	

plugins=(
  adb
  ag
  aliases           #acs
  alias-finder
  git 
  sudo
  pip               #The pip plugin caches the names of available pip packages from the PyPI index run for directly cache   $ zsh-pip-cache-packages
  copypath
  copyfile
  gh
  extract
  copybuffer
  dirhistory
  tmux
  tmux-cssh
  extract
  tmuxinator
  nanoc
  ufw
  catimg
  copybuffer        # ctrl-o
  rsync
  zsh-abbr
  mosh
  nmap
  emoji
  docker
  adb
  tig               # git status
  ag
  fd
  web-search
  zsh-interactive-cd
  zsh-syntax-highlighting
  adb
  git
  bundler
  dotenv
  rake
  rbenv
  ruby
  npm 
  zsh-autosuggestions
  fzf
)
source "${ZSH}/oh-my-zsh.sh"
ZSH_THEME="powerlevel10k/powerlevel10k" 
# bindkey
bindkey "^[[1;5D" beginning-of-line # CTRL + <
bindkey "^[OH"    beginning-of-line # HOME
bindkey "^[[1;5C" end-of-line       # CTRL + >
bindkey "^[OF"    end-of-line       # END
bindkey "^[[1;3D" backward-word     # ALT  + <
bindkey "^[[1;3C" forward-word      # ALT  + >
bindkey "^[[3~"   delete-char       # DELETE
bindkey "^[[A"    history-search-backward # up   arrow
bindkey "^[[B"    history-search-forward  # down arrow
bindkey "^[[2~"   overwrite-mode          # Insert

bindkey '^[h'     backward-word        # Alt + h
bindkey '^[l'     forward-word         # Alt + l
bindkey '^[j'     backward-char        # Alt + j
bindkey '^[k'     forward-char         # Alt + k
 


bindkey '^[y'     backward-delete-word # Alt + y
bindkey '^[o'     delete-word  # Alt + o
bindkey '^[u'     backward-delete-char # Alt + u
bindkey '^[i'     delete-char  # Alt + i

bindkey '^[^H'    backward-delete-word # Ctrl + h
bindkey '^[^L'    delete-word          # Ctrl + l
bindkey '^[y'     redo                 # Alt + y
bindkey '^[z'     undo                 # Alt + z
#bindkey '^L'      clear-screen         # Ctrl + l

# showkey -a  
bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line


# atuin
eval "$(atuin init zsh)"
bindkey '^r' _atuin_search_widget
bindkey '^[[A' _atuin_search_widget
bindkey '^[OA' _atuin_search_widget
export ATUIN_NOBIND="true"


# navi Ctrl+G is assigned to launching navi
eval "$(navi widget zsh)"


# fpath 
#fpath=($ZDOTDIR/completion $fpath)
#fpath=(~/Coding/shell/snippets $fpath)
#fpath=(~/Coding/shell/skripte $fpath)
#autoload -Uz compinit && compinit -i


fpath=(
	$ZFUNC(N-/)
	$ZCOMPLETION(N-/)
	$ZDOTCONFIGDIR(N-/)
	$ZDOTPLUGINSDIR(N-/)
	#/usr/local/share/zsh/site-functions(N-/)
	#/usr/share/zsh/site-functions(N-/)
	$fpath
)
export FPATH

#ENABLE_CORRECTION
#setopt CORRECT
#setopt CORRECT_ALL 

# export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then

# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# remove alias
# unalias -m '*'
unalias cucumber
unalias gcas
unalias gcasm
unalias gcb
unalias gcd
unalias gcf
unalias gclean
unalias gcm
unalias gco
unalias gwt
unalias gwta
unalias gwtls
unalias gwtmv
unalias gwtrm
unalias irb
unalias jekyll
unalias jimweirich
unalias kitchen
unalias knife
unalias nanoc
unalias pry
unalias puma
unalias sgem
unalias shotgun
unalias sidekiq
unalias spec
unalias srake
unalias stackoverflow
unalias strainer
unalias taps
unalias thin
unalias thor
unalias ba
unalias bi
unalias brake
unalias cap
unalias g
unalias ga
unalias gaa
unalias gam
unalias gama
unalias gams
unalias gamscp
unalias gap
unalias gapa
unalias gapt
unalias gau
unalias gav
unalias gb
unalias gbD
unalias gba
unalias gbd
unalias gbda
unalias gbl
unalias gbnm
unalias gbr
unalias gbs
unalias gbsb
unalias gbsg
unalias gbsr
unalias gbss
unalias gc
unalias gd
unalias gdca
unalias gdct
unalias gds
unalias gdt
unalias gdup
unalias gdw
unalias gf
unalias gfa
unalias gfg
unalias gfo
unalias gg
unalias gga
unalias ggpull
unalias ggpush
unalias ggsup
unalias ghh
unalias gignore
unalias gignored
unalias gk
unalias gke
unalias gl
unalias glg
unalias glgg
unalias glgga
unalias glgm
unalias glgp
unalias glo
unalias glod
unalias glods
unalias glog
unalias gloga
unalias glol
unalias glola
unalias glols
unalias glp
unalias gluc
unalias glum
unalias gmom
unalias gmtl
unalias gmtlvim
unalias gmum
unalias gpu
unalias gpv
unalias gr
unalias gra
unalias grb
unalias grba
unalias grbc
unalias grbd
unalias grbi
unalias grbm
unalias grbo
unalias grbom
unalias grev
unalias grh
unalias grm
unalias grmc
unalias grmv
unalias groh
unalias grrm
unalias grs
unalias grset
unalias grss
unalias grst
unalias grt
unalias gru
unalias grup
unalias grv
unalias gsd
unalias gsb
unalias gsi
unalias gstc
unalias gstd
unalias gstl
unalias gstp
unalias gsts
unalias gsu
unalias gamc
unalias gca
unalias gcam
unalias gcl
unalias gcmsg
unalias gcp
unalias gcpa
unalias gcpc
unalias gcs
unalias gcsm
unalias gcss
unalias gcssm
unalias gm
unalias gma
unalias gp
unalias gpd
unalias gpr
unalias gpsup
unalias grbs
unalias grhh
unalias gsh
unalias gsps
unalias gc!
unalias gca!
unalias gcan!
unalias gcans!
unalias gcn!
unalias gcor
unalias gcount
unalias git-svn-dcommit-push
unalias gpf
unalias gpf!
unalias gpoat
unalias gpristine
unalias gsr
unalias gss
unalias gst
unalias gsta
unalias gstaa
unalias gstall
unalias gsw
unalias gswc
unalias gswd
unalias gswm
unalias gtl
unalias gts
unalias gtv
unalias gunignore
unalias gup
unalias gupa
unalias gupav
unalias gupom
unalias gupv
unalias gupomi
unalias gwch
unalias gwip
unalias gdcw
unalias gunwip

#################################################################
#                        .zshenv                                #
#################################################################
# What goes in i                                                #
#   Befehlssuchpfad                                             #
#   Andere wichtige Umgebungsvariablen                          #
#   Befehle zum Einrichten von Aliassen und Funktionen, die     #
#   für andere Skripte benötigt werden                          #
#################################################################
# What does NOT go in it                                        # 
#   Befehle, die eine Ausgabe erzeugen                          #
#   Alles, was die Shell voraussetzt, wird an ein tty angehängt # 
#################################################################

###############################
# EXPORT ENVIRONMENT VARIABLE #
###############################

# XDG
#export XDG_CONFIG_HOME="$HOME/.config"     #  Wo benutzerspezifische Konfigurationen geschrieben werden sollen (analog zu /etc
export XDG_CACHE_HOME="$HOME/.cache"        #  Wo benutzerspezifische nicht wesentliche (gecachte) Daten geschrieben werden sollen (analog zu /var/cache). 
#export XDG_DATA_HOME="$HOME/.local/share"   #  Wo benutzerspezifische Datendateien geschrieben werden sollen (analog zu /usr/share). 
#export XDG_STATE_HOME="$HOME/.local/state"  #  Wo benutzerspezifische Zustandsdateien geschrieben werden sollen (analog zu /var/lib). 
#export XDG_RUNTIME_DIR="/run/user/$UID"     #  Wird für nicht wesentliche, benutzerspezifische Datendateien wie Sockets, Named Pipes usw. verwendet.
                                            #  Kein Standardwert erforderlich; Warnungen sollten ausgegeben werden, wenn sie nicht gesetzt sind, oder Äquivalente bereitgestellt werden.
                                            #  Muss dem Benutzer mit einem Zugriffsmodus von gehören 0700.
                                            #  Dateisystem, das nach den Standards des Betriebssystems vollständig ausgestattet ist.
                                            #  Muss sich auf dem lokalen Dateisystem befinden.
                                            #  Kann regelmäßig gereinigt werden.
                                            #  Alle 6 Stunden geändert oder Sticky Bit gesetzt, wenn Persistenz gewünscht wird.
                                            #  Kann nur für die Dauer der Anmeldung des Benutzers bestehen.
                                            #  Sollte keine großen Dateien speichern, da sie möglicherweise als tmpfs gemountet werden.
                                            #  pam_systemd setzt dies auf /run/user/$UID. 
# zsh                                        
export DOTFILES=${HOME}/.dotfiles
export ZDOTDIR=${HOME}/.zsh
export ZSH=${HOME}/.oh-my-zsh


# .zsh
export ZDOTCONFIGDIR=${ZDOTDIR}/config
export ZDOTPLUGINSDIR=${ZDOTDIR}/plugins
export ZFUNC=${ZDOTDIR}/zfunc
export ZCOMPLETION=${ZDOTDIR}/completion




# navi
export NAVI=$HOME/.local/share/navi/cheats/





# Default programs
[ -n "$DISPLAY" ] && export VISUAL="codium"     
[ -n "$DISPLAY" ] && export MDEDITOR="marktext"        || export BROWSER="nano"
[ -n "$DISPLAY" ] && export BROWSER="firefox"          || export BROWSER="lynx"
[ -n "$DISPLAY" ] && export NB_GUI_BROWSER="firefox"   || export BROWSER="lynx"
[ -n "$DISPLAY" ] && export IMAGEVIEWER="shotwell"     || export BROWSER="shotwell"

#test "$?" -eq 0 echo -e "$CHECK_MARK FUNCNAME" || echo -e  "$MARKCROSS FUNCNAME";

# env 
export LANG="de_DE.UTF-8"
export DATUM=$(date "+%Y%m%d") #20220307
export DATUMUHRZEIT=$(date +%Y%m%d_%H:%M) #20220307_00:25
#export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"


# fzf
export FZF_BASE=/usr/bin/fzf


# go
if [ -d "$HOME/go" ]; then
  export GOPATH="$HOME/go"
fi
if [ ! -z "$GOPATH" ] && [ -d "$GOPATH/bin" ]; then
  export PATH="$GOPATH/bin:$PATH"
  export PATH=$PATH:/usr/local/go/bin
fi


# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# cargo
 source $HOME/.cargo/env

# java
export JAVA_HOME="/usr/lib/jvm/default-java"


# path
#export PATH="$HOME/.local/bin:$PATH"
export PATH="/qq/lib/code/shell/snippets:$PATH"
#export PATH="/qq/dev/build/bash:$PATH"



export WARN="\r\033[2K  [\033[0;33mWARN\033[0m]"        # [warn]        
export HEAD="\r  [ \033[01;34m..\033[0m ]"              # [ .. ]
export ATTENTION="\r\033[2K  [ \033[0;31m!!\033[0m ]"   # [ !! ] 
export OK="\r\033[2K  [ \033[00;32mOK\033[0m ]"         # [ OK ] 
export FAIL="\r\033[2K  [\033[0;31mFAIL\033[0m]"        # [FAIL] 
export QUEST="\r  [ \033[0;33m??\033[0m ]"              # [ ?? ]
