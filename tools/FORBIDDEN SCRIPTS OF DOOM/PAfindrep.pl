#!/usr/bin/perl
#Name:PAfindrep.pl
#Author: Simon Lumley
#Description: finds all .json files found recursivly below the current/specified directory directory then performs a find/replace throughout that file.



############################ THIS IS NOT FUNCTIONAL YET###############################


########################## BE CAREFULL USING THIS SCRIPT #############################
############## IF YOUR ARE USING IT, I ASSUME YOU KNOW WHAT YOU ARE DOING#############

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
	
	#open each file, and pull data
	chomp;
#	print $_;
	open (UNIT,'<',$_);
	my @input = <UNIT>;
	close UNIT;

	
	
}














sub output{
	my $filename = "$File::Find::name";
	if($filename =~ /\.json$/  and $filename =~ /.*units.*/ and $filename !~ /ammo/ and $filename !~ /tool/ and $filename !~ /list/ and $filename !~ /arm/){
		push(@filelist,"$filename \n");
	}

}

