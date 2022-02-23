arg1 <- commandArgs(T)
if(length(arg1) < 2){
	cat("Argument: Data_File Out_Dir \n")
	quit('no')
}
 

###########	测试
setwd(arg1[2])
arg <- c("CC-CP","HC-CC","HC-HL","HC-HM","HC-HH","HC-HP")

#########	P值
P <- 0.01
library(vegan) 
####################自定义函数区######################
### Tukey's HSD
F_Tukey <- function(data) {
	ss <- names(data)
	model <- aov(data ~ ss)
	posthoc <- TukeyHSD(model)
	return(posthoc$ss[4])
} 


#####################################################


#####数据读取
#sp <- read.table(file=file.choose(),sep="\t",header=T,row.names=1) 
 
gut <- read.table(file=arg1[1],header=T,row.names=1,sep="\t")
gut_row <- rownames(gut)
otu <- sub(pattern="denovo", replacement="OTU",gut_row)  ###替换
rownames(gut) <- otu
gut_col <- colnames(gut)
#p_value <- vector('list',grp)
#names(p_value) <- arg
grp <- length(arg)
p_value <- matrix(NA,ncol=grp,nrow=length(gut_row))
rownames(p_value) <- rownames(gut)
colnames(p_value) <- arg

write.csv(gut,file="01_all_gut.csv",row.names=T)
write.csv(gut[,-length(gut[1,])],file="02_all_gut.csv",row.names=T)
#############数据重组并Tukey检验
for (i in 1:grp){
	group <- unlist(strsplit(arg[i],split="-"))
	m1 <- paste("^",group[1],"[0-9]*",sep="")
	c1 <- grep(m1,gut_col,value=F,fixed = F,ignore.case = F)
	m2 <- paste("^",group[2],"[0-9]*",sep="")
	c2 <- grep(m2,gut_col,value=F,fixed = F,ignore.case = F)
	data1 <- gut[,c1]
	data2 <- gut[,c2]
	D <- rep(group[1],length(c1))
	H <- rep(group[2],length(c2))
	temp <- as.matrix(cbind(data1,data2))
	colnames(temp) <- c(D,H)	
	p_value[,i] <- apply(temp,1,F_Tukey)
}


write.csv(p_value,file="02_p_value.csv",row.names=T)



pdf(file="RDA.pdf")
len_arg <- length(arg)
lay_row <- ceiling(len_arg/3)
if(len_arg %% 2 !=0)
{	
	lay_num <- c(1:len_arg,0)
} else {
	lay_num <- c(1:len_arg)
}
lay <-matrix(lay_num,ncol=3,nrow=lay_row,byrow=T)

layout(mat=lay)
########### rda or cca
for (i in 1:grp){
	group <- unlist(strsplit(arg[i],split="-"))
	m1 <- paste("^",group[1],"[0-9]*",sep="")
	c1 <- grep(m1,gut_col,value=F,fixed = F,ignore.case = F)
	m2 <- paste("^",group[2],"[0-9]*",sep="")
	c2 <- grep(m2,gut_col,value=F,fixed = F,ignore.case = F)
	data1 <- gut[,c1]
	data2 <- gut[,c2]
	temp <- as.matrix(cbind(data1,data2))

	len_nan <- which(is.nan(p_value[,i]))
	p1 <- p_value[-len_nan,i]
	d1 <- temp[-len_nan,]
	len_p <- which(p1 < P)
	d2 <- d1[len_p,]
	dd <- t(d2)
	#rr <- decorana(temp)   
	pca <- rda(dd,scale=T) 
	in1 <- c( rep(1,length(c1)),rep(0,length(c2)) )
	in2 <- c( rep(0,length(c1)),rep(1,length(c2)) )
	info <- cbind(in1,in2)
	ax <- envfit(pca,info,permu=999)   
	xy <- ax$vectors$arrows
	pp <- ax$vectors$pvals
	
 
	#p_pca <- permutest(pca,permu=999)
	
#	print(filename)
	
	par(cex=0.5)
	biplot(pca,scaling=3,xlab="RDA1",ylab="RDA2",display="sp",col="blue",xlim=c(-1,1),type="text",main=arg[i]) #sp:物种，si:样方，bp:环境因子
	arrows(x0=0,y0=0,x1=xy[1,1],y1=xy[1,2]+0.1,code=2,col="red",length=0.1) ##YES
	text(x=xy[1,1],y=xy[1,2],labels=group[1],col="red",font=2)
	arrows(x0=0,y0=0,x1=xy[2,1],y1=xy[2,2],code=2,col="red",length=0.1,) ###NO
	text(x=xy[2,1],y=xy[2,2]+0.1,labels=group[2],col="red",font=2)
	txt <- paste("P Value",pp[1],sep = "=")
	mtext(text=txt,side=3,adj=1,cex=0.5)
	#title()
	
}

dev.off()

info <- gut[,length(gut[1,])]
names(info) <- otu
write.csv(info,file="02_info.csv",row.names=T)





