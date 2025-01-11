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
alias a="alias"
alias ds="du -s ."
alias mvimdiff="mvim -d"
# alias ls="gls --color=auto"
# alias ll="gls -lh --color=auto"
alias ls="eza --icons --color=auto"
alias ll="eza --icons -lh --color=auto"
alias reload="source ~/.zshrc"
alias o="open ."
alias m="make"

# Git aliases
alias gc="git commit -a"
alias go="git checkout"
alias gob="git checkout -b"
alias gd="git diff"
alias gb="git branch"
alias gl="git lg"
alias gm="git merge"
alias gpo="git push origin"
alias gpu="git pull --rebase origin"
alias gpom="git push origin master"
alias gpum="git pull --rebase origin master"

# Android Studio alias
alias ast="open -a /Applications/Android\ Studio.app ."

# Flutter aliases
alias fu="flutter upgrade"

# Hashes
hash -d wm=~/work/mobile
hash -d wa=~/work/android
hash -d d=~/.dotfiles
hash -d wx=~/work/android/xbasoft

# Errors autocorrection
setopt CORRECT_ALL
SPROMPT="Помилка! Ви хотіли ввести %r замість %R? ([Y]es/[N]o/[E]dit/[A]bort) "


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

PATH=$PATH:~/work/android/android-sdk-macosx/tools/:~/bin:~/work/android/flutter/flutter/.pub-cache/bin:~/.pub-cache/bin
PATH=~/work/android/flutter/flutter/bin:$PATH

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
RPROMPT=$'%(?,%{\e[34m%}%m%{\e[0m%},%{\e[1;31m%}:(%{\e[0m%})'

# Sourcing of other files
source $HOME/.zsh/functions.zsh

export EDITOR=nvim

# https://github.com/zsh-users/zsh-syntax-highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=magenta,bold'

# todotxt
export TODOTXT_DEFAULT_ACTION=ls
alias t=todo.sh
compdef t='todo.sh'
alias tb='todo.sh birdseye'
alias ta='tp adda'

# nginx
alias nginx.start='sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.nginx.plist'
alias nginx.stop='sudo launchctl unload /Library/LaunchDaemons/homebrew.mxcl.nginx.plist'
alias nginx.restart='nginx.stop && nginx.start'

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/vadimkhohlov/.dart-cli-completion/zsh-config.zsh ]] && . /Users/vadimkhohlov/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

# Spaceship prompt
# https://github.com/spaceship-prompt
#
source ~/.zsh/spaceship/spaceship-flutter/spaceship-flutter.plugin.zsh
# must be placed after all additional plugins
source "/usr/local/opt/spaceship/spaceship.zsh"

# FZF
# https://github.com/junegunn/fzf
#
eval "$(fzf --zsh)"

# --- setup fzf theme ---
fg="#CBE0F0"
bg="#011628"
bg_highlight="#143652"
purple="#B388FF"
blue="#06BCE4"
cyan="#2CF9ED"

export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}
show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# Bat (better cat) 
# https://github.com/sharkdp/bat

export BAT_THEME=tokyonight_night

# Zoxide (better cd) 
# https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init zsh)"

