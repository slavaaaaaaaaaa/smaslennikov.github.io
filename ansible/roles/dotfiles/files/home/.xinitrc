xrandr --output eDP1 --rotate right --scale .6x.6
xrdb -merge ~/.Xresources
xss-lock slock &
./.dropbox-dist/dropboxd &
xbattbar -c &
nm-applet &
git/self/dwm/dwmstatus.sh &
QT_FONT_DPI=74 keepassxc &
run_keybase
exec dwm
