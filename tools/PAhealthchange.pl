#!/usr/bin/perl
#Name:PAhealthchange.pl
#Author: Simon Lumley
#Description: Alters all Health values of a specified number of filters by a specified multiplier
#Usage: PAhealthchange.pl [filters] [multiple] [path to directory that this script will search below]


use strict;
use warnings;
use File::Find;
use Cwd;
use JSON;


#####################Parsing Arguments and error catching
my $i;
chomp @ARGV;
my @setfilter;
my $targetdir = pop(@ARGV);
my $multiple = pop(@ARGV);

for($i=0;$i<scalar(@ARGV);$i++){
	push(@setfilter,$ARGV[$i]);
}

#print @setfilter;

my $DIR = cwd();
if(defined($targetdir)){if(-d $targetdir){my $DIR=$targetdir}}
chdir $DIR;

######## get list of files
my @filelist;
find(\&output,".");

###########################Load Input file into arrays

foreach(@filelist){
	my @line = split(/(\/+)/,$_ );
	my $name = substr($line[-1],0,-7);
	
	chomp;
	
	my $file = $_;

	open (UNIT,'<',$_);
	my $input = <UNIT>;
	close UNIT;

	#decode json
	my $json_obj = new JSON;
	my $unit_data = $json_obj->decode($input);
	
	my $entry;
	my $health;
	my @types;
	
	#grab unit types
	if(defined($unit_data->{unit_types})){$entry=$unit_data->{unit_types}}
	if(ref($entry) eq "ARRAY"){@types = @$entry}
	my $string = join("",@types);
	
	#check if this is an requested unit type
	my $filtermatch = 0;

	foreach(@setfilter){
		my $filter = $_;
		if($string =~ m/$filter/){$filtermatch++} 
	}
	

	if($filtermatch>0){
		if(defined($unit_data->{max_health})){$health=$unit_data->{max_health}}else{$health= "-"};
		my $newhealth = $health * $multiple;
		
		#reencode jason
		$unit_data->{max_health}=$newhealth;
		my $new_jason = encode_json $unit_data;
		
		print "$file";
		
		open (NEWUNIT,'>',$file);
		print NEWUNIT $new_jason;
		close NEWUNIT;
		
		
		print "$name $health changed to $newhealth\n";
		
	}
	

	


}



sub output{
	my $filename = "$File::Find::name";
	if($filename =~ /\.json$/  and $filename =~ /.*units.*/ and $filename !~ /ammo/ and $filename !~ /tool/ and $filename !~ /list/ and $filename !~ /arm/){
		push(@filelist,"$filename \n");
	}

}

