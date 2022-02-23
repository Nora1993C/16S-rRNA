arg <- commandArgs(T)
if(length(arg) != 3){
    cat("Argument: dataFile groupFile Out_Dir \n")
    quit('no')
}

dataFile <- arg[1];
groupFile <- arg[2];
outDir <- arg[3];

#datafile <- "chao1group.txt"
#grpfile <- "../../../bin/cecum-grouping.info"
data <- read.table(datafile,header=F,na.strings="NA",fill=TRUE,check.names = FALSE)
grp <-read.table(grpfile,header=T,row.names=1,check.names = FALSE)

SamID <- strsplit(basename(datafile),'.',fixed=T)[[1]][1] ####### NOTE
grpname <- strsplit(basename(grpfile),'-',fixed=T)[[1]][1]
#########绘图
col.err=c("#DC143C64","#4169E164","#2E8B5764","#9932CC64","#FF8C0064","#FFFF0064","#8B451364","#FF69B464","#80808064")
#col.err=c("#DC143C","#4169E1","#2E8B57","#9932CC","#FF8C00","#FFFF00","#8B4513","#FF69B4","#808080")
col.line=c("#DC143C","#4169E1","#2E8B57","#9932CC","#FF8C00","#FFFF00","#8B4513","#FF69B4","#808080")
### 自定义标准误
plot.error <- function(x, y, sd, len = 1, col = "black",lwd=1,lty=1) {
	len <- len * 0.05 
	arrows(x0 = x, y0 = y, x1 = x, y1 = y - sd, col = col, angle = 90, length = len,lty=lty,lwd=lwd) 
	arrows(x0 = x, y0 = y, x1 = x, y1 = y + sd, col = col, angle = 90, length = len,lty=lty,lwd=lwd) 
}

### 坐标轴
x <- data[1,-1]
y <- data[grep('series',data[,1]),-1]
grp.name <- as.character(data[grep('>>',data[,1]),2])
err <- data[grep('error',data[,1]),-1]
x.max <- as.numeric(as.character(data[2,2]))

y1 <- unlist(y)
err1 <- unlist(err)
n.max <- max(y1[!is.na(y1)])
y.max <- n.max +err1[which(y1 == n.max)]
y.max <- ceiling(y.max)*1.5

pdf(paste(outDir,"/",grpname,SamID,".pdf",sep=""),w=5,h=4)
par(mar=c(6,7,4,3),mex=0.5,cex=1,font=1,xaxs = "i", yaxs = "i",adj=0.5,mgp=c(3.5,1,0),lty=1,lwd=1,bty='l')
plot(x=0,y=0,col="white",xlim=c(0,x.max),ylim=c(0,y.max),main="cecum",xlab="Sequences Per Sample",ylab=paste0("Rarefaction Measure:",strsplit(SamID,"group")[[1]][1]),las=1,yaxt='n',cex.main=2,cex.lab=1.2)
axis(side=2,at=seq(0,y.max,1000),las=3)
for (j in 1:nrow(y)){    ### 画曲线 - 标准误
    x1 <- x
    y1 <- y[j,]
    err1 <- err[j,]
    tt <- which(is.na(y[j,]))
    if (length(tt) >0){     ## 先画标准误
        ee <- as.numeric(err1[-tt])
        nne <- seq(0,length(ee),length.out=21)
        plot.error(x=as.numeric(x1[-tt])[nne],y=as.numeric(y1[-tt])[nne],sd=ee[nne],col=col.err[j],lwd=1,lty=1)
    } else {
        ee <- as.numeric(err1)
        nne <- seq(0,length(ee),length.out=21)
        plot.error(x=as.numeric(x1)[nne],y=as.numeric(y1)[nne],sd=ee[nne],col=col.err[j],lwd=1,lty=1)
    }
}
for (j in 1:nrow(y)){    ### 画曲线 - 曲线
    tt <- which(is.na(y[j,]))
    if (length(tt) >0){     ## 再画曲线
        lines(x=as.numeric(x[-tt]),y=as.numeric(y[j,-tt]),col=col.line[j])
        #plot.error(x=as.numeric(x[-tt]),y=as.numeric(y[j,-tt]),sd=as.numeric(err[j,-tt]),col=col[j],lwd=1,lty=1)
    } else {
        lines(x=as.numeric(x),y=as.numeric(y[j,]),col=col.line[j])
        #plot.error(x=as.numeric(x),y=as.numeric(y[j,]),sd=as.numeric(err[j,]),col=col[j],lwd=1,lty=1)
    }
    
}
legend("topleft",legend=grp.name,ncol=1,cex=1.2,bty="n",col=col.line[1:j],lty=1)
dev.off()

