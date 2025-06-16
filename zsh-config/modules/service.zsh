alias -g csdu="sudo systemctl start docker.socket"
alias -g csduf="sudo systemctl start docker.socket && sudo systemctl start docker.service"
alias -g csdd="sudo systemctl stop docker.socket && sudo systemctl stop docker.service"
