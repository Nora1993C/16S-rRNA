
Data=/home/Metagenome-2/16S/LEH;
cd $Data/bin;
###HHC###
[ ! -d $Data/Analysis/8_OTUs_beta/HHC ] && mkdir $Data/Analysis/8_OTUs_beta/HHC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/8_OTUs_beta/abund_jaccard.resample.otu.txt gut-grouping.info $Data/Analysis/8_OTUs_beta/HHC/HHC.abund_jaccard.resample.otu.txt HC HH

###HMC###
[ ! -d $Data/Analysis/8_OTUs_beta/HMC ] && mkdir $Data/Analysis/8_OTUs_beta/HMC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/8_OTUs_beta/abund_jaccard.resample.otu.txt gut-grouping.info $Data/Analysis/8_OTUs_beta/HMC/HMC.abund_jaccard.resample.otu.txt HC HM

###HLC###
[ ! -d $Data/Analysis/8_OTUs_beta/HLC ] && mkdir $Data/Analysis/8_OTUs_beta/HLC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/8_OTUs_beta/abund_jaccard.resample.otu.txt gut-grouping.info $Data/Analysis/8_OTUs_beta/HLC/HLC.abund_jaccard.resample.otu.txt HC HL

###HPC###
[ ! -d $Data/Analysis/8_OTUs_beta/HPC ] && mkdir $Data/Analysis/8_OTUs_beta/HPC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/8_OTUs_beta/abund_jaccard.resample.otu.txt gut-grouping.info $Data/Analysis/8_OTUs_beta/HPC/HPC.abund_jaccard.resample.otu.txt HC HP

###CHHC###
[ ! -d $Data/Analysis/8_OTUs_beta/CHHC ] && mkdir $Data/Analysis/8_OTUs_beta/CHHC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/8_OTUs_beta/abund_jaccard.resample.otu.txt gut-grouping.info $Data/Analysis/8_OTUs_beta/CHHC/CHHC.abund_jaccard.resample.otu.txt HH HC CC

###CHMC###
[ ! -d $Data/Analysis/8_OTUs_beta/CHMC ] && mkdir $Data/Analysis/8_OTUs_beta/CHMC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/8_OTUs_beta/abund_jaccard.resample.otu.txt gut-grouping.info $Data/Analysis/8_OTUs_beta/CHMC/CHMC.abund_jaccard.resample.otu.txt HM HC CC

###CHLC###
[ ! -d $Data/Analysis/8_OTUs_beta/CHLC ] && mkdir $Data/Analysis/8_OTUs_beta/CHLC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/8_OTUs_beta/abund_jaccard.resample.otu.txt gut-grouping.info $Data/Analysis/8_OTUs_beta/CHLC/CHLC.abund_jaccard.resample.otu.txt HL HC CC
perl A0.5_extract_PlyGen_Abundance_group.pl $Data/Analysis/8_OTUs_beta/PlyGen.abundance.txt gut-grouping.info $Data/Analysis/8_OTUs_beta/CHLC/CHLC.PlyGen.abundance.txt HL HC CC

###CHPC###
[ ! -d $Data/Analysis/8_OTUs_beta/CHPC ] && mkdir $Data/Analysis/8_OTUs_beta/CHPC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/8_OTUs_beta/abund_jaccard.resample.otu.txt gut-grouping.info $Data/Analysis/8_OTUs_beta/CHPC/CHPC.abund_jaccard.resample.otu.txt HP HC CC

###CCC###
[ ! -d $Data/Analysis/8_OTUs_beta/CCC ] && mkdir $Data/Analysis/8_OTUs_beta/CCC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/8_OTUs_beta/abund_jaccard.resample.otu.txt gut-grouping.info $Data/Analysis/8_OTUs_beta/CCC/CCC.abund_jaccard.resample.otu.txt CC CP




