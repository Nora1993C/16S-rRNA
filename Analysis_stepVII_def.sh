

#Data=/home/Metagenome-2/16S/LEH;
Data=/home/wmj/Metagenome-2/16s/ZSL-1
[ ! -d $Data/Analysis/8_OTUs_beta ] && mkdir $Data/Analysis/8_OTUs_beta;

cp $Data/14_Statistics/*resample.otu.txt $Data/Analysis/8_OTUs_beta;
#cp $Data/bin/gut-grouping.info $Data/Analysis/8_OTUs_beta	#复制
#sed -i '1d' $Data/Analysis/8_OTUs_beta/gut-grouping.info	###删除第一行
#group=$(awk '{print $2}' $Data/Analysis/8_OTUs_beta/gut-grouping.info | sort -k2n | uniq)
group=("HH-HC" "HM-HC" "HL-HC" "HP-HC" "HH-HC-CC" "HM-HC-CC" "HL-HC-CC" "HP-HC-CC" "CC-CP" "Total")
filename=("HHC" "HMC" "HCL" "HPC" "CHHC" "CHMC" "CHLC" "CHPC" "CCC" "Total")
####建立新文件夹
cd $Data/Analysis/8_OTUs_beta;
len=${#group[@]}
for((i=0;i<len;i++));do
	[ ! -d ${filename[i]} ] && mkdir ${filename[i]}
	ff="$Data""/bin/""${filename[i]}""-grouping.info"
	cp $ff ${filename[i]}
done

#######	R处理
for i in $(ls $Data/Analysis/8_OTUs_beta/*.otu.txt)
do
	dd=$(basename $i)
	Rscript $Data/bin/A7.4_Def.r $dd $Data/Analysis/8_OTUs_beta ${group[@]} ${filename[@]} $len; 
	##参数为读入文件;保存路径;所属文件夹;数组长度
done




for i in $(ls $Data/Analysis/8_OTUs_beta/*/*.def.txt)
do

	ff=$(dirname $i)
	f1=`echo $ff | cut -d'/' -f9` 	
	f2="$ff""/""$f1""-grouping.info"
	Rscript $Data/bin/A7.2_Plot_OTUs_beta_bar.r $i $f2 $Data/Analysis/8_OTUs_beta/$f1 2;
	##参数为Data_File Group_File Out_Dir Group_column


done


### Plot MDS graph basing on beta distance
for i in $(ls $Data/Analysis/8_OTUs_beta/*/*.def.txt)
do
	ff=$(dirname $i)
	f1=`echo $ff | cut -d'/' -f9` 	
	f2="$ff""/""$f1""-grouping.info"
	Rscript $Data/bin/A7.3_Plot_OTUs_beta_mds.r $i $f2 $Data/Analysis/8_OTUs_beta/$f1 2;
	##参数为Data_File Group_File Out_Dir Group_column

done
