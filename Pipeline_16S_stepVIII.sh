#StepVIII:Doing some statistics
#NOTE: The QIIME enviroment should be set firstly!

Data=/project/16S/WLR;

cd $Data;
[ ! -d 14_Statistics ] && mkdir 14_Statistics;

#Step 14.1 Calculate GOOD COVERAGE (Alpha-diversity)
alpha_diversity.py -i $Data/7_Taxa/Total.gut.sub5W.filter_4_noChimera_rmAlignFail.otu_table.biom -m goods_coverage -o $Data/14_Statistics/gut.final.otu.good.coverage.txt;

#Step 14.2 Calculate Shanno Index (Alpha-diversity)
alpha_diversity.py -i $Data/7_Taxa/Total.gut.sub5W.filter_4_noChimera_rmAlignFail.otu_table.biom -m shannon -o $Data/14_Statistics/gut.final.otu.shannon.txt;

#Step 14.3 Calculate Chao1 (Alpha-diversity)
alpha_diversity.py -i $Data/7_Taxa/Total.gut.sub5W.filter_4_noChimera_rmAlignFail.otu_table.biom -m chao1 -o $Data/14_Statistics/gut.final.otu.chao1.txt;

#Step 14.4 Calculate observed_species (Alpha-diversity)
alpha_diversity.py -i $Data/7_Taxa/Total.gut.sub5W.filter_4_noChimera_rmAlignFail.otu_table.biom -m observed_species -o $Data/14_Statistics/gut.final.otu.observed_species.txt;

#Step 14.5 Calculate simpson Index (Alpha-diversity)
alpha_diversity.py -i $Data/7_Taxa/Total.gut.sub5W.filter_4_noChimera_rmAlignFail.otu_table.biom -m simpson -o $Data/14_Statistics/gut.final.otu.simpson.txt;

#Step 14.6 Calculate bray_curtis Index  (Beta-diversity)
beta_diversity.py -i $Data/13_betaDiv/Total.gut.sub5W.filter_4_noChimera_rmAlignFail.otu_table_even20000.biom -m bray_curtis -o $Data/14_Statistics/

#Step 14.7 Calculate bray_curtis_magurran Index  (Beta-diversity)
beta_diversity.py -i $Data/13_betaDiv/Total.gut.sub5W.filter_4_noChimera_rmAlignFail.otu_table_even20000.biom -m bray_curtis_magurran -o $Data/14_Statistics/

#Step 14.8 Calculate binary_jaccard Index  (Beta-diversity)
beta_diversity.py -i $Data/13_betaDiv/Total.gut.sub5W.filter_4_noChimera_rmAlignFail.otu_table_even20000.biom -m binary_jaccard -o $Data/14_Statistics/

#Step 14.9 Calculate abund_jaccard Index  (Beta-diversity)
beta_diversity.py -i $Data/13_betaDiv/Total.gut.sub5W.filter_4_noChimera_rmAlignFail.otu_table_even20000.biom -m abund_jaccard -o $Data/14_Statistics/

#Step 14.10 Calculate spearman_approx Index  (Beta-diversity)
beta_diversity.py -i $Data/13_betaDiv/Total.gut.sub5W.filter_4_noChimera_rmAlignFail.otu_table_even20000.biom -m spearman_approx -o $Data/14_Statistics/

#Step 14.11 Calculate euclidean Index  (Beta-diversity)
beta_diversity.py -i $Data/13_betaDiv/Total.gut.sub5W.filter_4_noChimera_rmAlignFail.otu_table_even20000.biom -m euclidean -o $Data/14_Statistics/




