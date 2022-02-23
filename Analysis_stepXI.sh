#Current working taxanomic level is Genus

Data=/home/Project/16S/WJL;
#Data=/home/wmj/Metagenome-2/16s/ZSL-1
cd $Data;

[ ! -d $Data/Analysis/15_RDA_and_Heatmap ] && mkdir $Data/Analysis/15_RDA_and_Heatmap;


for i in $(ls $Data/Analysis/4_common_OTUs/Total*_table.txt)
do
	data=$(basename $i);
	cp $i $Data/Analysis/15_RDA_and_Heatmap/$data
	sed -i "s/#/""/g" $Data/Analysis/15_RDA_and_Heatmap/$data ### 删除"#"
	sed -i '1d' $Data/Analysis/15_RDA_and_Heatmap/$data	###删除第一行
	Rscript $Data/bin/A11.1_RDA.r $data $Data/Analysis/15_RDA_and_Heatmap ; ##参数为读入文件;保存路径
	Rscript $Data/bin/A11.2_Info.r $Data/Analysis/15_RDA_and_Heatmap ;	#参数为保存路径
	Rscript $Data/bin/A11.3_Heatmap.r $Data/Analysis/15_RDA_and_Heatmap ;	#参数为保存路径
	#########	R运行参数若换数据，需在 A11*.r	里手动修改

done



