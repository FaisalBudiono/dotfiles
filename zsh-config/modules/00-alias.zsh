alias -g ccda="source $ZSH_CONFIG_PATH/zsh-config/cd-add-fzf.sh"
alias -g ccd="source $ZSH_CONFIG_PATH/zsh-config/cd-fzf.sh"
alias -g ccde="nvim $ZSH_CONFIG_PATH/zsh-config/local/fzf.txt"
alias -g cchown="sudo chown -R ucul:ucul"
alias -g ccurl="curl -# -w \"@$ZSH_CONFIG_PATH/zsh-config/curl-format.txt\""
alias -g cdc="comhel"
alias -g cdcd="docker compose down --remove-orphans"
alias -g cdcex="docker compose exec"
alias -g cdcub="docker compose up -d --build"
alias -g cdcu="docker compose up -d"
alias -g cddb="docker build -t kambing ."
alias -g cde="docker exec -ti"
alias -g cgbn="git branch --show-current"
alias -g cgca="git commit --amend"
alias -g cgcf="git commit --fixup"
alias -g cgd="git branch -d"
alias -g cgD="git branch -D"
alias -g cgdgone="git branch -vv | awk '/: gone\]/{print \$1}' | xargs git branch -d"
alias -g cgf="git fetch --all --prune"
alias -g cgg="git log --oneline --pretty=oneline --graph"
alias -g cggv="git log --pretty=full --graph"
alias -g cggvv="git log --pretty=fuller --graph"
alias -g cgot="go test -v ./..."
alias -g cgpru="cgprune"
alias -g cgprune="git remote prune origin"
alias -g cgri="git rebase --rebase-merges -i"
alias -g cgrm="git rebase --rebase-merges"
alias -g cgst="git switch -t"
alias -g cl="clear"
alias -g ctm="source $ZSH_CONFIG_PATH/zsh-config/tmux-switcher.sh"
alias -g v="nvim"

function cddr {
    docker rm -f kuda
    docker run --rm -ti --name kuda $@ kambing 
}

function cddrp {
    FIRST_PARAM=$1
    shift
    REST_PARAM=$@

    docker rm -f kuda
    docker run -d --name kuda -p $FIRST_PARAM kambing $REST_PARAM
}

function cts {
    tmux swapw -t $1 -s $2
}
