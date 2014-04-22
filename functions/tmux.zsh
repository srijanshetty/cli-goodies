# Startup configuration for tmux
function startt() {
    case $1 in
        "home")
            # Create a new tmux-session
            tmux new-session -d -s home -n firewall

            # Create the windows
            # tmux new-window -t home:2 -n IRC
            tmux new-window -t home:2
            # tmux new-window -t home:3

            # Start defualt programs in them
            tmux send-keys -t home:1 "auth" C-m

            # Attach the session and select a default window
            tmux select-window -t home:3
            tmux attach-session -t home
            ;;

        "compilers")
            # Create a new tmux-session
            tmux new-session -d -s compilers -n editor

            # Create the windows
            tmux new-window -t compilers:2 -n Test

            # Start defualt programs in them
            tmux send-keys -t compilers:1 "vim" C-m

            # Split the windows
            tmux select-window -t compilers:2
            tmux split-window -h -t compilers:2

            # Select a default window
            tmux select-window -t compilers:1

            # Attach the session
            tmux attach-session -t compilers
            ;;
    esac
}


