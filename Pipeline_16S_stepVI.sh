#StepIV:Alignment and remove Chimera
#NOTE: The QIIME enviroment should be set firstly!

Data=/project/16S/WLR;
GREENGENE=/project/Ref_database/greengenes;

#Step 7.1: Plot Taxa distributions
cd $Data;
[ ! -d 8_Plot ] && mkdir 8_Plot

[ ! -d $Data/8_Plot/Gut ] && mkdir $Data/8_Plot/Gut
plot_taxa_summary.py -i $Data/7_Taxa/Total.gut.sub5W.filter_4_noChimera_rmAlignFail.otu_table_L2.txt,$Data/7_Taxa/Total.gut.sub5W.filter_4_noChimera_rmAlignFail.otu_table_L3.txt,$Data/7_Taxa/Total.gut.sub5W.filter_4_noChimera_rmAlignFail.otu_table_L4.txt,$Data/7_Taxa/Total.gut.sub5W.filter_4_noChimera_rmAlignFail.otu_table_L5.txt,$Data/7_Taxa/Total.gut.sub5W.filter_4_noChimera_rmAlignFail.otu_table_L6.txt -l Phylum,Class,Order,Family,Genus -o $Data/8_Plot/Gut;

#Step 7.2: Make OTU network, visulizing by Cytoscape
make_otu_network.py -i $Data/7_Taxa/Total.gut.sub5W.filter_4_noChimera_rmAlignFail.otu_table.biom -m $Data/bin/gut-grouping.info -o $Data/8_Plot/Gut -b group,"group";

#Step 7.3: Make OTU heatmap
make_otu_heatmap.py -i $Data/7_Taxa/Total.gut.sub5W.filter_4_noChimera_rmAlignFail.otu_table.biom -o $Data/8_Plot/Gut/Total.gut.sub5W.filter_4_noChimera_rmAlignFail.otu_table_heatmap.pdf  --width 7 --height 7


