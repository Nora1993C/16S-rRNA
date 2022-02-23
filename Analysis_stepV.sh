#Analysis StepI: Classify the abundance data 
#Current working taxanomic level is Genus

Data=/home/Project/16S/WLR;
cd $Data;

[ ! -d $Data/Analysis/5_Sharing_OTUs ] && mkdir $Data/Analysis/5_Sharing_OTUs;

cp $Data/Analysis/4_common_OTUs/*.otu.counts.txt $Data/Analysis/5_Sharing_OTUs/;

for i in $(ls $Data/Analysis/5_Sharing_OTUs/*.otu.counts.txt)
do
	ID=$(basename $i);
	Rscript $Data/bin/A5.1_Plot_OTUs_Venn.r $i $Data/bin/${ID%.*.*.*}-grouping.info $Data/Analysis/5_Sharing_OTUs 2;

done


