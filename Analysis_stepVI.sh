#Analysis StepI: Classify the abundance data 
#Current working taxanomic level is Genus

Data=/home/Project/16S/WLR;
cd $Data;

[ ! -d $Data/Analysis/6_Relation_Network ] && mkdir $Data/Analysis/6_Relation_Network;

cp $Data/Analysis/1_Abundance/*.Genus.abundance.txt $Data/Analysis/6_Relation_Network/;

for i in $(ls $Data/Analysis/6_Relation_Network/*.Genus.abundance.txt)
do
	ID=$(basename $i .Genus.abundance.txt);
	Rscript $Data/bin/A6.1_Plot_relation_Network.r $i $Data/bin/$ID-grouping.info $Data/Analysis/6_Relation_Network/ 2;

done


