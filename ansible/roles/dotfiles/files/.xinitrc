#urxvt -title slobterm -e ssh slobber@slob.pinchesarbol.es &

xrdb -merge ~/.Xresources
gpg-connect-agent updatestartuptty /bye # wtf is my life

xss-lock slock &
./.dropbox-dist/dropboxd &
xbattbar -c &
bin/dwmstatus.sh &
exec dwm
