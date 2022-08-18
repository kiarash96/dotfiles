# Dotfiles
My linux configuration files are stored here.

## Usage
1. Install python dependencies: `python3 -m venv venv && . venv/bin/activate &&
   pip install -r requirements.txt`
2. Create a folder for your machine. The script uses `hostname` output as
   machine name.
3. Edit `watchlist` as needed. You can add files or directories. If you add a
   directory all files in that directory will be backed up.
4. Edit `dconf-watchlist.yml` as needed.
5. Run `backup` script to copy listed files in `rootfs` directory.
6. Commit and push the changes.
