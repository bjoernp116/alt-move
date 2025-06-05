# Enable xterm-keys for detecting Alt + Arrows
set -g xterm-keys on

run-shell -b '
get_opt() {
    tmux show-option -gqv "$1"
}

# Left
bind_left=$(get_opt "@smart-alt-arrows-left")
[ -z "$bind_left" ] && bind_left="M-Left"
tmux bind -n "$bind_left" if-shell "[ \"\$(tmux display -p '#{pane_at_left}')\" -eq 1 ]" \
  "previous-window" \
  "select-pane -L"

# Right
bind_right=$(get_opt "@smart-alt-arrows-right")
[ -z "$bind_right" ] && bind_right="M-Right"
tmux bind -n "$bind_right" if-shell "[ \"\$(tmux display -p '#{pane_at_right}')\" -eq 1 ]" \
  "next-window" \
  "select-pane -R"

# Up (optional)
bind_up=$(get_opt "@smart-alt-arrows-up")
[ -z "$bind_up" ] && bind_up="M-Up"
tmux bind -n "$bind_up" if-shell "[ \"\$(tmux display -p '#{pane_at_top}')\" -eq 1 ]" \
  "select-window -t:-" \
  "select-pane -U"

# Down (optional)
bind_down=$(get_opt "@smart-alt-arrows-down")
[ -z "$bind_down" ] && bind_down="M-Down"
tmux bind -n "$bind_down" if-shell "[ \"\$(tmux display -p '#{pane_at_bottom}')\" -eq 1 ]" \
  "select-window -t:+" \
  "select-pane -D"
'
