#StepIV:Alignment and remove Chimera
#NOTE: The QIIME enviroment should be set firstly!

Data=/project/16S/WLR;
GREENGENE=/project/Ref_database/greengenes;

cd $Data;
[ ! -d 5_remove_Chimera ] && mkdir 5_remove_Chimera;

#Step 4.1
align_seqs.py -i $Data/4_Picked_OTUs/Total.gut.sub5W_rep_set.filter_4.fa -m pynast -o $Data/5_remove_Chimera -t $GREENGENE/core_set_aligned.fasta.imputed

#Step 4.2
identify_chimeric_seqs.py -i $Data/5_remove_Chimera/Total.gut.sub5W_rep_set.filter_4_aligned.fasta -m ChimeraSlayer -a $GREENGENE/core_set_aligned.fasta.imputed -o $Data/5_remove_Chimera/Total.gut.sub5W_rep_set.filter_4_aligned.chimeric_seqs.txt;

#Step 4.3
filter_fasta.py -f $Data/5_remove_Chimera/Total.gut.sub5W_rep_set.filter_4_aligned.fasta -o $Data/5_remove_Chimera/Total.gut.sub5W_rep_set.filter_4_noChimera_aligned.fasta -s $Data/5_remove_Chimera/Total.gut.sub5W_rep_set.filter_4_aligned.chimeric_seqs.txt -n;

#Step 4.4
filter_alignment.py -i $Data/5_remove_Chimera/Total.gut.sub5W_rep_set.filter_4_noChimera_aligned.fasta -o $Data/5_remove_Chimera;

#Step 4.5
grep ">" $Data/5_remove_Chimera/Total.gut.sub5W_rep_set.filter_4_failures.fasta|sed -e 's/^>//' |cat - $Data/5_remove_Chimera/Total.gut.sub5W_rep_set.filter_4_aligned.chimeric_seqs.txt  |cut -f1 |cut -d' ' -f1 > $Data/5_remove_Chimera/Total.gut.sub5W.rmOTUs_Chimera_AlignFail.txt

