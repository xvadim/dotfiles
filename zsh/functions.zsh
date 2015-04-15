# shortcut for git. Without args - git status
function g {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status
  fi
}
# Actually set the compdef to git
compdef g=git

# make and cd to a dir
function take {
  mkdir $1
  cd $1
}

function xc {
    WORKSPACE=$(ls -dt *.xcworkspace 2> /dev/null | head -n 1)
    if [[ -n $WORKSPACE ]]; then
        open $WORKSPACE
    else
        PROJECT=$(ls -dt *.xcodeproj 2> /dev/null | head -n 1)
        if [[ -n $PROJECT ]]; then
            open $PROJECT
        fi
    fi
}

extr () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1 ;;
            *.tar.gz)    tar xzf $1 ;;
            *.bz2)       bunzip2 $1 ;;
            *.rar)       unrar x $1 ;;
            *.gz)        gunzip $1  ;;
            *.tar)       tar xf $1  ;;
            *.tbz2)      tar xjf $1 ;;
            *.tbz)       tar -xjvf $1;;
            *.tgz)       tar xzf $1 ;;
            *.zip)       unzip $1   ;;
            *.Z)         uncompress $1;;
            *.7z)        7z x $1    ;;
            *)           echo "I don't know how to extract '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

ra ()  {
    tempfile='/tmp/chosendir'
    EDITOR=mvim ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

# Automatically list directory contents on `cd`.
auto-ls () { ls; }
chpwd_functions=( auto-ls $chpwd_functions )
