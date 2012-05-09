Usage
=====

To use these scripts. Edit the files to include your own path and information to connect to your remote server. You may want to consider using passwordless login to your remote server.

1. Edit scripts with your local path info
2. Set a crontab to use each script. Example cron:

	# m h  dom mon dow   command
	* 8-23 * * * /home/example/webcam/process.pl
	* 8-23 * * * /home/example/webcam/webcam.sh
	1 9-23 * * * /home/example/webcam/timelapse.sh
	1 0 * * * pkill mplayer
