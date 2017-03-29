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
backfile() {
    echo "Backing up $1"
    dir=$(dirname $1)
    name=$(basename $1)

    mkdir -p "$BACKUP_DIR/$dir"
    cp $1 "$BACKUP_DIR/$dir/$name"
}

rm -rf $BACKUP_DIR
mkdir -p $BACKUP_DIR

echo "Listing installed packages..."
xbps-query -m > $PKGS_FILE
echo "done."



echo "Copying files..."

cp $LIST_FILE "$TMP_DIR/$LIST_FILE.tmp"
sed -i "s|~|$HOME|g" "$TMP_DIR/$LIST_FILE.tmp"

while read -r line
do
    if [ ! -z "$line" ]; then
        list=$(find "$line" -type f 2> $DEBUG)
        if [ -z "$list" ]; then
            echo "\033[1;31m$line was not found!\033[0m"
        fi
        for file in $list
        do
            backfile $file
        done
    fi
done < "$TMP_DIR/$LIST_FILE.tmp"

rm "$TMP_DIR/$LIST_FILE.tmp"
echo "done."
exit

while : ; do
    git status
    read -p "Commit and push? (y/a/d/q) " -n 1 choice
    echo
    
    if [ $choice == "a" ]; then
        git add -i
    elif [ $choice == "d" ]; then
        git diff --staged
    elif [ $choice == "y" ]; then
        git commit
        echo "pushing..."
        git push origin master
        echo "done."
        break
    else
        echo "Reseting to original state..."
        break
    fi
done

git reset HEAD &> $DEBUG
git clean -fd &> $DEBUG
git add $LIST_FILE &> $DEBUG
git checkout . &> $DEBUG
git reset $LIST_FILE &> $DEBUG

