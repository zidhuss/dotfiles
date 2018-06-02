#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

export PANEL_FIFO=/tmp/panel-fifo

# Fonts
xset +fp /usr/share/fonts/local
xset +fp /usr/share/fonts/misc
xset fp rehash

# Pulse audio
pulseaudio --start

# Set up monitors
xrandr --output LVDS1 --mode "1366x768" --primary

# xrandr --newmode 1920x1200 154.00  1920 1968 2000 2080  1200 1203 1209 1235 +hsync -vsync
# xrandr --addmode VGA1 1920x1200
# xrandr --output VGA1 --mode 1920x1200 --right-of LVDS1
# xrandr --output HDMI1 --mode "1280x720" --right-of LVDS1

# Mopidy
mopidy &

# Load Xresources
xrdb -merge ~/.Xresources

# Redshift
redshift &

# Desktop Wallpaper
feh --bg-fill --no-xinerama ~/Pictures/wallpapers/desatwoods.jpg &

# Cursor and bell
xsetroot -cursor_name left_ptr &
xset -b &

# Screen locking
xautolock -locker lockthescreen -time 10 &

# Notifications
notification-wrapper &

# Mail
wendy -m 128 -f ~/Mail/zidhussein-gmail/INBOX/new -e notification "New Mail!" &

# WM and Keys
sxhkd &
exec bspwm
