#Analysis StepI: Classify the abundance data 
#Current working taxanomic level is Genus

Data=/home/Project/16S/WLR;
cd $Data;

[ ! -d $Data/Analysis ] && mkdir $Data/Analysis;
[ ! -d $Data/Analysis/4_common_OTUs ] && mkdir $Data/Analysis/4_common_OTUs;
[ ! -d $Data/Analysis/4_common_OTUs/Total ] && mkdir $Data/Analysis/4_common_OTUs/Total;

cp $Data/7_Taxa/*.otu_table.txt $Data/Analysis/4_common_OTUs/;

for i in $(ls $Data/Analysis/4_common_OTUs/*.otu_table.txt)
do
	perl $Data/bin/A4.1_extract_OTUs_taxa.pl $i;
done

for i in $(ls $Data/Analysis/4_common_OTUs/*.otu.counts.txt)
do
	perl $Data/bin/A4.2_calculate_OTUs_abundance.pl $i;
done


for i in $(ls $Data/Analysis/4_common_OTUs/*.otu.*.txt)
do
	perl $Data/bin/A4.3_extract_commonOTUs.pl $i;
done

for i in $(ls $Data/Analysis/4_common_OTUs/*.otu.*.txt)
do
	 ID=$(basename $i)
	 echo ID
	 perl $Data/bin/A4.4_extract_commonOTUs-groups.pl $i $Data/bin/${ID%.*.*.*}-grouping.info;
done

for i in $(ls $Data/Analysis/4_common_OTUs/*.otu.counts.txt)
do
	Rscript $Data/bin/A4.5_Plot_CommonOTUs.r $i $Data/Analysis/4_common_OTUs/;
done

