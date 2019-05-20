#!/bin/bash
# Bash script to start TMUX with my shell. 

last_session=`tmux list-sessions| sort -k 8 | tail -1 | awk -F ":" '{print $1}'`

last_session_attached=`tmux list-sessions | grep $last_session | grep '(attached)'`

# Do nothing if already in TMUX
if [ -z $TMUX ]
then
	# If the last TMUX session is attached in another shell, open a new session
	if [ -z $last_session_attached ]
	then
		# If no TMUX sessions exist, open a new session
		if [ -z $last_session ]
		then
			tmux
		else
			# If sessions exist, attach to the last one
			tmux attach -t $last_session
		fi
	else
		tmux
	fi
fi
