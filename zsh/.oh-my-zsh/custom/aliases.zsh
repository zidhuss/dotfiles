# Faster sudo typing
alias s='sudo'

# Stolen from web
alias please='s $(fc -ln -l)'

# Add to X Clipboard
alias xclip='xclip -selection c'

# Unbind Ctrl+S from X before running vim
alias vim="stty stop '' -ixoff; vim"

# Recomposite
alias recomposite='killall compton; compton -b --config ~/.config/compton/compton.conf'

# Mount drive with user priveleges
alias usrmount='sudo mount -o uid=1000,gid=1000,fmask=113,dmask=002'

# Lock the screen right now
alias locknow='xautolock -locknow'

# Verbose stow
alias stow='stow -v2'

# Correct terminal for ssh
alias ssh='TERM=xterm-256color ssh'

# Go to Torrent folder
alias torrents='cd ~/Downloads/torrents'
alias ctorrents='cd ~/Downloads/torrents/complete'
alias itorrents='cd ~/Downloads/torrents/incomplete'

# Always open gdb in quiet mode
alias gdb='gdb -q'

# Quicker way to start acestream
alias ace='acestream-launcher'

# Bloodzeed acestream
alias bloodzeed='acestream-launcher acestream://42fe51591598d905ab011a9c8339150f8391dfa7'

# ix pastebin
alias ix="curl -F 'f:1=<-' ix.io"

alias iotek="curl -sT- https://p.iotek.org"

alias t=tmux

alias grun='gradle --console plain run'

alias konsole='konsole -stylesheet ~/.config/konsole.css'

# Silent Java Options
_SILENT_JAVA_OPTIONS="$_JAVA_OPTIONS"
unset _JAVA_OPTIONS
alias java='java "$_SILENT_JAVA_OPTIONS"'
