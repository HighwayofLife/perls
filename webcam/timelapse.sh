#!/bin/sh

if [ -e /dev/video0 ]:
then
	if ! pidof mplayer > /dev/null;
	then
		/home/example/webcam/begin_mplayer.sh > /dev/null
	fi
else
	if pidof mlayer > /dev/null;
	then
		pkill mplayer
	fi
	exit
fi

maximages=4000

cd /home/example/webcam/saved/
numimages=`ls *.jpg | wc -l`

if [ "$numimages" -gt "$maximages" ]
then
	ls -t *.jpg | tail -`expr $numimages - $maximages` | xargs rm
fi

ls *.jpg | nl -nrz -w4 | while read a b; do mv "$b" $a.jpg; done
cd /home/example/webcam/
rm hd_webcam2.flv
/home/example/Videos/bin/ffmpeg -r 24 -i saved/%04d.jpg -sameq -s hd480 -vcodec libx264 -crf 25 hd_webcam2.flv
scp hd_webcam2.flv user@remote_server.com:/path/to/site/webcam/video2.tmp
ssh remote_server mv /path/to/site/webcam/video2.tmp /path/to/site/webcam/video2.flv
