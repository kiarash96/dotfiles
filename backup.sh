#!/bin/sh
#
# This script backups listed important files and creates a list of
# installed packages.
#

PKGS_FILE="pkgs.txt"
LIST_FILE="files.txt"

BACKUP_DIR="backup"

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

sed -i "s|~|$HOME|g" $LIST_FILE

while read -r line
do
    if [ ! -z "$line" ]; then
	list=$(find "$line" -type f 2> /dev/null)
        if [ -z "$list" ]; then
            echo "\033[1;31m$line was not found!\033[0m"
        fi
        for file in $list
        do
            backfile $file
        done
    fi
done < $LIST_FILE

echo "done."
