#Current working taxanomic level is Genus

Data=/project/16S/WJL
cd $Data;

[ ! -d $Data/Analysis/16_alphaRarefactionPlot ] && mkdir $Data/Analysis/16_alphaRarefactionPlot;
for i in $(ls $Data/bin/*.info);
do
    ID=$(basename $i)
	[ ! -d $Data/Analysis/16_alphaRarefactionPlot/${ID%-*.*} ] && mkdir $Data/Analysis/16_alphaRarefactionPlot/${ID%-*.*};
	cp $Data/12_alphaRarefactionPlot/${ID%-*.*}/average_tables/*group.txt $Data/Analysis/16_alphaRarefactionPlot/${ID%-*.*}
   	for j in $(ls $Data/Analysis/16_alphaRarefactionPlot/${ID%-*.*}/*.txt);
    	do
        	Rscript $Data/bin/A12.1_alphaplot.r $j $i $Data/Analysis/16_alphaRarefactionPlot/${ID%-*.*};
	done
done






