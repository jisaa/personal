# fail if there is no base branch specified
if [ $# -eq 0 ]
then
	echo "Error, must specify base branch."
	exit
fi

baseBranch=$1

# check that base branch is different from current branch
currentBranch=`git symbolic-ref --short HEAD`
if [ $currentBranch = $baseBranch ]
then
	echo "Can't rebase from current branch, aborting."
	exit
fi

# check that base branch exists
git checkout $baseBranch
if [ ! $? -eq 0 ]
then
	echo "Error pulling base branch, aborting."
	exit
fi

# make sure that the base branch is up to date
git pull
# go back to the feature branch
git checkout -
# the -i option lets you rewrite commit messages
git rebase -i $baseBranch

if [ ! $? -eq 0 ]
then
	echo "Error rebasing, time to fix conflicts."
	exit
fi

git status

# ask for confirmation to rewrite history on the remote
read -p "Force push to remote? [y/N] " forcePush
forcePush="${forcePush:-n}"
if [ $forcePush = "y" ]
then
	git push --force
fi
