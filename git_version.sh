#!/bin/sh

BRANCHES=`git branch` || exit
# 'git branch' give output like:
#   master
# * developer
# or:
# * (no branch)
#   master
#   developer
# current branch has '*'
BRANCH=`
    echo "$BRANCHES" | awk '{
        if ($1 == "*") {
            if ($0 != "* (no branch)" ) {
                print "_" $2
            }
        }
    }'
` || exit

STAT=`git status --porcelain --untracked-files=no` || exit
if [ "x$STAT" = "x" ]; then
    dirty=""
else
    dirty="_dirty"
fi

LAST_COMMIT=`git rev-list HEAD --max-count=1` || exit
if [ "x$LAST_COMMIT" = "x" ]; then
    echo "$0: 'git rev-list head' return nothing" 1>&2
    exit 1
fi

TAG=`git describe --tags $LAST_COMMIT` || exit
if [ "x$TAG" = "x" ]; then
    echo "$0: 'git descibe' return nothing" 1>&2
    exit 1
fi

GIT_VERSION="$TAG$BRANCH$dirty"
echo "$GIT_VERSION"

exit 0
