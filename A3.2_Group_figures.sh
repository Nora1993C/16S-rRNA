#Analysis StepI:Convert the raw Qiime abundance file to the tab-format files!
#Current working taxanomic level is Genus

Data=/home/Metagenome-2/16S/LEH;
cd $Data;

###HHC###
for i in $(ls $Data/Analysis/3_PCA_cluster/HHC/*.Genus.abundance.txt)
do
	Rscript $Data/bin/A3.1_Plot_PCA_cluster.r $Data/Analysis/3_PCA_cluster/HHC/ $i 0.001 0 0;
done

###HMC###
for i in $(ls $Data/Analysis/3_PCA_cluster/HMC/*.Genus.abundance.txt)
do
	Rscript $Data/bin/A3.1_Plot_PCA_cluster.r $Data/Analysis/3_PCA_cluster/HMC/ $i 0.001 0 0;
done

###HLC###
for i in $(ls $Data/Analysis/3_PCA_cluster/HLC/*.Genus.abundance.txt)
do
	Rscript $Data/bin/A3.1_Plot_PCA_cluster.r $Data/Analysis/3_PCA_cluster/HLC/ $i 0.001 0 0;
done

###HPC###
for i in $(ls $Data/Analysis/3_PCA_cluster/HPC/*.Genus.abundance.txt)
do
	Rscript $Data/bin/A3.1_Plot_PCA_cluster.r $Data/Analysis/3_PCA_cluster/HPC/ $i 0.001 0 0;
done

###CHHC###
for i in $(ls $Data/Analysis/3_PCA_cluster/CHHC/*.Genus.abundance.txt)
do
	Rscript $Data/bin/A3.1_Plot_PCA_cluster.r $Data/Analysis/3_PCA_cluster/CHHC/ $i 0.001 0 0;
done

###CHMC###
for i in $(ls $Data/Analysis/3_PCA_cluster/CHMC/*.Genus.abundance.txt)
do
	Rscript $Data/bin/A3.1_Plot_PCA_cluster.r $Data/Analysis/3_PCA_cluster/CHMC/ $i 0.001 0 0;
done

###CHLC###
for i in $(ls $Data/Analysis/3_PCA_cluster/CHLC/*.Genus.abundance.txt)
do
	Rscript $Data/bin/A3.1_Plot_PCA_cluster.r $Data/Analysis/3_PCA_cluster/CHLC/ $i 0.001 0 0;
done

###CHPC###
for i in $(ls $Data/Analysis/3_PCA_cluster/CHPC/*.Genus.abundance.txt)
do
	Rscript $Data/bin/A3.1_Plot_PCA_cluster.r $Data/Analysis/3_PCA_cluster/CHPC/ $i 0.001 0 0;
done

###CCC###
for i in $(ls $Data/Analysis/3_PCA_cluster/CCC/*.Genus.abundance.txt)
do
	Rscript $Data/bin/A3.1_Plot_PCA_cluster.r $Data/Analysis/3_PCA_cluster/CCC/ $i 0.001 0 0;
done

