source /etc/profile

# https://github.com/zsh-users/zsh-completions
fpath=(~/.zsh/completion /usr/local/share/zsh-completions $fpath)
autoload -U compinit
compinit -u
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -ap zsh/mapfile mapfile

# Allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

# colors for ls: uses gls from the coreutils
eval `gdircolors ~/.dir_colors`

ZLS_COLORS="$LS_COLORS"
export ZLS_COLORS

zmodload zsh/complist
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:processes' command 'ps -xuf'
zstyle ':completion:*:processes' sort false
zstyle ':completion:*:processes-names' command 'ps xho command'
zstyle ':completion:*' menu select=long-list select=0
zstyle ':completion:*' old-menu false
zstyle ':completion:*' original true
zstyle ':completion:*' substitute 1
zstyle ':completion:*' use-compctl true
zstyle ':completion:*' verbose true
zstyle ':completion:*' word true

# For git
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
# zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' stagedstr "+"
zstyle ':vcs_info:*' unstagedstr "!"
zstyle ':vcs_info:*' formats '[%b%F{red}%c%u%F{green}]'
setopt PROMPT_SUBST

# History
export HISTFILE=~/.zhistory
SAVEHIST=5000
HISTSIZE=5000
setopt APPEND_HISTORY

# For sharing history between zsh processes
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

# Disable mail checking
MAILCHECK=0

autoload -U colors zsh/terminfo
colors

# File aliases
alias -s {avi,mpeg,mpg,mov,m2v,flv}=mplayer
alias -s log=less
alias -s blog=mvim

# Common aliases
alias ds="du -s ."
alias mvimdiff="mvim -d"
alias ls="gls --color=auto"
alias ll="gls -lh --color=auto"
alias reload="source ~/.zshrc"

# Git aliases
alias gc="git commit -a"
alias go="git checkout"
alias gob="git checkout -b"
alias gd="git diff"
alias gb="git branch"
alias gl="git lg"
alias gm="git merge"
alias gpod="git push origin develop"
alias gpud="git pull --rebase origin develop"
alias gpom="git push origin master"
alias gpum="git pull --rebase origin master"

# Android Studio alias
alias ast="open -a /Applications/Android\ Studio.app ."

# Hashes
hash -d wmL=~/work/mobile/LifelikeClassifieds
hash -d wmLL=~/work/mobile/LLAgentsClient
hash -d wm=~/work/mobile
hash -d wa=~/work/android
hash -d b=~/work/blogger
hash -d d=~/.dotfiles
hash -d wx=~/work/android/xbasoft
hash -d wmS=~/work/mobile/search-agents

# Errors autocorrection
setopt CORRECT_ALL
SPROMPT="Ошибка! Вы хотели ввести %r вместо %R? ([Y]es/[N]o/[E]dit/[A]bort) "

# Moving by dirs without cd
setopt autocd

# Prompt: red color for root and yellow for non-root
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE;
do
    eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
    eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
    (( count = $count + 1 ))
done
PR_NO_COLOUR="%{$terminfo[sgr0]%}"

if (( EUID == 0))
then
    eval PR_COLOR=$PR_RED
else
    eval PR_COLOR=$PR_YELLOW
fi

CDPATH=.:~:~/work

PATH=$PATH:~/work/android/android-sdk-macosx/tools/:~/bin

GIT_SSL_NO_VERIFY=1

# vi-mode settings
bindkey -v

case $TERM in
 xterm* | rxvt*)
     preexec() {print -Pn "\e]0;$1\a"}
     precmd()  {
         print -Pn "\e]0;%~\a"

         vcs_info
     }
     bindkey "^[[2~" yank
     bindkey "^[[3~" delete-char
     bindkey "^[[5~" up-line-or-history
     bindkey "^[[6~" down-line-or-history
     bindkey "^[[7~" beginning-of-line
     bindkey "^[[8~" end-of-line
     bindkey "^[e" expand-cmd-path ## C-e for expanding path of typed command
     bindkey "^[[A" up-line-or-search ## up arrow for back-history-search
     bindkey "^[[B" down-line-or-search ## down arrow for fwd-history-search
     bindkey " " magic-space ## do history expansion on space
     bindkey '^w' backward-kill-word
     bindkey '^r' history-incremental-search-backward
     bindkey '^?' backward-delete-char
     bindkey '^H' backward-delete-char
 ;;
esac

# F1 for opening help
autoload zsh/terminfo
bindkey $terminfo[kf1] run-help

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    RPROMPT="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

PROMPT='%B[(20%D) $PR_COLOR%n$PR_NO_COLOUR] $PR_WHITE%~%F{green}${vcs_info_msg_0_}$PR_WHITE%#$PR_NO_COLOUR '

# Sourcing of other files
source $HOME/.zsh/functions.zsh

export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim

# https://github.com/zsh-users/zsh-syntax-highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=magenta,bold'

# z - https://github.com/rupa/z
source "`brew --prefix`/etc/profile.d/z.sh"

# todotxt
export TODOTXT_DEFAULT_ACTION=ls
alias t=todo.sh
compdef t='todo.sh'
alias tb='todo.sh birdseye'

# hh - https://github.com/dvorka/hstr
export HH_CONFIG=hicolor,rawhistory
