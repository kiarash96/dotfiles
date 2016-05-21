#!/bin/sh
#
# This script backups listed important files and creates a list of
# installed packages and uploads them on github.
#

DEBUG="/dev/null"

PKGS_FILE="pkgs.txt"
LIST_FILE="files.txt"

TMP_DIR="/tmp/"
BACKUP_DIR="backup/"

# Backup $1 which is a file.
function backfile() {
    echo "Backing up $1"
    dir=$(dirname $1)
    name=$(basename $1)

    mkdir -p "$BACKUP_DIR/$dir"
    cp $1 "$BACKUP_DIR/$dir/$name"
}

rm -rf $BACKUP_DIR
mkdir -p $BACKUP_DIR

echo "Listing installed packages..."
pacman -Qeq > $PKGS_FILE
echo "done."



echo "Copying files..."

cp $LIST_FILE "$TMP_DIR/$LIST_FILE.tmp"
sed -i "s|~|$HOME|g" "$TMP_DIR/$LIST_FILE.tmp"

while read -r line
do
    if [ ! -z "$line" ]; then
        list=$(find "$line" -type f 2> $DEBUG)
        if [ -z "$list" ]; then
            echo -e "\033[1;31m$line was not found!\033[0m"
        fi
        for file in $list
        do
            backfile $file
        done
    fi
done < "$TMP_DIR/$LIST_FILE.tmp"

rm $"$TMP_DIR/$LIST_FILE.tmp"
echo "done."

git add .
git status

while : ; do
    read -p "commit and push? (y/n/d) " -n 1 choice
    echo
    
    if [ $choice == "d" ]; then
        git diff --staged
    else
        break
    fi
done

if [ $choice == "y" ]; then
    git commit
    echo "pushing..."
    git push origin master
    echo "done."
else
    git reset HEAD &> $DEBUG
    git clean -fd &> $DEBUG
    git add $LIST_FILE &> $DEBUG
    git checkout . &> $DEBUG
    git reset $LIST_FILE &> $DEBUG
fi


