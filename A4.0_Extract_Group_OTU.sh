
Data=/home/Metagenome-2/16S/LEH;
cd $Data/bin;
###HHC###
[ ! -d $Data/Analysis/4_common_OTUs/HHC ] && mkdir $Data/Analysis/4_common_OTUs/HHC;
perl A0.6_extract_OTU_Abundance_group.pl $Data/Analysis/4_common_OTUs/Total.gut.sub2W5.filter_4_noChimera_rmAlignFail.otu_table.txt gut-grouping.info $Data/Analysis/4_common_OTUs/HHC/HHC.gut.sub2W5.filter_4_noChimera_rmAlignFail.otu_table.txt HC HH

###HMC###
[ ! -d $Data/Analysis/4_common_OTUs/HMC ] && mkdir $Data/Analysis/4_common_OTUs/HMC;
perl A0.6_extract_OTU_Abundance_group.pl $Data/Analysis/4_common_OTUs/Total.gut.sub2W5.filter_4_noChimera_rmAlignFail.otu_table.txt gut-grouping.info $Data/Analysis/4_common_OTUs/HMC/HMC.gut.sub2W5.filter_4_noChimera_rmAlignFail.otu_table.txt HC HM

###HLC###
[ ! -d $Data/Analysis/4_common_OTUs/HLC ] && mkdir $Data/Analysis/4_common_OTUs/HLC;
perl A0.6_extract_OTU_Abundance_group.pl $Data/Analysis/4_common_OTUs/Total.gut.sub2W5.filter_4_noChimera_rmAlignFail.otu_table.txt gut-grouping.info $Data/Analysis/4_common_OTUs/HLC/HLC.gut.sub2W5.filter_4_noChimera_rmAlignFail.otu_table.txt HC HL

###HPC###
[ ! -d $Data/Analysis/4_common_OTUs/HPC ] && mkdir $Data/Analysis/4_common_OTUs/HPC;
perl A0.6_extract_OTU_Abundance_group.pl $Data/Analysis/4_common_OTUs/Total.gut.sub2W5.filter_4_noChimera_rmAlignFail.otu_table.txt gut-grouping.info $Data/Analysis/4_common_OTUs/HPC/HPC.gut.sub2W5.filter_4_noChimera_rmAlignFail.otu_table.txt HC HP

###CHHC###
[ ! -d $Data/Analysis/4_common_OTUs/CHHC ] && mkdir $Data/Analysis/4_common_OTUs/CHHC;
perl A0.6_extract_OTU_Abundance_group.pl $Data/Analysis/4_common_OTUs/Total.gut.sub2W5.filter_4_noChimera_rmAlignFail.otu_table.txt gut-grouping.info $Data/Analysis/4_common_OTUs/CHHC/CHHC.gut.sub2W5.filter_4_noChimera_rmAlignFail.otu_table.txt HH HC CC

###CHMC###
[ ! -d $Data/Analysis/4_common_OTUs/CHMC ] && mkdir $Data/Analysis/4_common_OTUs/CHMC;
perl A0.6_extract_OTU_Abundance_group.pl $Data/Analysis/4_common_OTUs/Total.gut.sub2W5.filter_4_noChimera_rmAlignFail.otu_table.txt gut-grouping.info $Data/Analysis/4_common_OTUs/CHMC/CHMC.gut.sub2W5.filter_4_noChimera_rmAlignFail.otu_table.txt HM HC CC

###CHLC###
[ ! -d $Data/Analysis/4_common_OTUs/CHLC ] && mkdir $Data/Analysis/4_common_OTUs/CHLC;
perl A0.6_extract_OTU_Abundance_group.pl $Data/Analysis/4_common_OTUs/Total.gut.sub2W5.filter_4_noChimera_rmAlignFail.otu_table.txt gut-grouping.info $Data/Analysis/4_common_OTUs/CHLC/CHLC.gut.sub2W5.filter_4_noChimera_rmAlignFail.otu_table.txt HL HC CC

###CHPC###
[ ! -d $Data/Analysis/4_common_OTUs/CHPC ] && mkdir $Data/Analysis/4_common_OTUs/CHPC;
perl A0.6_extract_OTU_Abundance_group.pl $Data/Analysis/4_common_OTUs/Total.gut.sub2W5.filter_4_noChimera_rmAlignFail.otu_table.txt gut-grouping.info $Data/Analysis/4_common_OTUs/CHPC/CHPC.gut.sub2W5.filter_4_noChimera_rmAlignFail.otu_table.txt HP HC CC

###CCC###
[ ! -d $Data/Analysis/4_common_OTUs/CCC ] && mkdir $Data/Analysis/4_common_OTUs/CCC;
perl A0.6_extract_OTU_Abundance_group.pl $Data/Analysis/4_common_OTUs/Total.gut.sub2W5.filter_4_noChimera_rmAlignFail.otu_table.txt gut-grouping.info $Data/Analysis/4_common_OTUs/CCC/CCC.gut.sub2W5.filter_4_noChimera_rmAlignFail.otu_table.txt CC CP




