
#Auto Start Tmux Session
  if [[ -z "$TMUX" ]] ;then
    ID="`tmux ls | grep -vm1 attached | cut -d: -f1`" # get the id of a deattached session
    if [[ -z "$ID" ]] ;then # if not available create a new one
        tmux new-session
    else
        tmux attach-session -t "$ID" # if available attach to it
    fi
fi

#Multiple Screen Sessions in Tmux
  if [ -z "$TMUX" ] && [ -z "$DISPLAY" ] && [ -z "$TERM_PROGRAM" ]; then
    base_session="${USER}_session"
    # Create a new session if it doesn't exist
    tmux has-session -t $base_session || tmux new-session -d -s $base_session

    client_cnt=$(tmux list-clients | wc -l)
    # Are there any clients connected already?
    if [ $client_cnt -ge 1 ]; then
        client_id=0
        session_name=$base_session"-"$client_id
        while [ $(tmux has-session -t $session_name 2>& /dev/null; echo $?) -ne 1 ]; do
            client_id=$((client_id+1))
            session_name=$base_session"-"$client_id
        done
        tmux new-session -d -t $base_session -s $session_name
        tmux -2 attach-session -t $session_name \; set-option destroy-unattached
    else
        tmux -2 attach-session -t $base_session
    fi
fi
