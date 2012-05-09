#!/usr/bin/perl -w
use strict;

use Fcntl ':mode';
use IPC::Open2;

# limit the number of frames we keep stored for time lapses
my $limit = 4000;

# Set this to where the images are saved every 1 second
my $temp_timelapse_dir = '/home/example/webcam/images/'; # <-------- fill that in

# set this to where you want the saved after we remove images 1-14
my $timelapse_dir = '/home/example/webcam/saved/';

process_images($timelapse_dir, $temp_timelapse_dir);

sub process_images
{
    my $directory = $_[0];
    my $temp_directory = $_[1];
    
    # get the number of images currently in the processed image directory
    opendir(DIR, $directory);
    
    my $imagecount = grep {$_ =~ /\d+\.jpg/} readdir(DIR);
    closedir(DIR);
    
    opendir(DIR, $temp_directory);
    my @files = grep {$_ =~ /\d+\.jpg/} readdir(DIR);
    my @count = do { no warnings 'numeric'; sort {$a <=> $b} @files };
    my $image_number = 1;

    foreach my $file (@count)
    {   
        $file =~ /(\d+)\.jpg/;
    
        if ($1 % 10)
        {
        	unlink($temp_directory . $file);
		}
        else
        {
			rename($temp_directory . $file, $directory . sprintf("%04d", ++$imagecount) . '.jpg');
		}
    }
}
