#!/bin/sh
# keepup with tmux
session="$(id -u -n)_keepup"

# function for executing stuff in a new tmux window and output a log
muxa () {
  n=$(basename $1)
	tmux has-session -t $session || tmux new-session -d -s $session
  pane=$(tmux neww -P -n $n -t $session "$@")
  tmux pipe-pane -t $pane "cat >~/keepup_$n.log"
}

# syncthing ecample
# pgrep syncthing || muxa syncthing -no-browser

# exmaple of a script
# pgrep -f script.sh || muxa ~/scripts/script.sh

# exmaple of starting a process as another user
# pgrep tor || muxa /usr/bin/su -c daemon -m _tor -c '/usr/local/bin/tor'

