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

# Youtube viwer
alias yt='youtube-viewer'

# FreeDawkins youtube channel
alias dawkins='yt --channel=UCEjOSbbaOfgnfRODEEMYlCw order=date'

# The fuck
alias fuck='$(thefuck $(fc -ln -1))'

# Lock the screen right now
alias locknow='xautolock -locknow'

# Verbose stow
alias stow='stow -v2'

# Correct terminal for ssh
alias ssh='TERM=screen ssh'

# Go to Torrent folder
alias torrents='cd ~/Downloads/torrents'
alias ctorrents='cd ~/Downloads/torrents/complete'
alias itorrents='cd ~/Downloads/torrents/incomplete'
