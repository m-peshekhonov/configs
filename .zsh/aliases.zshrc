alias gmake="make"
alias df="df -h"
alias vi="vim"
alias ssh="ssh -A"

# if Mac OS
case `uname` in
    Darwin)
    alias l="ls -lahG"
    ;;
esac
# if Linux
case `uname` in
    Linux)
    alias l="ls -lahG --color=auto"
    ;;
esac
