alias updatea='sudo apt update; sudo apt upgrade; sudo apt autoremove; '
alias hotspot='nmcli dev wifi hotspot ifname wlo1 ssid apeiron-garage password "replace_with_password"'
alias git-pull-all='find . -type d -name .git -exec git --git-dir={} --work-tree=$PWD/{}/.. pull origin master \;'
alias git_pull_all='git-pull-all'
alias moo='fortune | cowsay '
moo
