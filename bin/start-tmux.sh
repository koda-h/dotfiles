#!/bin/bash

[ ! $TMUX ] && touch /var/tmp/start-tmux && tmux
if [ $TMUX -a -f "/var/tmp/start-tmux" ]; then
  tmux pipe-pane -o '/bin/sh -c "~/bin/tmux_logging.sh ~/.tmux/log #S #I #P local"'
  rm /var/tmp/start-tmux
fi
