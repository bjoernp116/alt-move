# Enable xterm-keys for detecting Alt + Arrows
set -g xterm-keys on

# Alt + Left
bind -n M-Left if-shell '[ "$(tmux display -p "#{pane_at_left}")" -eq 1 ]' \
  'previous-window' \
  'select-pane -L'

# Alt + Right
bind -n M-Right if-shell '[ "$(tmux display -p "#{pane_at_right}")" -eq 1 ]' \
  'next-window' \
  'select-pane -R'

# Optional: Alt + Up and Down (can modify or remove if not needed)
bind -n M-Up if-shell '[ "$(tmux display -p "#{pane_at_top}")" -eq 1 ]' \
  'select-window -t:-' \
  'select-pane -U'

bind -n M-Down if-shell '[ "$(tmux display -p "#{pane_at_bottom}")" -eq 1 ]' \
  'select-window -t:+' \
  'select-pane -D'
