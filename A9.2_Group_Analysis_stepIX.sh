#Analysis StepI: Classify the abundance data 
#Current working taxanomic level is Genus

Data=/home/Metagenome-2/16S/LEH;
cd $Data;

#Prepare the abundance data for LEfSe
for i in $(ls $Data/Analysis/10_LEfSe/HLC/*.abundance.txt);
do
	ID=$(basename $i);
	perl $Data/bin/A9.1_Prepare_LEfSe.pl $i $Data/Analysis/10_LEfSe/HLC/${ID%.*.*}.4lefse.txt $Data/bin/HLC-grouping.info 2 3;
done

#Run LEfSe
for i in $(ls $Data/Analysis/10_LEfSe/HLC/*.4lefse.txt);
do
	ID=$(basename $i);
	format_input.py $i $Data/Analysis/10_LEfSe/HLC/${ID%.*.*}.in -c 1 -s 2 -u 3 -o 1000000;
	run_lefse.py $Data/Analysis/10_LEfSe/HLC/${ID%.*.*}.in $Data/Analysis/10_LEfSe/HLC/${ID%.*.*}.res;
	plot_res.py $Data/Analysis/10_LEfSe/HLC/${ID%.*.*}.res $Data/Analysis/10_LEfSe/HLC/${ID%.*.*}.png;
	plot_features.py $Data/Analysis/10_LEfSe/HLC/${ID%.*.*}.in $Data/Analysis/10_LEfSe/HLC/${ID%.*.*}.res $Data/Analysis/10_LEfSe/HLC/${ID%.*.*};
done
