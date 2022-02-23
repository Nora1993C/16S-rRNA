#Analysis StepI:Convert the raw Qiime abundance file to the tab-format files!
#Current working taxanomic level is Genus

Data=/home/Metagenome-2/16S/LEH;
cd $Data;

###HHC###
for i in $(ls $Data/Analysis/2_Diversity/HHC/*.Genus.abundance.txt)
do
	ID=$(basename $i .Genus.abundance.txt);
	Rscript $Data/bin/A2.1_Plot_alpha_bar.r $i $Data/bin/HHC-grouping.info $Data/Analysis/2_Diversity/HHC 2;
	Rscript $Data/bin/A2.2_Plot_beta_bar.r $i $Data/bin/HHC-grouping.info $Data/Analysis/2_Diversity/HHC 2;
done

###HMC###
for i in $(ls $Data/Analysis/2_Diversity/HMC/*.Genus.abundance.txt)
do
	ID=$(basename $i .Genus.abundance.txt);
	Rscript $Data/bin/A2.1_Plot_alpha_bar.r $i $Data/bin/HMC-grouping.info $Data/Analysis/2_Diversity/HMC 2;
	Rscript $Data/bin/A2.2_Plot_beta_bar.r $i $Data/bin/HMC-grouping.info $Data/Analysis/2_Diversity/HMC 2;
done

###HLC###
for i in $(ls $Data/Analysis/2_Diversity/HLC/*.Genus.abundance.txt)
do
	ID=$(basename $i .Genus.abundance.txt);
	Rscript $Data/bin/A2.1_Plot_alpha_bar.r $i $Data/bin/HLC-grouping.info $Data/Analysis/2_Diversity/HLC 2;
	Rscript $Data/bin/A2.2_Plot_beta_bar.r $i $Data/bin/HLC-grouping.info $Data/Analysis/2_Diversity/HLC 2;
done

###HPC###
for i in $(ls $Data/Analysis/2_Diversity/HPC/*.Genus.abundance.txt)
do
	ID=$(basename $i .Genus.abundance.txt);
	Rscript $Data/bin/A2.1_Plot_alpha_bar.r $i $Data/bin/HPC-grouping.info $Data/Analysis/2_Diversity/HPC 2;
	Rscript $Data/bin/A2.2_Plot_beta_bar.r $i $Data/bin/HPC-grouping.info $Data/Analysis/2_Diversity/HPC 2;
done

###CHHC###
for i in $(ls $Data/Analysis/2_Diversity/CHHC/*.Genus.abundance.txt)
do
	ID=$(basename $i .Genus.abundance.txt);
	Rscript $Data/bin/A2.1_Plot_alpha_bar.r $i $Data/bin/CHHC-grouping.info $Data/Analysis/2_Diversity/CHHC 2;
	Rscript $Data/bin/A2.2_Plot_beta_bar.r $i $Data/bin/CHHC-grouping.info $Data/Analysis/2_Diversity/CHHC 2;
done

###CHMC###
for i in $(ls $Data/Analysis/2_Diversity/CHMC/*.Genus.abundance.txt)
do
	ID=$(basename $i .Genus.abundance.txt);
	Rscript $Data/bin/A2.1_Plot_alpha_bar.r $i $Data/bin/CHMC-grouping.info $Data/Analysis/2_Diversity/CHMC 2;
	Rscript $Data/bin/A2.2_Plot_beta_bar.r $i $Data/bin/CHMC-grouping.info $Data/Analysis/2_Diversity/CHMC 2;
done

###CHLC###
for i in $(ls $Data/Analysis/2_Diversity/CHLC/*.Genus.abundance.txt)
do
	ID=$(basename $i .Genus.abundance.txt);
	Rscript $Data/bin/A2.1_Plot_alpha_bar.r $i $Data/bin/CHLC-grouping.info $Data/Analysis/2_Diversity/CHLC 2;
	Rscript $Data/bin/A2.2_Plot_beta_bar.r $i $Data/bin/CHLC-grouping.info $Data/Analysis/2_Diversity/CHLC 2;
done

###CHPC###
for i in $(ls $Data/Analysis/2_Diversity/CHPC/*.Genus.abundance.txt)
do
	ID=$(basename $i .Genus.abundance.txt);
	Rscript $Data/bin/A2.1_Plot_alpha_bar.r $i $Data/bin/CHPC-grouping.info $Data/Analysis/2_Diversity/CHPC 2;
	Rscript $Data/bin/A2.2_Plot_beta_bar.r $i $Data/bin/CHPC-grouping.info $Data/Analysis/2_Diversity/CHPC 2;
done

###CCC###
for i in $(ls $Data/Analysis/2_Diversity/CCC/*.Genus.abundance.txt)
do
	ID=$(basename $i .Genus.abundance.txt);
	Rscript $Data/bin/A2.1_Plot_alpha_bar.r $i $Data/bin/CCC-grouping.info $Data/Analysis/2_Diversity/CCC 2;
	Rscript $Data/bin/A2.2_Plot_beta_bar.r $i $Data/bin/CCC-grouping.info $Data/Analysis/2_Diversity/CCC 2;
done

