# October 10th 2017
# re-create fasta file for jgi sequences using short ids

#~ /usr/perl/bin -w
use strict;

my $filein="/home/mnguyen/Research/For_Marcos/Dicsqu464_1/Dicsqu464_1_GeneCatalog_proteins_20151220.aa1.fasta";
my $fileout="/home/mnguyen/Research/For_Marcos/Dicsqu464_1/Dicsqu464_1_GeneCatalog_proteins_20151220.aa1.shortID.fasta";

open(In,"<$filein") || die "Cannot open file $filein";
open(Out,">$fileout") || die "Cannot open file $fileout";
while (<In>)
{
	$_=~s/\s*$//;
	if ($_=~/^\>/)
	{
		$_=~s/^\>//;
		my @temps=split(/\|/,$_);
		my $new_id=$temps[0]."|".$temps[1]."|".$temps[2];
		print Out ">$new_id\n";
	}else{print Out "$_\n";}
}
close(In);
close(Out);