#!/bin/sh

# Webcam dimensions
WIDTH=854
HEIGHT=480

# Images directory
OUTPUT_DIR="/perls/webcam/images"

# Your divice should be video0 by default unless there are other devices connected.
# This path may differ depending on operating system
DEVICE="/dev/video0"

# Output quality in percentage
QUALITY=75

# This script saves an image from the webcam at a rate of 1 frame per second (1 fps).
# mplayer does not appear to allow any slower framerate

# Activate mplayer to begin saving files to the images directory.
mplayer tv:// -tv driver=v4l2:width=$WIDTH:hight=$HEIGHT:fps=1:quality=100:device=$DEVICE -vo jpeg:outdir=$OUTPUT_DIR:quality=$QUALITY -fps 1
# mplayer tv:// -tv driver=v4l2:width=854:height=480:fps=1:quality=100:device=/dev/video0 -vo jpeg:outdir=/home/example/webcam/images:quality=75 -fps 1
