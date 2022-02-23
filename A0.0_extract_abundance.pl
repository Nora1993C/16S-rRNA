use strict;
use File::Basename;
die("Argument: Original_genus_abundance(otu_table_L6.txt)\n") if ((@ARGV < 1) or (@ARGV >2));

my $TaxaLevel="Genus";

my $rawFile=shift;
my ($fn, $dir, undef) = fileparse($rawFile, qw/.txt/);
$fn=~/Total\.(\w+)\.sub/;
my $outFile=$dir."/".$1.".".$TaxaLevel.".abundance.tmp1.txt";
open In,"<",$rawFile;
open Out,">",$outFile;

while(<In>)
{
	chomp;
	if(/^\#OTU\s+(ID.*)/)
	{
		printf Out "%s\n",$1;
	}
	elsif(/^k_/)
	{
		my $line=$_;
		my @taxa=split /;/,(split /\s+/,$_)[0];	
		if(!($taxa[$#taxa] eq "Other") && !($taxa[$#taxa]=~/_$/) &&!($line=~/\[/))
		{
			$line=~/^\S+_(\S+)\s+(.*)/;
			printf Out "%s\t%s\n",$1,$2;
		}
	}
}
