xrdb -merge ~/.Xresources

#urxvt -title slobterm -e mosh pear -- screen -rd hello &
# first figure out how to pass socket to pinentry
xss-lock slock &
./.dropbox-dist/dropboxd &
xbattbar -c &
nm-applet &
bin/dwmstatus.sh &
run_keybase
exec dwm
