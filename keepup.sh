#!/bin/sh
# keepup with tmux
session="$(id -u -n)_keepup"

# function for executing stuff in a new tmux window and output a log
muxa () {
	tmux has-session -t $session || tmux new-session -d -s $session
	tmux neww -dn $1 -t $session "$@" \; pipe-pane -t $1 "cat > $1.log"
}

# syncthing ecample
# pgrep syncthing || muxa syncthing -no-browser

# exmaple of a script
# pgrep -f script.sh || muxa ~/scripts/script.sh

# exmaple of starting a process as another use
# pgrep tor || muxa /usr/bin/su -c daemon -m _tor -c '/usr/local/bin/tor'

# check that the external drive is mounted
# if ! mount | grep "/mnt/extern"; then
#         pgrep fsck || fsck -y /dev/sd1a && mount /dev/sd1a /mnt/extern
# fi fi
