#Analysis StepI:Convert the raw Qiime abundance file to the tab-format files!
#Current working taxanomic level is Genus

Data=/home/Metagenome-2/16S/LEH;
cd $Data/bin;

###HHC###
for i in $(ls $Data/Analysis/1_Abundance/HHC/*.PlyGen.abundance.txt);
do
	Rscript $Data/bin/A1.1_Plot_Abundance_heatmap.r $i $Data/bin/HHC-grouping.info $Data/Analysis/1_Abundance/HHC;
done

for i in $(ls $Data/Analysis/1_Abundance/HHC/*.Genus.abundance.txt);
do
	Rscript $Data/bin/A1.2_Plot_Abundance_box.r $i $Data/bin/HHC-grouping.info $Data/Analysis/1_Abundance/HHC 2
done;

###HMC###
for i in $(ls $Data/Analysis/1_Abundance/HMC/*.PlyGen.abundance.txt);
do
	Rscript $Data/bin/A1.1_Plot_Abundance_heatmap.r $i $Data/bin/HMC-grouping.info $Data/Analysis/1_Abundance/HMC;
done

for i in $(ls $Data/Analysis/1_Abundance/HMC/*.Genus.abundance.txt);
do
	Rscript $Data/bin/A1.2_Plot_Abundance_box.r $i $Data/bin/HMC-grouping.info $Data/Analysis/1_Abundance/HMC 2
done;

###HLC###
for i in $(ls $Data/Analysis/1_Abundance/HLC/*.PlyGen.abundance.txt);
do
	Rscript $Data/bin/A1.1_Plot_Abundance_heatmap.r $i $Data/bin/HLC-grouping.info $Data/Analysis/1_Abundance/HLC;
done

for i in $(ls $Data/Analysis/1_Abundance/HLC/*.Genus.abundance.txt);
do
	Rscript $Data/bin/A1.2_Plot_Abundance_box.r $i $Data/bin/HLC-grouping.info $Data/Analysis/1_Abundance/HLC 2
done;

###HPC###
for i in $(ls $Data/Analysis/1_Abundance/HPC/*.PlyGen.abundance.txt);
do
	Rscript $Data/bin/A1.1_Plot_Abundance_heatmap.r $i $Data/bin/HPC-grouping.info $Data/Analysis/1_Abundance/HPC;
done

for i in $(ls $Data/Analysis/1_Abundance/HPC/*.Genus.abundance.txt);
do
	Rscript $Data/bin/A1.2_Plot_Abundance_box.r $i $Data/bin/HPC-grouping.info $Data/Analysis/1_Abundance/HPC 2
done;

###CHHC###
for i in $(ls $Data/Analysis/1_Abundance/CHHC/*.PlyGen.abundance.txt);
do
	Rscript $Data/bin/A1.1_Plot_Abundance_heatmap.r $i $Data/bin/CHHC-grouping.info $Data/Analysis/1_Abundance/CHHC;
done

for i in $(ls $Data/Analysis/1_Abundance/CHHC/*.Genus.abundance.txt);
do
	Rscript $Data/bin/A1.2_Plot_Abundance_box.r $i $Data/bin/CHHC-grouping.info $Data/Analysis/1_Abundance/CHHC 2
done;

##CHMC###
for i in $(ls $Data/Analysis/1_Abundance/CHMC/*.PlyGen.abundance.txt);
do
	Rscript $Data/bin/A1.1_Plot_Abundance_heatmap.r $i $Data/bin/CHMC-grouping.info $Data/Analysis/1_Abundance/CHMC;
done

for i in $(ls $Data/Analysis/1_Abundance/CHMC/*.Genus.abundance.txt);
do
	Rscript $Data/bin/A1.2_Plot_Abundance_box.r $i $Data/bin/CHMC-grouping.info $Data/Analysis/1_Abundance/CHMC 2
done;

###CHLC###
for i in $(ls $Data/Analysis/1_Abundance/CHLC/*.PlyGen.abundance.txt);
do
	Rscript $Data/bin/A1.1_Plot_Abundance_heatmap.r $i $Data/bin/CHLC-grouping.info $Data/Analysis/1_Abundance/CHLC;
done

for i in $(ls $Data/Analysis/1_Abundance/CHLC/*.Genus.abundance.txt);
do
	Rscript $Data/bin/A1.2_Plot_Abundance_box.r $i $Data/bin/CHLC-grouping.info $Data/Analysis/1_Abundance/CHLC 2
done;

###CHPC###
for i in $(ls $Data/Analysis/1_Abundance/CHPC/*.PlyGen.abundance.txt);
do
	Rscript $Data/bin/A1.1_Plot_Abundance_heatmap.r $i $Data/bin/CHPC-grouping.info $Data/Analysis/1_Abundance/CHPC;
done

for i in $(ls $Data/Analysis/1_Abundance/CHPC/*.Genus.abundance.txt);
do
	Rscript $Data/bin/A1.2_Plot_Abundance_box.r $i $Data/bin/CHPC-grouping.info $Data/Analysis/1_Abundance/CHPC 2
done;

###CCC#
for i in $(ls $Data/Analysis/1_Abundance/CCC/*.PlyGen.abundance.txt);
do
	Rscript $Data/bin/A1.1_Plot_Abundance_heatmap.r $i $Data/bin/CCC-grouping.info $Data/Analysis/1_Abundance/CCC;
done

for i in $(ls $Data/Analysis/1_Abundance/CCC/*.Genus.abundance.txt);
do
	Rscript $Data/bin/A1.2_Plot_Abundance_box.r $i $Data/bin/CCC-grouping.info $Data/Analysis/1_Abundance/CCC 2
done;


