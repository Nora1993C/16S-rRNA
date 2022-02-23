library("GeneNet");
library("graph");
#library("Rgraphviz");

arg <- commandArgs(T)
if(length(arg) != 4){
        cat("Argument: Data_File Group_File Out_Dir Group_column\n")
        quit('no')
}


dataFile <- arg[1];
groupFile <- arg[2];
outDir <- arg[3];
grp_col <- as.numeric(arg[4]);

SamID <- strsplit(basename(dataFile),'.',fixed=T)[[1]][1];

grpInfo <- read.table(groupFile,header=T);
data <- read.table(dataFile,header=T);
Abundance <- as.matrix(t(data.frame(data[,2:ncol(data)])));
colnames(Abundance) <- data[,1];

groupname <- c();
for(i in 1:length(rownames(Abundance)))
{
        groupname <- append(groupname,as.character(grpInfo[grep(rownames(Abundance)[i],grpInfo[,1]),grp_col]));
}

rownames(Abundance) <- groupname;
Groups <- as.character(levels(as.factor(grpInfo[,grp_col])))
Abundance.Group <- c();

for(i in 1:length(Groups))
{
        Abundance.Group[[i]] <- as.matrix(Abundance[grep(Groups[i],rownames(Abundance)),]);
}

###Build the relation network within groups seperately

for(i in 1:length(Groups))
{
	pcor.dyn = ggm.estimate.pcor(Abundance.Group[[i]], method = "dynamic");
	Group.edges = network.test.edges(pcor.dyn,fdr=TRUE,direct=TRUE);
	Group.net = extract.network(Group.edges, method.ggm="number", cutoff.ggm=100);
	node.labels = colnames(Abundance.Group[[i]]);
	DotFile=paste(outDir,"/",SamID,"-",Groups[i],"-pcor.dot",sep="");
	PdfFile=paste(outDir,"/",SamID,"-",Groups[i],"-pcor.pdf",sep="")
	network.make.dot(filename=DotFile,Group.net, node.labels, main="Bacteria Network");
	system(paste("fdp -T pdf -o",PdfFile,DotFile,sep=" "));
}
