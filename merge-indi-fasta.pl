open Out1,">","/project/16S/WLR/3_filtered_fa/Total.gut.sub5W.fa";
my @files=glob("/project/16S/WLR/3_filtered_fa/*.join.sub5W.fa");
for my $file(@files)
{
	$file=~/(\w+)\.join\.sub5W\.fa/;
	my $ID=$1;
	my $count=0;
	open In,"<",$file;

	while(<In>)
	{
		if(/^>/)
		{
			printf Out1 ">%s_%s\n",$ID,$count;
			$count++;
		}
		else
		{
			printf Out1 "%s",$_;
		}
	}
}
