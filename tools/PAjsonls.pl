#!/usr/bin/perl
#Name:PAjsonls.pl
#Author: Simon Lumley
#Description: lists all the .json files found recursivly below the current/specified directory directory.

use strict;
use warnings;
use File::Find;
use Cwd;



#####################Parsing Arguments and error catching
my $DIR = cwd();
if(defined($ARGV[0])){if(-d $ARGV[0]){my $DIR=$ARGV[0]}}
chdir $DIR;

######## get list of files
my @filelist;
find(\&output,".");

print @filelist;


sub output{
	my $filename = "$File::Find::name";
	if(
	$filename =~ /\.json$/ and 
	$filename !~ /list/ and 
	$filename !~ /\\ui\\/ and
	$filename !~ /.*shaders.*/ and
	$filename !~ /.*fonts.*/ and
	$filename !~ /.*nomod.*/
	){
		push(@filelist,"$filename \n");
	}

}

