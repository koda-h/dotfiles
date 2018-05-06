#!/bin/bash

[ ! $TMUX ] && tmux
[ $TMUX ] && tmux pipe-pane -o '/bin/sh -c "~/bin/tmux_logging.sh ~/.tmux/log #S #I #P local"'
