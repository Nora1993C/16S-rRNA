#StepIV:Alignment and remove Chimera
#NOTE: The QIIME enviroment should be set firstly!

Data=/project/16S/WLR;
GREENGENE=/project/Ref_database/greengenes;

#Step 8.1: Multiple rarefaction and alpha diversity
[ ! -d $Data/9_Rarefaction ] && mkdir $Data/9_Rarefaction
[ ! -d $Data/10_alphaDiv ] && mkdir $Data/10_alphaDiv
#multiple_rarefactions.py -i $Data/7_Taxa/Total.gut.sub5W.filter_4_noChimera_rmAlignFail.otu_table.biom -m 100 -x 20000 -s 100 -n 10 -o $Data/9_Rarefaction/total/rare100_20000/

[ ! -d $Data/10_alphaDiv/gut ] && mkdir $Data/10_alphaDiv/total
#alpha_diversity.py -i $Data/9_Rarefaction/total/rare100_20000/ -m shannon,PD_whole_tree,chao1,observed_otus -o $Data/10_alphaDiv/total -t $Data/6_Phylogeny/Total.gut.sub5W_rep_set.filter_4_noChimera_tree.tre

for i in {0..9}; do mkdir $Data/9_Rarefaction/total/rare100_20000/iter_${i}; mv $Data/9_Rarefaction/total/rare100_20000/rarefaction_*_${i}.biom  $Data/9_Rarefaction/total/rare100_20000/iter_${i}/ ;done

for i in {0..9};do mkdir $Data/10_alphaDiv/total/iter_${i};done

for i in {0..9};do alpha_diversity.py -i $Data/9_Rarefaction/total/rare100_20000/iter_${i}/ -m shannon,PD_whole_tree,chao1,observed_otus -o $Data/10_alphaDiv/total/iter_${i}/ -t $Data/6_Phylogeny/Total.gut.sub5W_rep_set.filter_4_noChimera_tree.tre;done

for i in {0..9};do mv $Data/10_alphaDiv/total/iter_${i}/* $Data/10_alphaDiv/total; rmdir $Data/10_alphaDiv/total/iter_${i};done

[ ! -d $Data/11_collated_alpha ] && mkdir $Data/11_collated_alpha

collate_alpha.py -i $Data/10_alphaDiv/total/ -o $Data/11_collated_alpha

[ ! -d $Data/12_alphaRarefactionPlot ] && mkdir $Data/12_alphaRarefactionPlot

make_rarefaction_plots.py -i $Data/11_collated_alpha/ -m $Data/bin/gut-grouping.info -g pdf -d 180 -o $Data/12_alphaRarefactionPlot/ --generate_average_tables

## Beta diversity
[ ! -d $Data/13_betaDiv ] && mkdir $Data/13_betaDiv

Depth=20000
single_rarefaction.py -i $Data/7_Taxa/Total.gut.sub5W.filter_4_noChimera_rmAlignFail.otu_table.biom -o $Data/13_betaDiv/Total.gut.sub5W.filter_4_noChimera_rmAlignFail.otu_table_even${Depth}.biom -d $Depth;

beta_diversity.py -i $Data/13_betaDiv/Total.gut.sub5W.filter_4_noChimera_rmAlignFail.otu_table_even${Depth}.biom -o $Data/13_betaDiv/ -t $Data/6_Phylogeny/Total.gut.sub5W_rep_set.filter_4_noChimera_tree.tre -m unifrac,unifrac_g,unweighted_unifrac,weighted_unifrac;

# this line not needed
beta_diversity.py -i $Data/13_betaDiv/Total.gut.sub5W.filter_4_noChimera_rmAlignFail.otu_table_even${Depth}.biom -o $Data/13_betaDiv/

for m in unifrac unweighted_unifrac weighted_unifrac;do principal_coordinates.py -i $Data/13_betaDiv/${m}_Total.gut.sub5W.filter_4_noChimera_rmAlignFail.otu_table_even${Depth}.txt -o $Data/13_betaDiv/${m}_Total.gut.sub5W.filter_4_noChimera_rmAlignFail.otu_table_even${Depth}.pc.txt;done

for m in unifrac unweighted_unifrac weighted_unifrac;do make_2d_plots.py -i $Data/13_betaDiv/${m}_Total.gut.sub5W.filter_4_noChimera_rmAlignFail.otu_table_even${Depth}.pc.txt -m $Data/bin/gut-grouping.info -o $Data/13_betaDiv/ ;done
