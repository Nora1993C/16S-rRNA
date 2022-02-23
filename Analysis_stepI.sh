#Analysis StepI:Convert the raw Qiime abundance file to the tab-format files!
#Current working taxanomic level is Genus

Data=/home/Project/16S/WLR;
cd $Data;

[ ! -d $Data/Analysis ] && mkdir $Data/Analysis;
[ ! -d $Data/Analysis/1_Abundance ] && mkdir $Data/Analysis/1_Abundance;

cp $Data/7_Taxa/*.otu_table_L6.txt $Data/Analysis/1_Abundance;
for i in $(ls $Data/Analysis/1_Abundance/*.otu_table_L6.txt);
do
	perl $Data/bin/A0.0_extract_abundance.pl $i;
done

for i in $(ls $Data/Analysis/1_Abundance/*.abundance.tmp1.txt);
do
	perl $Data/bin/A0.1_rm_duplicate_taxa.pl $i;
done

for i in $(ls $Data/Analysis/1_Abundance/*.abundance.tmp2.txt);
do
	perl $Data/bin/A0.2_sort_indi_abundance.pl $i;
done

rm $Data/Analysis/1_Abundance/*abundance.tmp*.txt;

for i in $(ls $Data/Analysis/1_Abundance/*.otu_table_L6.txt);
do
	perl $Data/bin/A0.3_add_phyla_abundance.pl $i;
done

for i in $(ls $Data/Analysis/1_Abundance/*.PlyGen.abundance.txt);
do
	ID=$(basename $i);
	Rscript $Data/bin/A1.1_Plot_Abundance_heatmap.r $i $Data/bin/${ID%.*.*.*}-grouping.info $Data/Analysis/1_Abundance;
done

for i in $(ls $Data/Analysis/1_Abundance/*.Genus.abundance.txt);
do
	ID=$(basename $i);
	Rscript $Data/bin/A1.2_Plot_Abundance_box.r $i $Data/bin/${ID%.*.*.*}-grouping.info $Data/Analysis/1_Abundance 2
done;


###Group###
#bash A1.0_Extract_Group_abundance.sh
#bash A1.3_Group_figures.sh

