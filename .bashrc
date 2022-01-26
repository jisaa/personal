alias updatea='sudo apt update; sudo apt upgrade; sudo apt autoremove; sudo snap refresh; '
alias hotspot='nmcli dev wifi hotspot ifname wlo1 ssid apeiron-garage password "replace_with_password"'
alias git-pull-all='for i in */.git; do (cd $i/..; echo "** pulling ${i} ** branch: $(git rev-parse --abbrev-ref HEAD)"; git pull --recurse-submodules; echo ""; ); done'
alias git_pull_all='git-pull-all'
alias moo='fortune | cowsay '
moo
