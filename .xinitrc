export GTK_IM_MODULE='ibus'
export QT_IM_MODULE='ibus'
export XMODIFIERS='@im=ibus'
#ibus-daemon -drxR

xset s off
xset -dpms s off
xset s noblank
exec dwm
