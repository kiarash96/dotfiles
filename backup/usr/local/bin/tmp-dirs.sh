#!/bin/sh

# mount points
mkdir -p /mnt/archive/
mkdir -p /mnt/data/

# user tmp dir
mkdir -p /tmp/kiarash/

# link spotify cache dirs to /tmp
mkdir -p /tmp/kiarash/.cache/spotify/Storage
mkdir -p /mnt/archive/cache/
ln -s /tmp/kiarash/.cache/spotify/ /mnt/archive/cache/
ln -s /mnt/archive/cache/spotify/ /home/kiarash/.cache/

# create pacman cache dir
mkdir -p /tmp/pacman/pkg/
mkdir -p /mnt/archive/
ln -s /tmp/pacman/pkg/ /mnt/archive/

# makepkg tmp dirs
mkdir -p /tmp/makepkg/build/
mkdir -p /tmp/makepkg/packages/
mkdir -p /tmp/makepkg/sources/
mkdir -p /tmp/makepkg/srcpackages/

# nvim tmp dirs
mkdir -p /tmp/kiarash/.nvim/backup/
mkdir -p /tmp/kiarash/.nvim/swap/
mkdir -p /tmp/kiarash/.nvim/undo/

# fix permissions
chown -R kiarash /tmp/kiarash/ /tmp/makepkg/
chgrp -R users /tmp/kiarash/ /tmp/makepkg/

