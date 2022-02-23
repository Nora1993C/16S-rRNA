arg <- commandArgs(T)
if(length(arg) < 4){
        cat("Argument: Data_File Out_Dir Group_File File\n")
        quit('no')
}
#arg <- c("spearman_approx.resample.otu.txt","/home/wmj/Metagenome-2/16s/ZSL-1/Analysis/8_OTUs_beta","HH-HC","HM-HC", "HL-HC","HP-HC","HH-HC-CC","HM-HC-CC","HL-HC-CC","HP-HC-CC", "CC-CP","HHC", "HMC","HCL","HPC","CHHC", "CHMC" , "CHLC" ,"CHPC","CCC", "9")


dir <- arg[2]
setwd(dir)
len_group <- as.numeric(arg[length(arg)])
group <- arg[3:(2+len_group)]
file <- arg[(3+len_group):(length(arg)-1)]


data <- read.table(file=arg[1],header=T,row.names=1)
data_name <- colnames(data)
for (i in 1:length(group)){
	if (group[i] != "Total"){
		gg <- unlist(strsplit(group[i],split="-"))
		cc <- c()
		for (j in 1:length(gg)){
			m1 <- paste("^",gg[j],"[0-9]*",sep="")
			c1 <- grep(m1,data_name,value=F,fixed = F,ignore.case = F)
			cc <- c(cc,c1)
		}
		dd <- data[cc,cc]
	} else {
		dd <- data
	}
	ff <- unlist(strsplit(basename(arg[1]),'.',fixed=T))
	files <- paste(file[i],"/",ff[1],"-",group[i],".def",".txt",sep="")
	write.table(dd,file=files,quote=F,sep = "\t",col.names = NA)

}

