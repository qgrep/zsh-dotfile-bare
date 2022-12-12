
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
export ZDOTDIR=${HOME}/.zsh
export ZSH=${HOME}/.oh-my-zsh


# .zsh
export ZDOTCONFIGDIR=${ZDOTDIR}/config
export ZDOTPLUGINSDIR=${ZDOTDIR}/plugins
export ZFUNC=${ZDOTDIR}/zfunc
export ZCOMPLETION=${ZDOTDIR}/completion


# Default programs
[ -n "$DISPLAY" ] && export VISUAL="codium"     
[ -n "$DISPLAY" ] && export MDEDITOR="marktext"        || export BROWSER="nano"
[ -n "$DISPLAY" ] && export BROWSER="firefox"          || export BROWSER="lynx"
[ -n "$DISPLAY" ] && export NB_GUI_BROWSER="firefox"   || export BROWSER="lynx"
[ -n "$DISPLAY" ] && export IMAGEVIEWER="shotwell"     || export BROWSER="shotwell"


# go
if [ -d "$HOME/go" ]; then
  export GOPATH="$HOME/go"
fi
if [ ! -z "$GOPATH" ] && [ -d "$GOPATH/bin" ]; then
  export PATH="$GOPATH/bin:$PATH"
  export PATH=$PATH:/usr/local/go/bin
fi


# nvm
[ -d "$HOME/.nvm" ] && export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# cargo
[ -f "$HOME/.cargo/env" ] && source $HOME/.cargo/env


# java
[ -d "/usr/lib/jvm/default-java" ] && export JAVA_HOME="/usr/lib/jvm/default-java"


# path
#export PATH="$HOME/.local/bin:$PATH"
export PATH="/qq/lib/code/shell/snippets:$PATH"
#export PATH="/qq/dev/build/bash:$PATH"


# navi
[ -d "$HOME/.local/share/navi/cheats/" ] && export NAVI=$HOME/.local/share/navi/cheats/
# fzf
[ -d "/usr/bin/fzf" ] && export FZF_BASE=/usr/bin/fzf


# env 
export LANG="de_DE.UTF-8"
export DATUM=$(date "+%Y%m%d") #20220307
export DATUMUHRZEIT=$(date +%Y%m%d_%H:%M) #20220307_00:25
#export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"

export WARN="\r\033[2K  [\033[0;33mWARN\033[0m]"        # [warn]        
export HEAD="\r  [ \033[01;34m..\033[0m ]"              # [ .. ]
export ATTENTION="\r\033[2K  [ \033[0;31m!!\033[0m ]"   # [ !! ] 
export OK="\r\033[2K  [ \033[00;32mOK\033[0m ]"         # [ OK ] 
export FAIL="\r\033[2K  [\033[0;31mFAIL\033[0m]"        # [FAIL] 
export QUEST="\r  [ \033[0;33m??\033[0m ]"              # [ ?? ]