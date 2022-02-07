#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

picom --experimental-backends &
flameshot &
dunst &
xsetroot -cursor_name left_ptr &
/usr/lib/geoclue-2.0/demos/agent &
redshift -t 7000:5000 &
sudo modprobe i2c-dev &
sudo modprobe i2c-i801 &

export XDG_CURRENT_DESKTOP=xmonad
exec xmonad

eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK
