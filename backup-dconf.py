#!/bin/env python3

import sys
import subprocess

import yaml


def backup(path, obj):
    if type(obj) == list:
        print('\n' + '[' + path[1:] + ']' + '\n', end='')
        for key in obj:
            result = subprocess.run(['dconf', 'read', path + '/' + key], capture_output=True)
            if result.stdout:
                print(key + '=' + result.stdout.decode(), end='')
            else:
                print('Nonexistent key: ' + path + '/' + key, file=sys.stderr)
        return

    for key,value in obj.items():
        backup(path + '/' + str(key).replace('.', '/'), value)

def main():
    with open('./watchlist-dconf.yml') as f:
        watchlist = yaml.safe_load(f)
    backup('', watchlist)

if __name__ == "__main__":
    main()

