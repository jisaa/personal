alias updatea='sudo apt update; sudo apt upgrade; sudo apt autoremove; '
alias hotspot='nmcli dev wifi hotspot ifname wlo1 ssid apeiron-garage password "replace_with_password"'
alias git-pull-all='for i in */.git; do ( echo "** pulling ${i} **"; cd $i/..; git pull --recurse-submodules; ); done'
alias git_pull_all='git-pull-all'
alias moo='fortune | cowsay '
moo
