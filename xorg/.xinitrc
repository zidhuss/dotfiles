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

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice


# Fonts
xset +fp /usr/share/fonts/local
xset +fp /usr/share/fonts/misc
xset fp rehash

# Pulse audio
pulseaudio --start

# Set up monitors
xrandr --output LVDS1 --mode "1366x768" --primary

# Mopidy
mopidy &

# Load Xresources
xrdb -merge ~/.Xresources

# Xflux or redshift
redshift &

# Terminal daemon
urxvtd &

# Make Java programs behave correctly
wmname LG3D

# Desktop Wallpaper
feh --bg-fill --no-xinerama ~/Pictures/wallpapers/desatwoods.jpg &

# Cursor and bell
xsetroot -cursor_name left_ptr &
xset -b &

# Screen locking
xautolock -locker lockthescreen -time 10 &

# WM and Keys
sxhkd -f 100 &
exec bspwm
