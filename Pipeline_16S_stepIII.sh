#StepIII:Pick OTUs
#NOTE: This step could be taken days!
#NOTE: The QIIME enviroment should be set firstly!

Data=/project/16S/WLR;
cd $Data;
[ ! -d 4_Picked_OTUs ] && mkdir 4_Picked_OTUs;

#3.1 For Gut data
pick_otus.py -i $Data/3_filtered_fa/Total.gut.sub5W.fa -o $Data/4_Picked_OTUs/;

pick_rep_set.py -i $Data/4_Picked_OTUs/Total.gut.sub5W_otus.txt -f $Data/3_filtered_fa/Total.gut.sub5W.fa -o $Data/4_Picked_OTUs/Total.gut.sub5W_rep_set.fa;
 
#3.2 Keep the OTUs with minimum 4 reads.
$Data/bin/filter_OTUs_byReads.pl $Data/4_Picked_OTUs/Total.gut.sub5W_otus.txt $Data/4_Picked_OTUs/Total.gut.sub5W_rep_set.fa 4;



