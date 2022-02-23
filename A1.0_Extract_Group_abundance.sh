
Data=/home/Metagenome-2/16S/LEH;
cd $Data/bin;
###HHC###
[ ! -d $Data/Analysis/1_Abundance/HHC ] && mkdir $Data/Analysis/1_Abundance/HHC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/1_Abundance/gut.Genus.abundance.txt gut-grouping.info $Data/Analysis/1_Abundance/HHC/gut.HHC.Genus.abundance.txt HC HH
perl A0.5_extract_PlyGen_Abundance_group.pl $Data/Analysis/1_Abundance/gut.PlyGen.abundance.txt gut-grouping.info $Data/Analysis/1_Abundance/HHC/gut.HHC.PlyGen.abundance.txt HC HH

###HMC###
[ ! -d $Data/Analysis/1_Abundance/HMC ] && mkdir $Data/Analysis/1_Abundance/HMC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/1_Abundance/gut.Genus.abundance.txt gut-grouping.info $Data/Analysis/1_Abundance/HMC/gut.HMC.Genus.abundance.txt HC HM
perl A0.5_extract_PlyGen_Abundance_group.pl $Data/Analysis/1_Abundance/gut.PlyGen.abundance.txt gut-grouping.info $Data/Analysis/1_Abundance/HMC/gut.HMC.PlyGen.abundance.txt HC HM

###HLC###
[ ! -d $Data/Analysis/1_Abundance/HLC ] && mkdir $Data/Analysis/1_Abundance/HLC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/1_Abundance/gut.Genus.abundance.txt gut-grouping.info $Data/Analysis/1_Abundance/HLC/gut.HLC.Genus.abundance.txt HC HL
perl A0.5_extract_PlyGen_Abundance_group.pl $Data/Analysis/1_Abundance/gut.PlyGen.abundance.txt gut-grouping.info $Data/Analysis/1_Abundance/HLC/gut.HLC.PlyGen.abundance.txt HC HL

###HPC###
[ ! -d $Data/Analysis/1_Abundance/HPC ] && mkdir $Data/Analysis/1_Abundance/HPC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/1_Abundance/gut.Genus.abundance.txt gut-grouping.info $Data/Analysis/1_Abundance/HPC/gut.HPC.Genus.abundance.txt HC HP
perl A0.5_extract_PlyGen_Abundance_group.pl $Data/Analysis/1_Abundance/gut.PlyGen.abundance.txt gut-grouping.info $Data/Analysis/1_Abundance/HPC/gut.HPC.PlyGen.abundance.txt HC HP

###CHHC###
[ ! -d $Data/Analysis/1_Abundance/CHHC ] && mkdir $Data/Analysis/1_Abundance/CHHC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/1_Abundance/gut.Genus.abundance.txt gut-grouping.info $Data/Analysis/1_Abundance/CHHC/gut.CHHC.Genus.abundance.txt HH HC CC
perl A0.5_extract_PlyGen_Abundance_group.pl $Data/Analysis/1_Abundance/gut.PlyGen.abundance.txt gut-grouping.info $Data/Analysis/1_Abundance/CHHC/gut.CHHC.PlyGen.abundance.txt HH HC CC

###CHMC###
[ ! -d $Data/Analysis/1_Abundance/CHMC ] && mkdir $Data/Analysis/1_Abundance/CHMC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/1_Abundance/gut.Genus.abundance.txt gut-grouping.info $Data/Analysis/1_Abundance/CHMC/gut.CHMC.Genus.abundance.txt HM HC CC
perl A0.5_extract_PlyGen_Abundance_group.pl $Data/Analysis/1_Abundance/gut.PlyGen.abundance.txt gut-grouping.info $Data/Analysis/1_Abundance/CHMC/gut.CHMC.PlyGen.abundance.txt HM HC CC

###CHLC###
[ ! -d $Data/Analysis/1_Abundance/CHLC ] && mkdir $Data/Analysis/1_Abundance/CHLC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/1_Abundance/gut.Genus.abundance.txt gut-grouping.info $Data/Analysis/1_Abundance/CHLC/gut.CHLC.Genus.abundance.txt HL HC CC
perl A0.5_extract_PlyGen_Abundance_group.pl $Data/Analysis/1_Abundance/gut.PlyGen.abundance.txt gut-grouping.info $Data/Analysis/1_Abundance/CHLC/gut.CHLC.PlyGen.abundance.txt HL HC CC

###CHPC###
[ ! -d $Data/Analysis/1_Abundance/CHPC ] && mkdir $Data/Analysis/1_Abundance/CHPC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/1_Abundance/gut.Genus.abundance.txt gut-grouping.info $Data/Analysis/1_Abundance/CHPC/gut.CHPC.Genus.abundance.txt HP HC CC
perl A0.5_extract_PlyGen_Abundance_group.pl $Data/Analysis/1_Abundance/gut.PlyGen.abundance.txt gut-grouping.info $Data/Analysis/1_Abundance/CHPC/gut.CHPC.PlyGen.abundance.txt HP HC CC

###CCC###
[ ! -d $Data/Analysis/1_Abundance/CCC ] && mkdir $Data/Analysis/1_Abundance/CCC;
perl A0.4_extract_Genus_Abundance_group.pl $Data/Analysis/1_Abundance/gut.Genus.abundance.txt gut-grouping.info $Data/Analysis/1_Abundance/CCC/gut.CCC.Genus.abundance.txt CC CP
perl A0.5_extract_PlyGen_Abundance_group.pl $Data/Analysis/1_Abundance/gut.PlyGen.abundance.txt gut-grouping.info $Data/Analysis/1_Abundance/CCC/gut.CCC.PlyGen.abundance.txt CC CP




