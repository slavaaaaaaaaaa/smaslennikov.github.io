#!/bin/bash
outdir=/usr/backups/
output=$outdir$HOSTNAME
#su slobber -c "DISPLAY=:0 notify-send -t 999999 -u low \"confsync.sh: $(date)\" \"I'm starting backups!\""
echo $HOSTNAME $(date)
# what's at home
#rsync -artR --delete /home/slobber/.bash* $output
#rsync -artR --delete /home/slobber/bin $output
#rsync -artR --delete /home/slobber/.config/mc $output
#rsync -artR --delete /home/slobber/.gitconfig $output
#rsync -artR --delete /home/slobber/.mutt* $output
#rsync -artR --delete /home/slobber/.nethackrc $output
#rsync -artR --delete /home/slobber/.screen $output
#rsync -artR --delete /home/slobber/.vimrc $output
#rsync -artR --delete /home/slobber/.weechat $output
#fuckit, it's small enough
rsync -artR --delete /home/slobber/ $output

# portage is important maybe
rsync -artR --delete /usr/share/portage $output
rsync -artR --delete /var/lib/portage $output

# this too i guess
rsync -artR --delete /usr/local $output

#how could i forget
rsync -artR --delete /root $output

# oh well, just take entire etc
rsync -artR --delete /etc --exclude 'ppp/chap-secrets' $output

# kernel configs..
rsync -artR --delete /usr/src/linux*/.config* $output

# logs too, I guess.. nope, too fucking big. will fix later
#rsync -artR --delete /var/log $output

# these might be useful. Hopefully I don't put big stuff there though..
rsync -artR --delete /usr/local/bin $output

# why did i do this again?
#cp /etc/cron.others/confsync.sh $outdir"confsync.sh-"$HOSTNAME

# ugh perms
chown -R slobber:users $output

# notify the idiot at the computer
echo Dun!
# su slobber -c "DISPLAY=:0 notify-send -t 999999 -u low \"confsync.sh: $(date)\" \"$(tail -n7 /var/log/confsync.log)\""

# why in the world didn't i just set up a git repo
