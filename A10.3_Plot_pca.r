arg <- commandArgs(T)
if(length(arg) != 4){
        cat("Argument: Data_File Group_File Out_Dir Group_column\n")
        quit('no')
}


dataFile <- arg[1];
groupFile <- arg[2];
outDir <- arg[3];
grp_col <- as.numeric(arg[4]);

#dataFile <- "abund_jaccard_Total.resample.otu.txt";
#groupFile <- "gut-grouping.info";
#outDir <- "./";
#grp_col <- 2;

#library(vegan);
#library(MASS);
#library(cluster);
#library(clusterSim);
library(ade4);
library(fpc);

grpInfo <- read.table(groupFile,header=T);

FileName <- strsplit(basename(dataFile),'.',fixed=T)[[1]];
SamID <- FileName[1];
MetID <- FileName[2];
LID <- FileName[3];
DID <- FileName[4];

Beta <- as.matrix(data.frame(read.table(dataFile,header=T,row.names = 1)));

Beta <- Beta[order(rownames(Beta),decreasing=F),];
Beta <- Beta[,order(colnames(Beta),decreasing=F)];

groupname <- c();
for(i in 1:length(rownames(Beta)))
{
	groupname <- append(groupname,as.character(grpInfo[grep(rownames(Beta)[i],grpInfo[,1]),grp_col]));
}

rownames(Beta) <- groupname;
colnames(Beta) <- groupname;

Groups <- as.character(levels(as.factor(grpInfo[,grp_col])))
Beta.Group <- c();
Symbol.Group <- c();
Color.Group <- c();

for(i in 1:length(Groups))
{
	Beta.Group[[i]] <- Beta[grep(Groups[i],rownames(Beta)),grep(Groups[i],colnames(Beta))];
	Symbol.Group <- append(Symbol.Group,as.vector(rep((17+i),nrow(Beta.Group[[i]]))));
	Color.Group <- append(Color.Group,as.vector(rep(rainbow(length(Groups))[i],nrow(Beta.Group[[i]]))));
}

pc <- princomp(Beta);

pdf(paste(outDir,"/",SamID,".",MetID,".",LID,".",DID,".pca.pdf",sep=""),width=4,height=4);

plot(pc$loadings[,1],pc$loadings[,2],col = Color.Group,pch=Symbol.Group,xlab=paste("PC1(",sprintf("%.1f",pc$sde[1]^2/sum(pc$sde^2)*100),"%)",spe=""),ylab=paste("PC2(",sprintf("%.1f",pc$sde[2]^2/sum(pc$sde^2)*100),"%)",spe=""),cex=0.9);

s.class(pc$loadings[,1:2], fac=as.factor(groupname),grid=F, addaxes=F,axesell =T,label=Groups,col=rainbow(length(Groups)),pch=Symbol.Group,add.plot=T);

dev.off()
