#Analysis StepI: Classify the abundance data 
#Current working taxanomic level is Genus

Data=/home/Metagenome-2/16S/LEH;
cd $Data;

for i in $(ls $Data/Analysis/4_common_OTUs/HPC/*.otu_table.txt)
do
	perl $Data/bin/A4.1_extract_OTUs_taxa.pl $i;
done

for i in $(ls $Data/Analysis/4_common_OTUs/HPC/*.otu.counts.txt)
do
	perl $Data/bin/A4.2_calculate_OTUs_abundance.pl $i;
done


for i in $(ls $Data/Analysis/4_common_OTUs/HPC/*.otu.*.txt)
do
	perl $Data/bin/A4.3_extract_commonOTUs.pl $i;
done

for i in $(ls $Data/Analysis/4_common_OTUs/HPC/*.otu.*.txt)
do
	 perl $Data/bin/A4.4_extract_commonOTUs-groups.pl $i $Data/bin/HPC-grouping.info;
done

for i in $(ls $Data/Analysis/4_common_OTUs/HPC/*.otu.counts.txt)
do
	Rscript $Data/bin/A4.5_Plot_CommonOTUs.r $i $Data/Analysis/4_common_OTUs/HPC/;
done

