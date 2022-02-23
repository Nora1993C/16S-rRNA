
Data=/home/Metagenome-2/16S/LEH;
cd $Data/bin;
###HHC###
[ ! -d $Data/Analysis/10_LEfSe/HHC ] && mkdir $Data/Analysis/10_LEfSe/HHC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/10_LEfSe/gut.kegg.abundance.txt gut-grouping.info $Data/Analysis/10_LEfSe/HHC/HHC.kegg.abundance.txt HC HH

###HMC###
[ ! -d $Data/Analysis/10_LEfSe/HMC ] && mkdir $Data/Analysis/10_LEfSe/HMC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/10_LEfSe/gut.kegg.abundance.txt gut-grouping.info $Data/Analysis/10_LEfSe/HMC/HMC.kegg.abundance.txt HC HM

###HLC###
[ ! -d $Data/Analysis/10_LEfSe/HLC ] && mkdir $Data/Analysis/10_LEfSe/HLC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/10_LEfSe/gut.kegg.abundance.txt gut-grouping.info $Data/Analysis/10_LEfSe/HLC/HLC.kegg.abundance.txt HC HL

###HPC###
[ ! -d $Data/Analysis/10_LEfSe/HPC ] && mkdir $Data/Analysis/10_LEfSe/HPC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/10_LEfSe/gut.kegg.abundance.txt gut-grouping.info $Data/Analysis/10_LEfSe/HPC/HPC.kegg.abundance.txt HC HP

###CHHC###
[ ! -d $Data/Analysis/10_LEfSe/CHHC ] && mkdir $Data/Analysis/10_LEfSe/CHHC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/10_LEfSe/gut.kegg.abundance.txt gut-grouping.info $Data/Analysis/10_LEfSe/CHHC/CHHC.kegg.abundance.txt HH HC CC

###CHMC###
[ ! -d $Data/Analysis/10_LEfSe/CHMC ] && mkdir $Data/Analysis/10_LEfSe/CHMC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/10_LEfSe/gut.kegg.abundance.txt gut-grouping.info $Data/Analysis/10_LEfSe/CHMC/CHMC.kegg.abundance.txt HM HC CC

###CHLC###
[ ! -d $Data/Analysis/10_LEfSe/CHLC ] && mkdir $Data/Analysis/10_LEfSe/CHLC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/10_LEfSe/gut.kegg.abundance.txt gut-grouping.info $Data/Analysis/10_LEfSe/CHLC/CHLC.kegg.abundance.txt HL HC CC
perl A0.5_extract_PlyGen_Abundance_group.pl $Data/Analysis/10_LEfSe/PlyGen.abundance.txt gut-grouping.info $Data/Analysis/10_LEfSe/CHLC/CHLC.PlyGen.abundance.txt HL HC CC

###CHPC###
[ ! -d $Data/Analysis/10_LEfSe/CHPC ] && mkdir $Data/Analysis/10_LEfSe/CHPC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/10_LEfSe/gut.kegg.abundance.txt gut-grouping.info $Data/Analysis/10_LEfSe/CHPC/CHPC.kegg.abundance.txt HP HC CC

###CCC###
[ ! -d $Data/Analysis/10_LEfSe/CCC ] && mkdir $Data/Analysis/10_LEfSe/CCC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/10_LEfSe/gut.kegg.abundance.txt gut-grouping.info $Data/Analysis/10_LEfSe/CCC/CCC.kegg.abundance.txt CC CP




