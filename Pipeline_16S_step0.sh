#Join the pair_end reads to one longer reads!
#Usually, the Sequencing company will do this step!

Data=/project/16S/WLR;
cd $Data;

[ ! -d 1_combine_fq ] && mkdir 1_combine_fq;
for i in $(ls $Data/0_raw_data/*_R1_001.fastq);
do
	join_paired_ends.py -f $i -r ${i%_R1_001.fastq}_R2_001.fastq -o ${i%_R1_001.fastq}.join;
	mv ${i%_R1_001.fastq}.join/fastqjoin.join.fastq $Data/1_combine_fq/$(basename $i _R1_001.fastq).join.fq;
	rm -r ${i%_R1_001.fastq}.join;
done
