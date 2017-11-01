#!/bin/bash

# Expects: 
# $1	-	remote name
# $2	-	branch name
function checkRemoteBranch {
	echo $(git ls-remote --heads $1 $2 | wc -l)
}

# Expects:
# $1	-	branch name
function checkLocalBranch {
	echo $(git branch --list | grep -w $1 | wc -l)
}

# Expects
# $1	-	branch name
function isRemoteBranch {
	echo $(echo $1 | grep / | wc -l)	
}

localBranch=$1
targetBranch="origin/master"
gitDir=$2

if [ $# -lt 2 ]; then
	echo "Not enough parameters: Expecting <source-local-branch> [target-branch] <git-dir>"
	exit 1
fi

if [ $# -eq 3 ]; then
	gitDir=$3
	targetBranch=$2
fi

cd $gitDir

echo "+ $gitDir"
echo ""

isRemoteBranch="$(isRemoteBranch $targetBranch)"
branchExists="1";
if [ $isRemoteBranch -eq 1 ]; then
	remoteName="$(echo $targetBranch | cut -d / -f 1)"
	remoteBranchName="$(echo $targetBranch | cut -d / -f 2)"
	branchExists="$(checkRemoteBranch $remoteName $remoteBranchName)"	
else
	branchExists="$(checkLocalBranch $targetBranch)"
fi

if [ $branchExists -eq 1 ]; then
	echo "---- diff start ----"
	git --no-pager diff --name-only $localBranch $targetBranch
	echo "----- diff end -----"
	
else 
	echo "Branch $targetBranch does not exist"
fi
echo ""
echo ""
cd ../
