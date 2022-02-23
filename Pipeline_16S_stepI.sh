#StepI:Convert the raw joined reads from Fastq format to Fasta format!
#NOTE: The QIIME enviroment should be set firstly!

Data=/project/16S/WLR;
cd $Data;

[ ! -d 2_combine_fa ] && mkdir 2_combine_fa;
for i in $(ls $Data/1_combine_fq/*.fq);
do
	convert_fastaqual_fastq.py -c fastq_to_fastaqual -f $i;
done
mv *.fna $Data/2_combine_fa;
mv *.qual $Data/2_combine_fa;
