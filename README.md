#!/bin/bash

GP="."

if [ ! "$2" = "" ]
then
        GP=$2
        echo "group is $2"
fi


if [ "$1" = "" ]
then
        echo "$0 repo_name group_name"
        exit
fi

echo "repo_name is $1 and group_name is $GP"

cd /opt/repo
mkdir $1
cd $1
git init
echo "this is for $1 project" > README
git add .
git commit -m "1st"
ln -s /opt/repo/$1/.git /home/git/repositories/$GP/$1.git
ls -l /home/git/repositories/$GP/
echo -e "[receive]\n\rdenyCurrentBranch = ignore" >  .git/config

