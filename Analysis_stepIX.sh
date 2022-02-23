#Analysis StepI: Classify the abundance data 
#Current working taxanomic level is Genus

Data=/home/Metagenome-2/16S/WLR;
cd $Data;

[ ! -d $Data/Analysis/10_LEfSe ] && mkdir $Data/Analysis/10_LEfSe;

cp  $Data/Analysis/1_Abundance/*.Genus.abundance.txt $Data/Analysis/10_LEfSe/;
cp $Data/Analysis/9_PICRUSt/*.abundance.txt $Data/Analysis/10_LEfSe/;

for i in $(ls $Data/Analysis/9_PICRUSt/*.normolized.out.biom);
do
        ID=$(basename $i);
        biom convert -i $i -o $Data/Analysis/10_LEfSe/${ID%.*}.tab --table-type "OTU table" --to-tsv --header-key="taxonomy" --output-metadata-id="Lineage";
done

for i in $(ls $Data/Analysis/10_LEfSe/*.tab);
do
        perl $Data/bin/A9.0_Convert_OTU_table.pl $i;
done

#Prepare the abundance data for LEfSe
for i in $(ls $Data/Analysis/10_LEfSe/*.abundance.txt);
do
	ID=$(basename $i);
	perl $Data/bin/A9.1_Prepare_LEfSe.pl $i $Data/Analysis/10_LEfSe/${ID%.*.*}.4lefse.txt $Data/bin/${ID%.*.*.*}-grouping.info 2;
done

for i in $(ls $Data/Analysis/10_LEfSe/*.out.abundance.txt);
do
        ID=$(basename $i);
        perl $Data/bin/A9.1_Prepare_LEfSe.pl $i $Data/Analysis/10_LEfSe/${ID%.*.*}.4lefse.txt $Data/bin/${ID%.*.*.*.*.*}-grouping.info 2;
done

#Run LEfSe
for i in $(ls $Data/Analysis/10_LEfSe/*.4lefse.txt);
do
	ID=$(basename $i);
	format_input.py $i $Data/Analysis/10_LEfSe/${ID%.*.*}.in -c 1 -u 2  -o 1000000;
	run_lefse.py $Data/Analysis/10_LEfSe/${ID%.*.*}.in $Data/Analysis/10_LEfSe/${ID%.*.*}.res;
	plot_res.py $Data/Analysis/10_LEfSe/${ID%.*.*}.res --format pdf $Data/Analysis/10_LEfSe/${ID%.*.*}.pdf;
	plot_features.py --format pdf --archive zip $Data/Analysis/10_LEfSe/${ID%.*.*}.in $Data/Analysis/10_LEfSe/${ID%.*.*}.res $Data/Analysis/10_LEfSe/${ID%.*.*}.zip;
done

for i in $(ls $Data/Analysis/10_LEfSe/*.out.4lefse.txt);
do
        ID=$(basename $i);
        plot_cladogram.py $Data/Analysis/10_LEfSe/${ID%.*.*}.res --format pdf $Data/Analysis/10_LEfSe/${ID%.*.*}.clad.pdf --clade_sep 0.1;
done
