
Data=/home/Metagenome-2/16S/LEH;
cd $Data/bin;
###HHC###
[ ! -d $Data/Analysis/3_PCA_cluster/HHC ] && mkdir $Data/Analysis/3_PCA_cluster/HHC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/3_PCA_cluster/gut.Genus.abundance.txt gut-grouping.info $Data/Analysis/3_PCA_cluster/HHC/gut.HHC.Genus.abundance.txt HC HH

###HMC###
[ ! -d $Data/Analysis/3_PCA_cluster/HMC ] && mkdir $Data/Analysis/3_PCA_cluster/HMC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/3_PCA_cluster/gut.Genus.abundance.txt gut-grouping.info $Data/Analysis/3_PCA_cluster/HMC/gut.HMC.Genus.abundance.txt HC HM

###HLC###
[ ! -d $Data/Analysis/3_PCA_cluster/HLC ] && mkdir $Data/Analysis/3_PCA_cluster/HLC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/3_PCA_cluster/gut.Genus.abundance.txt gut-grouping.info $Data/Analysis/3_PCA_cluster/HLC/gut.HLC.Genus.abundance.txt HC HL

###HPC###
[ ! -d $Data/Analysis/3_PCA_cluster/HPC ] && mkdir $Data/Analysis/3_PCA_cluster/HPC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/3_PCA_cluster/gut.Genus.abundance.txt gut-grouping.info $Data/Analysis/3_PCA_cluster/HPC/gut.HPC.Genus.abundance.txt HC HP

###CHHC###
[ ! -d $Data/Analysis/3_PCA_cluster/CHHC ] && mkdir $Data/Analysis/3_PCA_cluster/CHHC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/3_PCA_cluster/gut.Genus.abundance.txt gut-grouping.info $Data/Analysis/3_PCA_cluster/CHHC/gut.CHHC.Genus.abundance.txt HH HC CC

###CHMC###
[ ! -d $Data/Analysis/3_PCA_cluster/CHMC ] && mkdir $Data/Analysis/3_PCA_cluster/CHMC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/3_PCA_cluster/gut.Genus.abundance.txt gut-grouping.info $Data/Analysis/3_PCA_cluster/CHMC/gut.CHMC.Genus.abundance.txt HM HC CC

###CHLC###
[ ! -d $Data/Analysis/3_PCA_cluster/CHLC ] && mkdir $Data/Analysis/3_PCA_cluster/CHLC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/3_PCA_cluster/gut.Genus.abundance.txt gut-grouping.info $Data/Analysis/3_PCA_cluster/CHLC/gut.CHLC.Genus.abundance.txt HL HC CC

###CHPC###
[ ! -d $Data/Analysis/3_PCA_cluster/CHPC ] && mkdir $Data/Analysis/3_PCA_cluster/CHPC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/3_PCA_cluster/gut.Genus.abundance.txt gut-grouping.info $Data/Analysis/3_PCA_cluster/CHPC/gut.CHPC.Genus.abundance.txt HP HC CC

###CCC###
[ ! -d $Data/Analysis/3_PCA_cluster/CCC ] && mkdir $Data/Analysis/3_PCA_cluster/CCC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/3_PCA_cluster/gut.Genus.abundance.txt gut-grouping.info $Data/Analysis/3_PCA_cluster/CCC/gut.CCC.Genus.abundance.txt CC CP




