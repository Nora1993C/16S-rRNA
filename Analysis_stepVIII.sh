#Analysis StepVIII: do PICRUSt to predict functional profiling
#NOTE: The QIIME enviroment should be set firstly!

Data=/home/Metagenome-2/16S/WLR;
GREENGENE=/home/Metagenome-2/Ref_database/greengenes;

cd $Data;
[ ! -d $Data/Analysis/9_PICRUSt ] && mkdir $Data/Analysis/9_PICRUSt;

#Step 8.1 Pick OTUs
pick_closed_reference_otus.py -f -i $Data/3_filtered_fa/Total.gut.sub5W.fa -o $Data/Analysis/9_PICRUSt -p $Data/bin/otu_picking_params_97.txt -r $GREENGENE/gg_13_8_otus/rep_set/97_otus.fasta -t $GREENGENE/gg_13_8_otus/taxonomy/97_otu_taxonomy.txt
mv $Data/Analysis/9_PICRUSt/otu_table.biom $Data/Analysis/9_PICRUSt/gut.otu_table.biom

#Step 8.2 Normalize OTUs
for i in $(ls $Data/Analysis/9_PICRUSt/*.otu_table.biom)
do
    ID=$(basename $i)
    normalize_by_copy_number.py -i $i -o $Data/Analysis/9_PICRUSt/${ID%.*}.normolized.out.biom
done

#Step 8.3 Predict KEGG
for i in $(ls $Data/Analysis/9_PICRUSt/*.normolized.out.biom)
do
    ID=$(basename $i)
    predict_metagenomes.py -f -i $i -o $Data/Analysis/9_PICRUSt/${ID%.*}.predictions.kegg.biom
    predict_metagenomes.py -i $i -o $Data/Analysis/9_PICRUSt/${ID%.*}.predictions.kegg.biom -a $Data/Analysis/9_PICRUSt/${ID%.*}.nsti_per_sample.kegg.tab
done

#Step 8.4 Predict COG
for i in $(ls $Data/Analysis/9_PICRUSt/*.normolized.out.biom)
do
    ID=$(basename $i)
    predict_metagenomes.py --type_of_prediction cog -f -i $i -o $Data/Analysis/9_PICRUSt/${ID%.*}.predictions.cog.biom
    predict_metagenomes.py --type_of_prediction cog -i $i -o $Data/Analysis/9_PICRUSt/${ID%.*}.predictions.cog.biom -a $Data/Analysis/9_PICRUSt/${ID%.*}.nsti_per_sample.cog.tab
done

#Step 8.5 Predict rfam
for i in $(ls $Data/Analysis/9_PICRUSt/*.normolized.out.biom)
do
    ID=$(basename $i)
    predict_metagenomes.py --type_of_prediction rfam -f -i $i -o $Data/Analysis/9_PICRUSt/${ID%.*}.predictions.rfam.biom
    predict_metagenomes.py --type_of_prediction rfam -i $i -o $Data/Analysis/9_PICRUSt/${ID%.*}.predictions.rfam.biom -a $Data/Analysis/9_PICRUSt/${ID%.*}.nsti_per_sample.rfam.tab
done

#Step 8.6 Collapse KEGG table data 
for i in $(ls $Data/Analysis/9_PICRUSt/*.predictions.kegg.biom)
do
    ID=$(basename $i)
    categorize_by_function.py -i $i -c KEGG_Pathways -l 2 -o $Data/Analysis/9_PICRUSt/${ID%.*.*.*}.catagrized.kegg.L2.biom
    categorize_by_function.py -f -i $i -c KEGG_Pathways -l 2 -o $Data/Analysis/9_PICRUSt/${ID%.*.*.*}.catagrized.kegg.L2.tab
    categorize_by_function.py -i $i -c KEGG_Pathways -l 3 -o $Data/Analysis/9_PICRUSt/${ID%.*.*.*}.catagrized.kegg.L3.biom
    categorize_by_function.py -f -i $i -c KEGG_Pathways -l 3 -o $Data/Analysis/9_PICRUSt/${ID%.*.*.*}.catagrized.kegg.L3.tab
done

#Step 8.7 Collapse COG table data
for i in $(ls $Data/Analysis/9_PICRUSt/*.predictions.cog.biom)
do
    ID=$(basename $i)
    categorize_by_function.py -i $i -c COG_Category -l 2 -o $Data/Analysis/9_PICRUSt/${ID%.*.*.*}.catagrized.cog.L2.biom
    categorize_by_function.py -f -i $i -c COG_Category -l 2 -o $Data/Analysis/9_PICRUSt/${ID%.*.*.*}.catagrized.cog.L2.tab
done

#Step 8.8 Summrize Plot
for i in $(ls $Data/Analysis/9_PICRUSt/*.catagrized.kegg.L2.biom)
do
    ID=$(basename $i)
    summarize_taxa_through_plots.py -f -i $i -p $Data/bin/qiime.kegg.params.txt -o $Data/Analysis/9_PICRUSt/${ID%.*.*.*.*}.KEGG_gut
done
for i in $(ls $Data/Analysis/9_PICRUSt/*.catagrized.cog.L2.biom)
do
    ID=$(basename $i)
    summarize_taxa_through_plots.py -f -i $i -p $Data/bin/qiime.cog.params.txt -o $Data/Analysis/9_PICRUSt/${ID%.*.*.*.*}.COG_gut
done

#Step 8.9 Count to Abundance
for i in $(ls $Data/Analysis/9_PICRUSt/*L2.tab);do sed -i '1d' $i;done
for i in $(ls $Data/Analysis/9_PICRUSt/*L2.tab);do perl -pi -e "s/\#//g" $i;done

for i in $(ls $Data/Analysis/9_PICRUSt/*L3.tab);do sed -i '1d' $i;done
for i in $(ls $Data/Analysis/9_PICRUSt/*L3.tab);do perl -pi -e "s/\#//g" $i;done

for i in $(ls $Data/Analysis/9_PICRUSt/*L3.tab);do perl -pi -e "s/'//g" $i;done
for i in $(ls $Data/Analysis/9_PICRUSt/*.L3.tab);
do
	ID=$(basename $i)
	Rscript $Data/bin/A8.1_PICRUSt_Count2Abundance.r $i $Data/bin/${ID%.*.*.*.*.*}-grouping.info $Data/Analysis/9_PICRUSt 2;
done

for i in $(ls $Data/Analysis/9_PICRUSt/*abundance.txt);
do
	perl -pi -e "s/^\t/ID\t/g" $i;
done
