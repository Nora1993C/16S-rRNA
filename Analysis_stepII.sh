#Analysis StepI:Convert the raw Qiime abundance file to the tab-format files!
#Current working taxanomic level is Genus

Data=/home/Project/16S/WLR;
cd $Data;

[ ! -d $Data/Analysis ] && mkdir $Data/Analysis;
[ ! -d $Data/Analysis/2_Diversity ] && mkdir $Data/Analysis/2_Diversity;

cp $Data/Analysis/1_Abundance/*.Genus.abundance.txt $Data/Analysis/2_Diversity/;
for i in $(ls $Data/Analysis/2_Diversity/*.Genus.abundance.txt)
do
	ID=$(basename $i);
	Rscript $Data/bin/A2.1_Plot_alpha_bar.r $i $Data/bin/${ID%.*.*.*}-grouping.info $Data/Analysis/2_Diversity 2;
	Rscript $Data/bin/A2.2_Plot_beta_bar.r $i $Data/bin/${ID%.*.*.*}-grouping.info $Data/Analysis/2_Diversity 2;
done

cd $Data/bin
#bash A2.0_Extract_Group_abundance.sh
#bash A2.3_Group_figures.sh
