#Analysis StepI: Classify the abundance data 
#Current working taxanomic level is Genus

Data=/home/Project/16S/WLR;
cd $Data;

[ ! -d $Data/Analysis ] && mkdir $Data/Analysis;
[ ! -d $Data/Analysis/3_PCA_cluster ] && mkdir $Data/Analysis/3_PCA_cluster;

cp $Data/Analysis/1_Abundance/*.Genus.abundance.txt $Data/Analysis/3_PCA_cluster/;
for i in $(ls $Data/Analysis/3_PCA_cluster/*.Genus.abundance.txt)
do
	Rscript $Data/bin/A3.1_Plot_PCA_cluster.r $Data/Analysis/3_PCA_cluster/ $i 0.001 0 0;
done

cd $Data/bin
#bash A3.0_Extract_Group_abundance.sh
#bash A3.2_Group_figures.sh
