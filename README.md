# Usage

In a directory structure simimlar to this example:

<pre>
.
├── apply-script.sh
├── git-repo1
├── git-repo2
├── git-repo3
└── scripts
    ├── branch-diff.sh
    ├── checkout-branch.sh
    ├── checkout-master.sh
    ├── new-branch.sh
    ├── pull-branch.sh
    ├── pull-master.sh
    ├── reset-hard.sh
    ├── show-branch.sh
    └── status.sh
</pre>

You can use the following command

`./apply-script.sh <git-dir-pattern> [additional git-dir-patterns] ./scripts/<script-name.sh> [script-parameters ...]`

For example, if you wanted to show the current branch for all the git-repo directories you would

`./apply-script.sh git-repo* ./scripts/show-branch.sh`

If you wanted to create a new branch called FEATURE in git-repo1 and git-repo3 you would

`./apply-script.sh git-repo1 git-repo3 ./scripts/new-branch.sh FEATURE`
