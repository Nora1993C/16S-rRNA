#Analysis StepI: Classify the abundance data 
#Current working taxanomic level is Genus

Data=/home/Metagenome-2/16S/ZSL-1;
cd $Data;

for i in $(ls $Data/Analysis/8_OTUs_beta/CHHC/*.*resample.otu.txt)
do
        T1=$(basename $i);
	T2=${T1#*.};
       	Rscript $Data/bin/A7.2_Plot_OTUs_beta_bar.r $i $Data/bin/CHHC-grouping.info $Data/Analysis/8_OTUs_beta/CHHC/ 2;

done


### Plot MDS graph basing on beta distance
for i in $(ls $Data/Analysis/8_OTUs_beta/CHHC/*.*resample.otu.txt)
do
	T1=$(basename $i);
	T2=${T1#*.};
	Rscript $Data/bin/A7.3_Plot_OTUs_beta_mds.r $i $Data/bin/CHHC-grouping.info $Data/Analysis/8_OTUs_beta/CHHC/ 2;
done
