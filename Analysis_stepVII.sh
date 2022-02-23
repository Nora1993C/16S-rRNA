#Analysis StepI: Classify the abundance data 
#Current working taxanomic level is Genus

Data=/home/Project/16S/WLR;
cd $Data;

[ ! -d $Data/Analysis/7_OTUs_alpha ] && mkdir $Data/Analysis/7_OTUs_alpha;

cp $Data/14_Statistics/*final.otu.*.txt $Data/Analysis/7_OTUs_alpha/;

for i in $(ls $Data/Analysis/7_OTUs_alpha/*.final.otu.*.txt)
do
	ID=$(basename $i)
	Rscript $Data/bin/A7.1_Plot_OTUs_alpha_bar.r $i $Data/bin/${ID%.*.*.*.*.*}-grouping.info $Data/Analysis/7_OTUs_alpha/ 2;

done

[ ! -d $Data/Analysis/8_OTUs_beta ] && mkdir $Data/Analysis/8_OTUs_beta;

for i in $(ls $Data/14_Statistics/*otu_table*.txt)
do
	mv $i `echo $i |sed "s/_Total.gut.*\.txt/\.gut\.resample\.otu\.txt/g"`;
done

cp $Data/14_Statistics/*resample.otu.txt $Data/Analysis/8_OTUs_beta;

for i in $(ls $Data/Analysis/8_OTUs_beta/*.*resample.otu.txt)
do
        T1=$(basename $i);
	T2=${T1#*.};
	ID=${T2%.*.*.*};
      	Rscript $Data/bin/A7.2_Plot_OTUs_beta_bar.r $i $Data/bin/$ID-grouping.info $Data/Analysis/8_OTUs_beta/ 2;

done


### Plot MDS graph basing on beta distance
for i in $(ls $Data/Analysis/8_OTUs_beta/*.*resample.otu.txt)
do
	T1=$(basename $i);
	T2=${T1#*.};
	ID=${T2%.*.*.*};
	Rscript $Data/bin/A7.3_Plot_OTUs_beta_mds.r $i $Data/bin/$ID-grouping.info $Data/Analysis/8_OTUs_beta/ 2;
done
