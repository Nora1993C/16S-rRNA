#StepIV:Alignment and remove Chimera
#NOTE: The QIIME enviroment should be set firstly!

Data=/project/16S/WLR;
GREENGENE=/project/Ref_database/greengenes;

cd $Data;
[ ! -d 6_Phylogeny ] && mkdir 6_Phylogeny;

#Step 6.1 Make Phylogeny
make_phylogeny.py -i $Data/5_remove_Chimera/Total.gut.sub5W_rep_set.filter_4_noChimera_aligned_pfiltered.fasta -o $Data/6_Phylogeny/Total.gut.sub5W_rep_set.filter_4_noChimera_tree.tre;

#Step 6.2 Taxanomy Assign
[ ! -d 7_Taxa ] && mkdir 7_Taxa;
assign_taxonomy.py -i $Data/4_Picked_OTUs/Total.gut.sub5W_rep_set.filter_4.fa -o $Data/7_Taxa -t $GREENGENE/gg_13_8_otus/taxonomy/97_otu_taxonomy.txt -r $GREENGENE/gg_13_8_otus/rep_set/97_otus.fasta;

#Step 6.3 Make OTUs table
make_otu_table.py -i $Data/4_Picked_OTUs/Total.gut.sub5W_otus.filter_4.txt -t $Data/7_Taxa/Total.gut.sub5W_rep_set.filter_4_tax_assignments.txt -o $Data/7_Taxa/Total.gut.sub5W.filter_4_noChimera_rmAlignFail.otu_table.biom -e $Data/5_remove_Chimera/Total.gut.sub5W.rmOTUs_Chimera_AlignFail.txt;

#Step 6.4 Convert OTUs table from biom-format to txt-format
biom convert -i $Data/7_Taxa/Total.gut.sub5W.filter_4_noChimera_rmAlignFail.otu_table.biom -o $Data/7_Taxa/Total.gut.sub5W.filter_4_noChimera_rmAlignFail.otu_table.txt --table-type "OTU table" --to-tsv --header-key="taxonomy" --output-metadata-id="Consensus Lineage"

#Step 6.5 Summarize Taxanomy
summarize_taxa.py -i $Data/7_Taxa/Total.gut.sub5W.filter_4_noChimera_rmAlignFail.otu_table.biom  -o $Data/7_Taxa/

biom summarize-table -i $Data/7_Taxa/Total.gut.sub5W.filter_4_noChimera_rmAlignFail.otu_table.biom -o $Data/7_Taxa/Total.gut.sub5W.filter_4_noChimera_rmAlignFail.otu_table.summary.txt

for L in {2..6};
do 
	biom summarize-table -i $Data/7_Taxa/Total.gut.sub5W.filter_4_noChimera_rmAlignFail.otu_table_L${L}.biom -o $Data/7_Taxa/Total.gut.sub5W.filter_4_noChimera_rmAlignFail.otu_table_L${L}.summary.txt;
done


