#Current working taxanomic level is Genus

Data=/home/Metagenome-2/16S/LEH;
cd $Data;

[ ! -d $Data/Analysis/11_Sig/CHPC ] && mkdir $Data/Analysis/11_Sig/CHPC;
### Extract signficant data between groups using U test or KW test


for i in $(ls $Data/Analysis/4_common_OTUs/CHPC/*.abundance.txt)
do
        ID=$(basename $i);
        Rscript $Data/bin/A10.1_Extract_Sig_KWU.r $i $Data/bin/CHPC-grouping.info $Data/Analysis/11_Sig/CHPC 2;
done


for i in $(ls $Data/Analysis/11_Sig/CHPC/*Sig.data.txt);
do
       perl -pi -e "s/^\t/ID\t/g" $i;
done

### Calculate Distance for Significant Data
[ ! -d $Data/Analysis/12_Sig_Distance/CHPC ] && mkdir $Data/Analysis/12_Sig_Distance/CHPC;
for i in $(ls $Data/Analysis/11_Sig/CHPC/*Sig.data.txt)
do
       ID=$(basename $i);
       Rscript $Data/bin/A10.2_Calculate_Distance.r $i $Data/Analysis/12_Sig_Distance/CHPC;
done

###Get PCA Plot
[ ! -d $Data/Analysis/13_Sig_PCA/CHPC ] && mkdir $Data/Analysis/13_Sig_PCA/CHPC;
for i in $(ls $Data/Analysis/12_Sig_Distance/CHPC/*.txt)
do
        ID=$(basename $i);
        Rscript $Data/bin/A10.3_Plot_pca.r $i $Data/bin/CHPC-grouping.info $Data/Analysis/13_Sig_PCA/CHPC 2
done

###Get MDS Plot
[ ! -d $Data/Analysis/14_Sig_MDS/CHPC ] && mkdir $Data/Analysis/14_Sig_MDS/CHPC;
for i in $(ls $Data/Analysis/12_Sig_Distance/CHPC/*.txt)
do
       ID=$(basename $i);
       Rscript $Data/bin/A10.4_Plot_mds.r $i $Data/bin/CHPC-grouping.info $Data/Analysis/14_Sig_MDS/CHPC 2
done
