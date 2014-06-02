#!/usr/bin/perl
#Name:PAStatDump.pl
#Author: Simon Lumley
#Description: Tabulates stats from any PA unit .json files found recursivly below the current/specified directory directory.
#version: 0.9
#Usage: PAStatDump.pl [options] [directory (if unspecified, will use cwd)]
#Settings: none yet (first to do is simple filter)



use strict;
use warnings;
use File::Find;
use Cwd;
use JSON;


#####################Parsing Arguments and error catching
my $i;
chomp @ARGV;
my @setfilter;
my $header;
for($i=0;$i<scalar(@ARGV);$i++){
	if($ARGV[$i]=~m/^--/){
		
		if($ARGV[$i]=!m/[fh]/){print "error: setting '$ARGV[$i]' not recognised\n" ; exit}
		
		if($ARGV[$i]=~m/f/){push(@setfilter,splice(@ARGV,$i,3))}
		if($ARGV[$i]=~m/h/){push(@setfilter,splice(@ARGV,$i,3))}
		
		
		
	}
}

my $DIR = cwd();
if(defined($ARGV[0])){if(-d $ARGV[0]){my $DIR=$ARGV[0]}}
chdir $DIR;

######## get list of files
my @filelist;
find(\&output,".");


###########################Load Input file into arrays



my @dirnames =('Directory Name');
my @types = ('Types');
my @names = ('In-game Name');
my @costs = ('Cost');
my @healths = ('Health');


# my @jobtype;
# my @energy;
# my @lata;
# my @latb;
# my @latc;
# my @alpha;
# my @beta;
# my @gamma;
# my @volume;
# my @cutoff;
# my @Kpoints;
# my @runtime;
# my $counter=0;

#iterate over unit files 
foreach(@filelist){
	my @line = split(/(\/+)/,$_ );
	my $name = substr($line[-1],0,-7);
	push(@dirnames,"$name");
	
	#open each file, and pull data
	chomp;
#	print $_;
	open (UNIT,'<',$_);
	my $input = <UNIT>;
	close UNIT;
	
	#decode json
	my $json_obj = new JSON;
	my $unit_data = $json_obj->decode($input);
	
	my $entry;
	my @multentry;
	#unit name
	if(defined($unit_data->{display_name})){$entry=$unit_data->{display_name}}else{$entry= "-"};
	push(@names,$entry);
	
	#types
	if(defined($unit_data->{unit_types})){$entry=$unit_data->{unit_types}}
	if(ref($entry) eq "ARRAY"){@multentry = @$entry}
	if(@multentry){$entry = join(" ",@multentry)}else{$entry= "-"};
	push(@types,$entry);
		
	#Cost
	if(defined($unit_data->{build_metal_cost})){$entry=$unit_data->{build_metal_cost}}else{$entry= "-"};
	push(@costs,$entry);		
	
	#health
	if(defined($unit_data->{max_health})){$entry=$unit_data->{max_health}}else{$entry= "-"};
	push(@healths,$entry);	
	
}

#print out table

for($i=0;$i<scalar(@dirnames);$i++){
	
	print "$dirnames[$i]" ;
	print ", $types[$i]";
	print ", $names[$i]";
	print ", $costs[$i]";
	print ", $healths[$i]";
	print "\n";
}







# my @LINE;

# #main loop for going through output files

# foreach(@FILELIST){
	# chomp $_;
# #	print "$_\n";
	# #sorts out correct file names
	

	# my $cas = `ls "$_" | grep .castep\$`;
	# my $cel = `ls "$_" | grep .cell\$`;
	
	# my $castep = "$_/$cas";
	# chomp $castep;
	# my $cell = "$_/$cel";
	# chomp $cell;	
	
# #	print $castep;
	# @LINE = split(/(\/+)/,$_);
# #	print "@LINE\n";
	# pop(@LINE);
# #	print "@LINE\n";
	# my $name = join("",@LINE);
# #	print $name;

	
	
	
	# #filename
# #	pop(@LINE);
	# push(@filenames,$name);
	# $jobtype[$counter]=1;
	# #catches failed jobs
	
	# if(!$castep){$jobtype[$counter]="failed"}
	# open (INPUT, '<',"$castep");
	# my @INPUT = <INPUT>;	
	# my $i = 0;
	# my $checktest = 0;
	# for($i=0;$i>-10;$i--){if($INPUT[$i]=~/check$/){$checktest=1}}
	# if($checktest!=1){$jobtype[$counter]="failed"}
	# if(!@INPUT){$jobtype[$counter]="failed"}
		
	# #Job type
	# if(!($jobtype[$counter]=~/failed/)){
		# foreach(@INPUT){
			# if($_ =~ /type of calculation/){@LINE = split(/:\s+/,$_);$jobtype[$counter]=$LINE[-1]}
			# if(!$jobtype[$counter]){$jobtype[$counter]="-"}
		# }
	# }
	# ##########Main Search Loop
	# if(@INPUT){
		# foreach(@INPUT){
			# #Energy
			# if(($_ =~ /Final energy, E/)||($_ =~/Total energy/)){@LINE = split(/\s+/,$_);$energy[$counter]=$LINE[-2]}
			# if(!$energy[$counter]){$energy[$counter]="nan"}
			# #LAt a
			# if($_ =~ /                    a =/){@LINE = split(/\s+/,$_);$lata[$counter]=$LINE[3]}
			# if(!$lata[$counter]){$lata[$counter]="nan"}
			# #Lat b
			# if($_ =~ /                    b =/){@LINE = split(/\s+/,$_);$latb[$counter]=$LINE[3]}
			# if(!$latb[$counter]){$latb[$counter]="nan"}
			# #lat c
			# if($_ =~ /                    c =/){@LINE = split(/\s+/,$_);$latc[$counter]=$LINE[3]}
			# if(!$latc[$counter]){$latc[$counter]="nan"}		
			# #alpha
			# if($_ =~ /                    a =/){@LINE = split(/\s+/,$_);$alpha[$counter]=$LINE[6]}
			# if(!$alpha[$counter]){$alpha[$counter]="nan"}
			# #beta
			# if($_ =~ /                    b =/){@LINE = split(/\s+/,$_);$beta[$counter]=$LINE[6]}
			# if(!$beta[$counter]){$beta[$counter]="nan"}
			# #gamma
			# if($_ =~ /                    c =/){@LINE = split(/\s+/,$_);$gamma[$counter]=$LINE[6]}
			# if(!$gamma[$counter]){$gamma[$counter]="nan"}		
			# #Volume
			# if($_ =~ /                Current cell volume =/){@LINE = split(/\s+/,$_);$volume[$counter]=$LINE[5]}
			# if(!$volume[$counter]){$volume[$counter]="nan"}				
			# # Cutoff
			# if($_ =~ / plane wave basis set cut-off/){@LINE = split(/\s+/,$_);$cutoff[$counter]=$LINE[7]}
			# if(!$cutoff[$counter]){$cutoff[$counter]="nan"}
			# #NumKPoints
			# if($_ =~ /Number of kpoints used =/){@LINE = split(/=\s+/,$_);$Kpoints[$counter]=$LINE[-1]}
			# if(!$Kpoints[$counter]){$Kpoints[$counter]="nan"}		
			# #runtime
			# if($_ =~ /Total time          = /){@LINE = split(/\s+/,$_);$runtime[$counter]=$LINE[3]}
			# if(!$runtime[$counter]){$runtime[$counter]="nan"}		
		 # }
	# }else{
		 # $energy[$counter]="failed";
		 # $lata[$counter]="failed";
		 # $latb[$counter]="failed";
		 # $latc[$counter]="failed";
		 # $alpha[$counter]="failed";
		 # $beta[$counter]="failed";
		 # $gamma[$counter]="failed";
		 # $volume[$counter]="failed";
		 # $cutoff[$counter]="failed";
		 # $Kpoints[$counter]="failed";
		 # $runtime[$counter]="failed";
	# }
	 
	# $counter++;
# }
# #Print arrays
# chomp @filenames;
# chomp @jobtype;
# chomp @energy;
# chomp @lata;
# chomp @latb;
# chomp @latc;
# chomp @alpha;
# chomp @beta;
# chomp @gamma;
# chomp @volume;
# chomp @cutoff;
# chomp @Kpoints;
# chomp @runtime;  and 






# my $j;
# for($j=0;$j<scalar(@filenames);$j++){
	# printf "%-15s\t%-25s\t%-15.7e\t%-15.8f\t%-15.8f\t%-15.8f\t%-15.8f\t%-15.8f\t%-15.8f\t%-15.8e\t%-15.8e\t%-15u\t%-15.2f\n",$filenames[$j],$jobtype[$j],$energy[$j],$lata[$j],$latb[$j],$latc[$j],$alpha[$j],$beta[$j],$gamma[$j],$volume[$j],$cutoff[$j],$Kpoints[$j],$runtime[$j];
# }


# ###############subs

sub output{
	my $filename = "$File::Find::name";
	if($filename =~ /\.json$/  and $filename =~ /.*units.*/ and $filename !~ /ammo/ and $filename !~ /tool/ and $filename !~ /list/ and $filename !~ /arm/){
		push(@filelist,"$filename \n");
	}

}

