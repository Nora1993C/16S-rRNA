
Data=/home/Metagenome-2/16S/LEH;
cd $Data/bin;
###HHC###
[ ! -d $Data/Analysis/2_Diversity/HHC ] && mkdir $Data/Analysis/2_Diversity/HHC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/2_Diversity/gut.Genus.abundance.txt gut-grouping.info $Data/Analysis/2_Diversity/HHC/gut.HHC.Genus.abundance.txt HC HH

###HMC###
[ ! -d $Data/Analysis/2_Diversity/HMC ] && mkdir $Data/Analysis/2_Diversity/HMC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/2_Diversity/gut.Genus.abundance.txt gut-grouping.info $Data/Analysis/2_Diversity/HMC/gut.HMC.Genus.abundance.txt HC HM

###HLC###
[ ! -d $Data/Analysis/2_Diversity/HLC ] && mkdir $Data/Analysis/2_Diversity/HLC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/2_Diversity/gut.Genus.abundance.txt gut-grouping.info $Data/Analysis/2_Diversity/HLC/gut.HLC.Genus.abundance.txt HC HL

###HPC###
[ ! -d $Data/Analysis/2_Diversity/HPC ] && mkdir $Data/Analysis/2_Diversity/HPC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/2_Diversity/gut.Genus.abundance.txt gut-grouping.info $Data/Analysis/2_Diversity/HPC/gut.HPC.Genus.abundance.txt HC HP

###CHHC###
[ ! -d $Data/Analysis/2_Diversity/CHHC ] && mkdir $Data/Analysis/2_Diversity/CHHC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/2_Diversity/gut.Genus.abundance.txt gut-grouping.info $Data/Analysis/2_Diversity/CHHC/gut.CHHC.Genus.abundance.txt HH HC CC

###CHMC###
[ ! -d $Data/Analysis/2_Diversity/CHMC ] && mkdir $Data/Analysis/2_Diversity/CHMC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/2_Diversity/gut.Genus.abundance.txt gut-grouping.info $Data/Analysis/2_Diversity/CHMC/gut.CHMC.Genus.abundance.txt HM HC CC

###CHLC###
[ ! -d $Data/Analysis/2_Diversity/CHLC ] && mkdir $Data/Analysis/2_Diversity/CHLC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/2_Diversity/gut.Genus.abundance.txt gut-grouping.info $Data/Analysis/2_Diversity/CHLC/gut.CHLC.Genus.abundance.txt HL HC CC

###CHPC###
[ ! -d $Data/Analysis/2_Diversity/CHPC ] && mkdir $Data/Analysis/2_Diversity/CHPC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/2_Diversity/gut.Genus.abundance.txt gut-grouping.info $Data/Analysis/2_Diversity/CHPC/gut.CHPC.Genus.abundance.txt HP HC CC

###CCC###
[ ! -d $Data/Analysis/2_Diversity/CCC ] && mkdir $Data/Analysis/2_Diversity/CCC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/2_Diversity/gut.Genus.abundance.txt gut-grouping.info $Data/Analysis/2_Diversity/CCC/gut.CCC.Genus.abundance.txt CC CP




