#Analysis StepI: Classify the abundance data 
#Current working taxanomic level is Genus

Data=/home/Metagenome-2/16S/LEH;
cd $Data;

for i in $(ls $Data/Analysis/5_Sharing_OTUs/HPC/*.otu.counts.txt)
do
	ID=$(basename $i .otu.counts.txt);
	Rscript $Data/bin/A5.1_Plot_OTUs_Venn.r $i $Data/bin/$ID-grouping.info $Data/Analysis/5_Sharing_OTUs/HPC 2;

done


