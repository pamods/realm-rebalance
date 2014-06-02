#!/usr/bin/perl
#Name:PAstrip.pl
#Author: Simon Lumley
#Description: finds all .json files found recursivly below the current/specified directory and strips all tabs and newlines from them.

########################## BE CAREFULL USING THIS SCRIPT #############################

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


foreach(@filelist){
	my @line = split(/(\/+)/,$_ );
	my $name = substr($line[-1],0,-7);
#	print "$name";
	#open each file, and pull data
	chomp;

	open (UNIT,'<',$_);
	my @input = <UNIT>;
	
	#replace
	foreach(@input){
		if(/[\t\n]/){print "$name\n"}
		s/\t//g;
		s/\n//g;
	}
#	print "\n";
	close UNIT;
	open (UNIT,'>',$_);
	#write back
	print UNIT @input;
	close UNIT;
	
	
}














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

