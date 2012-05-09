#!/bin/sh
cd /home/example/webcam/images/

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

upload_image()
{
	# Find the newest file in a directory
	image=`ls -rt /home/example/webcam/images/*.jpg | tail -1`
	scp $image user@remote_server.com:/path/to/site/webcam/webcam2.tmp
	scp remote_server mv /path/to/site/webcam/webcam2.tmp /path/to/site/webcam/webcam2.jpg
}

upload_image
sleep 10;
upload_image
sleep 10;
upload_image
sleep 10;
upload_image
sleep 10;
upload_image
sleep 10;
upload_image

EOF
