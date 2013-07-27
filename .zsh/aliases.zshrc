alias gmake="make"
alias df="df -h"
alias vi="vim"
alias ssh="ssh -A"

case `uname` in
    # if Mac OS
    Darwin)
        alias l="ls -lahG"
    ;;
    # if Linux
    Linux)
        alias l="ls -lahG --color=auto"
    ;;
esac
