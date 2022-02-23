#Current working taxanomic level is Genus

Data=/project/16S/WLR;
cd $Data;

[ ! -d $Data/Analysis/11_Sig ] && mkdir $Data/Analysis/11_Sig;
### Extract signficant data between groups using U test or KW test


for i in $(ls $Data/Analysis/4_common_OTUs/*.abundance.txt)
do
        ID=$(basename $i);
        Rscript $Data/bin/A10.1_Extract_Sig_KWU.r $i $Data/bin/${ID%.*.*.*}-grouping.info $Data/Analysis/11_Sig 2;
done


for i in $(ls $Data/Analysis/11_Sig/*Sig.data.txt);
do
       perl -pi -e "s/^\t/ID\t/g" $i;
done

### Calculate Distance for Significant Data
[ ! -d $Data/Analysis/12_Sig_Distance ] && mkdir $Data/Analysis/12_Sig_Distance;
for i in $(ls $Data/Analysis/11_Sig/*Sig.data.txt)
do
       ID=$(basename $i);
       Rscript $Data/bin/A10.2_Calculate_Distance.r $i $Data/Analysis/12_Sig_Distance;
done

###Get PCA Plot
[ ! -d $Data/Analysis/13_Sig_PCA ] && mkdir $Data/Analysis/13_Sig_PCA;
for i in $(ls $Data/Analysis/12_Sig_Distance/*.txt)
do
        ID=$(basename $i);
        Rscript $Data/bin/A10.3_Plot_pca.r $i $Data/bin/${ID%.*.*.*.*}-grouping.info $Data/Analysis/13_Sig_PCA 2
done

###Get MDS Plot
[ ! -d $Data/Analysis/14_Sig_MDS ] && mkdir $Data/Analysis/14_Sig_MDS;
for i in $(ls $Data/Analysis/12_Sig_Distance/*.txt)
do
       ID=$(basename $i);
       Rscript $Data/bin/A10.4_Plot_mds.r $i $Data/bin/${ID%.*.*.*.*}-grouping.info $Data/Analysis/14_Sig_MDS 2
done
