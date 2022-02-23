#StepII:Filter the raw reads by the minimum length 400bp and subsample 40000 reads from each sample!
#NOTE: The QIIME enviroment should be set firstly!

Data=/project/16S/WLR;
cd $Data;
[ ! -d 3_filtered_fa ] && mkdir 3_filtered_fa;

#2.1 filter Fasta by minimum length 400bp
SIZE=400;
for fa in $(ls $Data/2_combine_fa/*.fna);
do
	$Data/bin/filterFasta_byLength.pl $fa $SIZE;
done
mv  $Data/2_combine_fa/*.filter_400.fna $Data/3_filtered_fa;

#2.2 subsample 40000 reads from each sample!
SubsampleSeq=50000;
for fa in $(ls $Data/3_filtered_fa/*.filter_400.fna)
do
	seq_num=$(grep -c ">" $fa)
	perc=$(echo "$SubsampleSeq $seq_num"| awk -F' ' '{printf "%.3f",$1/$2}')
	subsample_fasta.py -i $fa -p $perc -o ${fa%.filter_400.fna}.sub5W.fa
done

#perl $Data/bin/merge-indi-fasta.pl;
