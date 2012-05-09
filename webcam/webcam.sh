#!/bin/sh

# Specify the webcam directory where this script resides
WEBCAM_DIR="/perls/webcam/"

REMOTE_SERVER="user@server.com"

REMOTE_FILE="/site/webcam/image1.jpg"

# Specify the video device
DEVICE="/dev/video0"

cd "$WEBCAM_DIR/images/"

# Only run these scripts if there is a video device connected
if [ -e "$DEVICE" ]:
then
	if ! pidof mplayer > /dev/null; then
		`$WEBCAM_DIR/begin_mplayer.sh` > /dev/null
	fi
else
	# There is no device connected. Kill mplayer if it's active and then exit
	if pidof mlayer > /dev/null; then
		pkill mplayer
	fi
	exit 1
fi

upload_image()
{
	# Find the newest file in a directory
	image=`ls -rt $WEBCAM_DIR/images/*.jpg | tail -1`
	scp $image $REMOTE_SERVER:$REMOTE_FILE.tmp
	scp $image user@remote_server.com:/path/to/site/webcam/webcam2.tmp
	scp $REMOTE_SERVER mv $REMOTE_FILE.tmp $REMOTE_FILE
}

# Upload an image every 10 seconds
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
