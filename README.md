## Tmux keepup script
This is simple concept script for how I run _most_ of my backgroud process instead of cron or systemd on my servers and devices for three main reasons:
* It's an easy and transparent way to check a process status if you use tmux anyways
* It works the same on all my os's
* It is easy to configure and setup

I hope you can make use of this and expand/change it to your preferens, however it works as is for basic things like the examples included.

## Concept
Start and keep background process running directly in a tmux session.

By attaching with tmux ``tmux attach`` and pressing ``ctrl-b s`` you can directly see what processes that are running and switch to their window to see their current output.
If you can't see the process your looking for, just check it's specific log file for the latest status.

## Setup
Schedule the keepup.sh in cron or systemd to run every minute or so.

## Dependencies
tmux

## Hints
If you run this script as root, do ``su -l`` before ``tmux attach``

For processes you like to run for example every 5 minute, just add them to a shell script and add a sleep call at the end of that script, and use that a entry for the keepup script together with ``pgrep -f``

Also push in things you like to check and the get the latest status of in the same way.

