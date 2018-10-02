# starts i3
if [[ ! $DISPLAY && XDG_VTNR -eq 1 ]]; then
	exec startx
fi
