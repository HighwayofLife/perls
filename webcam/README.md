Usage
=====

To use these scripts. Edit the files to include your own path and information to connect to your remote server. You may want to consider using passwordless login to your remote server.

1. Edit each script with your local path info
2. Set a crontab to use each script.

Example crontab:

    # m h  dom mon dow   command
    * 8-23 * * * /perls/webcam/process.pl
    * 8-23 * * * /perls/webcam/webcam.sh
    1 9-23 * * * /perls/webcam/timelapse.sh
    1 0 * * * pkill mplayer

