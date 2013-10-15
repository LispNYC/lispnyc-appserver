#!/bin/sh
tmux start-server
tmux new-session -d -s appserver -n exe
tmux send-keys      -t appserver:0 "./start.sh" C-m
tmux new-window     -t appserver:1 -n log
tmux split-window   -t appserver:1 -v -p 30

# get the latest log
LOG=`ls -1 -t ./logs/ | head -n 1`
tmux send-keys      -t appserver:1.0 "echo log is $LOG" C-m # upper pane
tmux send-keys      -t appserver:1.0 "sleep 3; tail -f ./logs/$LOG" C-m # upper pane

INFO=/tmp/readme.txt
cat > $INFO <<EOF
  prefix key is ^Z 
  log is tailed above 
  server launched in window 0
EOF
tmux send-keys      -t appserver:1.1 "cat $INFO; rm $INFO" C-m 

tmux attach-session -t appserver
