alias updatea='sudo apt update; sudo apt upgrade -y; sudo apt autoremove -y; sudo snap refresh; '

alias hotspot='nmcli dev wifi hotspot ifname wlo1 ssid apeiron-garage password "replace_with_password"'

alias git_pull_all='for i in */.git; do (cd $i/..; echo "** pulling ${i} ** branch: $(git rev-parse --abbrev-ref HEAD)"; git pull --recurse-submodules; echo ""; ); done'
alias rebase_from='bash ~/rebase_from.sh '

alias pipenv_lock='time pipenv lock --pre --clear'
alias pipenv_reinstall='pipenv uninstall --all; pipenv install --dev'

alias moo='fortune | cowsay '
moo
