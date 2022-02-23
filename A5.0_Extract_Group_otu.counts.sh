
Data=/home/Metagenome-2/16S/LEH;
cd $Data/bin;
###HHC###
[ ! -d $Data/Analysis/5_Sharing_OTUs/HHC ] && mkdir $Data/Analysis/5_Sharing_OTUs/HHC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/5_Sharing_OTUs/gut.otu.counts.txt gut-grouping.info $Data/Analysis/5_Sharing_OTUs/HHC/HHC.otu.counts.txt HC HH

###HMC###
[ ! -d $Data/Analysis/5_Sharing_OTUs/HMC ] && mkdir $Data/Analysis/5_Sharing_OTUs/HMC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/5_Sharing_OTUs/gut.otu.counts.txt gut-grouping.info $Data/Analysis/5_Sharing_OTUs/HMC/HMC.otu.counts.txt HC HM

###HLC###
[ ! -d $Data/Analysis/5_Sharing_OTUs/HLC ] && mkdir $Data/Analysis/5_Sharing_OTUs/HLC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/5_Sharing_OTUs/gut.otu.counts.txt gut-grouping.info $Data/Analysis/5_Sharing_OTUs/HLC/HLC.otu.counts.txt HC HL

###HPC###
[ ! -d $Data/Analysis/5_Sharing_OTUs/HPC ] && mkdir $Data/Analysis/5_Sharing_OTUs/HPC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/5_Sharing_OTUs/gut.otu.counts.txt gut-grouping.info $Data/Analysis/5_Sharing_OTUs/HPC/HPC.otu.counts.txt HC HP

###CHHC###
[ ! -d $Data/Analysis/5_Sharing_OTUs/CHHC ] && mkdir $Data/Analysis/5_Sharing_OTUs/CHHC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/5_Sharing_OTUs/gut.otu.counts.txt gut-grouping.info $Data/Analysis/5_Sharing_OTUs/CHHC/CHHC.otu.counts.txt HH HC CC

###CHMC###
[ ! -d $Data/Analysis/5_Sharing_OTUs/CHMC ] && mkdir $Data/Analysis/5_Sharing_OTUs/CHMC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/5_Sharing_OTUs/gut.otu.counts.txt gut-grouping.info $Data/Analysis/5_Sharing_OTUs/CHMC/CHMC.otu.counts.txt HM HC CC

###CHLC###
[ ! -d $Data/Analysis/5_Sharing_OTUs/CHLC ] && mkdir $Data/Analysis/5_Sharing_OTUs/CHLC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/5_Sharing_OTUs/gut.otu.counts.txt gut-grouping.info $Data/Analysis/5_Sharing_OTUs/CHLC/CHLC.otu.counts.txt HL HC CC

###CHPC###
[ ! -d $Data/Analysis/5_Sharing_OTUs/CHPC ] && mkdir $Data/Analysis/5_Sharing_OTUs/CHPC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/5_Sharing_OTUs/gut.otu.counts.txt gut-grouping.info $Data/Analysis/5_Sharing_OTUs/CHPC/CHPC.otu.counts.txt HP HC CC

###CCC###
[ ! -d $Data/Analysis/5_Sharing_OTUs/CCC ] && mkdir $Data/Analysis/5_Sharing_OTUs/CCC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/5_Sharing_OTUs/gut.otu.counts.txt gut-grouping.info $Data/Analysis/5_Sharing_OTUs/CCC/CCC.otu.counts.txt CC CP




