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
typeset -U config_files
#config_files=($ZSH/**/*.zsh)

# load the path files
for file in ${(M)config_files:#*/path.zsh}
do
     source "$file"  && echo "zfunc file load: $file"
done

  #fpath=($ZCOMPLETION$fpath)


#for file in ${${config_files:#*/path.zsh}:#*/completion.zsh}
#do
#  source $file
#done

# oh-my-posh theme
#if [[  -f ~/.poshthemes/kushal.omp.json ]]; then 
# eval "$(oh-my-posh --init --shell zsh --config ~/.poshthemes/kushal.omp.json)" 
#fi
ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME="astral"
#if ! [[ $(tty) = /dev/tty* ]]
#then
	#if source /home/xmg/.zsh/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme 2> /dev/null
	#then
		s=' ' # fix too wide icons
    POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
		POWERLEVEL9K_MODE=nerdfont-complete
		POWERLEVEL9K_SHORTEN_STRATEGY=truncate_beginning
		POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
		POWERLEVEL9K_PROMPT_ON_NEWLINE=true
		POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
		POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
		POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION='${P9K_CONTENT} $(whoami | grep -v "^root\$")'
		POWERLEVEL9K_OS_ICON_BACKGROUND=red
		POWERLEVEL9K_OS_ICON_FOREGROUND=white
		POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND=black
		POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND=red
		POWERLEVEL9K_SSH_BACKGROUND=white
		POWERLEVEL9K_SSH_FOREGROUND=blue
		POWERLEVEL9K_FOLDER_ICON=
		POWERLEVEL9K_DIR_BACKGROUND=blue
		POWERLEVEL9K_DIR_FOREGROUND=black
		POWERLEVEL9K_DIR_WRITABLE_BACKGROUND=black
		POWERLEVEL9K_DIR_WRITABLE_FOREGROUND=red
		POWERLEVEL9K_VCS_CLEAN_FOREGROUND=black
		POWERLEVEL9K_VCS_CLEAN_BACKGROUND=green
		POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=black
		POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=yellow
		POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=white
		POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=black
		POWERLEVEL9K_VCS_UNTRACKED_ICON=●
		POWERLEVEL9K_VCS_UNSTAGED_ICON=±
		POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=↓
		POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=↑
		POWERLEVEL9K_VCS_COMMIT_ICON=$s
		POWERLEVEL9K_STATUS_VERBOSE=false
		POWERLEVEL9K_STATUS_VERBOSE=false
		POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
		POWERLEVEL9K_EXECUTION_TIME_ICON=$s
		POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
		POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=black
		POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=blue
		POWERLEVEL9K_COMMAND_BACKGROUND_JOBS_BACKGROUND=black
		POWERLEVEL9K_COMMAND_BACKGROUND_JOBS_FOREGROUND=cyan
		POWERLEVEL9K_TIME_ICON=
		POWERLEVEL9K_TIME_FORMAT='%D{%I:%M}'
		POWERLEVEL9K_TIME_BACKGROUND=black
		POWERLEVEL9K_TIME_FOREGROUND=white
		POWERLEVEL9K_RAM_ICON=
		POWERLEVEL9K_RAM_FOREGROUND=black
		POWERLEVEL9K_RAM_BACKGROUND=yellow
		POWERLEVEL9K_VI_MODE_FOREGROUND=black
		POWERLEVEL9K_VI_COMMAND_MODE_STRING=NORMAL
		POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND=green
		POWERLEVEL9K_VI_VISUAL_MODE_STRING=VISUAL
		POWERLEVEL9K_VI_MODE_VISUAL_BACKGROUND=blue
		POWERLEVEL9K_VI_OVERWRITE_MODE_STRING=OVERTYPE
		POWERLEVEL9K_VI_MODE_OVERWRITE_BACKGROUND=red
		POWERLEVEL9K_VI_INSERT_MODE_STRING=
		POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL='\uE0B2'
		POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL='\uE0B0'
		POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='%F{blue}╭─'
		POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%F{blue}╰%f '
		POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon root_indicator ssh dir dir_writable vcs)
		POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode status command_execution_time background_jobs time ram)
		unset s
	#else
	#	echo '\033[33m[ ! ]\033[0m ZSH powerlevel10k not installed'
	#fi
  #fi


# Splitting the Zsh settings
#for file in $ZDOTCONFIGDIR/**/*(.N)
#do 
#    source "$file" > /dev/null 2>&1 && echo "config file load: $file"
#done


# zsh funktionen
#for file in $ZFUNC/**/*(.N)
#do 
#    source "$file"  && echo "zfunc file load: $file"
#done

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
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
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

#precmd() { "$(ps -ocommand= -p $PPID | awk '{print $1}')" script -f $LOG }


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

export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
# cache 
zstyle ':completion:*' use-cache on
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' cache-path "$ZSH/cache/.zcompdump-$HOST"

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
 

# host completion /* add brackets as vim can't parse zsh's complex cmdlines 8-) {{{ */
[ -r ~/.ssh/known_hosts ] && _ssh_hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
[ -r /etc/hosts ] && : ${(A)_etc_hosts:=${(s: :)${(ps:\t:)${${(f)~~"$(</etc/hosts)"}%%\#*}##[:blank:]#[^[:blank:]]#}}} || _etc_hosts=()


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
source $ZSH/oh-my-zsh.sh


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


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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