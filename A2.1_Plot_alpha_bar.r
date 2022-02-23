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

library(vegan);
library(MASS);

grpInfo <- read.table(groupFile,header=T);
data <- read.table(dataFile,header=T);
Abundance <- t(data.frame(data[,2:ncol(data)]));
Alpha <- as.matrix(diversity(Abundance,index="shannon",MARGIN=1,base=exp(1)));

groupname <- c();
for(i in 1:length(rownames(Alpha)))
{
	groupname <- append(groupname,as.character(grpInfo[grep(names(Alpha[i,]),grpInfo[,1]),grp_col]));
}

rownames(Alpha) <- groupname;
Groups <- as.character(levels(as.factor(grpInfo[,grp_col])))
Alpha.Group <- c();
Alpha.Group.mean  <- c();
Alpha.Group.sd  <- c();
for(i in 1:length(Groups))
{
	Alpha.Group[[i]] <- as.matrix(Alpha[grep(Groups[i],rownames(Alpha)),]);
	Alpha.Group.mean[[i]] <- mean (Alpha.Group[[i]]);
	Alpha.Group.sd[[i]] <- sd (Alpha.Group[[i]]);
}

Alpha.GG.Utest <- c();
Alpha.GG.Asterisk <- c();
for(m in 1:(length(Groups)-1))
{
	for(n in (m+1):length(Groups))
	{
		GG=paste(Groups[m],"-",Groups[n],sep="");
		Alpha.GG.Utest[[GG]]=wilcox.test(Alpha.Group[[m]],Alpha.Group[[n]]);
		if(Alpha.GG.Utest[[GG]]$p.value < 0.001){
			Alpha.GG.Asterisk[[GG]] <- '***' ;
		}
		else if(Alpha.GG.Utest[[GG]]$p.value < 0.01){
                        Alpha.GG.Asterisk[[GG]] <- ' **' ;
		}
		else if(Alpha.GG.Utest[[GG]]$p.value < 0.05){
                        Alpha.GG.Asterisk[[GG]] <- '  *' ;
		}
		else{
			Alpha.GG.Asterisk[[GG]] <- '   ' ;
		}
	}
}



pdf(paste(outDir,"/",SamID,".alpha.barplot.pdf",sep=""),width=4,height=4)

y.lim <- max(Alpha.Group.mean+Alpha.Group.sd)*1.3;
err.wid <- 0.1
sig.tick <- 0.03
gap <- 0.008
step <- 0.03

bar.pos <- barplot(Alpha.Group.mean,border=NA,col=rainbow(length(Groups)),names.arg=Groups,ylim=c(0,y.lim),ylab='Shannon index',cex.names=1.0,cex.lab=1.0,cex=1.2)
rect(par('usr')[1],0,par('usr')[2],y.lim,border=NA)
segments(bar.pos,Alpha.Group.mean-Alpha.Group.sd,bar.pos,Alpha.Group.mean+Alpha.Group.sd)
segments(c(bar.pos-err.wid,bar.pos-err.wid),c(Alpha.Group.mean-Alpha.Group.sd,Alpha.Group.mean+Alpha.Group.sd),c(bar.pos+err.wid,bar.pos+err.wid),c(Alpha.Group.mean-Alpha.Group.sd,Alpha.Group.mean+Alpha.Group.sd),lwd=0.6)

for(m in 1:(length(Groups)-1))
{
        for(n in (m+1):length(Groups))
       {
		GG=paste(Groups[m],"-",Groups[n],sep="");
		if(Alpha.GG.Utest[[GG]]$p.value < 0.05)
		{
			lines(rep(c(bar.pos[m],bar.pos[n]-gap),each=2),c(y.lim*(1-step*(n+m))-sig.tick,y.lim*(1-step*(n+m)),y.lim*(1-step*(n+m)),y.lim*(1-step*(n+m))-sig.tick),lwd=0.7);
			text(median(c(bar.pos[m],bar.pos[n]-gap)),y.lim*(1-step*(n+m)+0.02),labels=Alpha.GG.Asterisk[[GG]]);
		}
	}
}
		

dev.off()
