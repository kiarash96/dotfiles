#!/bin/sh

# link spotify cache dirs to /tmp
mkdir -p /tmp/kiarash/.cache/spotify
ln -s /tmp/kiarash/.cache/spotify /home/kiarash/.cache/spotify

# create pacman cache dir
mkdir -p /tmp/pacman/pkg

# vim tmp dirs
mkdir -p /tmp/kiarash/.vim/backup
mkdir -p /tmp/kiarash/.vim/swap
mkdir -p /tmp/kiarash/.vim/undo

# fix permissions
chown -R kiarash /tmp/kiarash
chgrp -R users /tmp/kiarash

