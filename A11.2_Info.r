arg1 <- commandArgs(T)
if(length(arg1) < 1){
	cat("Argument: Out_Dir \n")
	quit('no')
}


###########	测试
setwd(arg1[1])
arg <- c("HC-HL","HC-HM","HC-HH")

#########	P值
P <- 0.01

###########	自定义函数区
### 去除NaN
F_del_na <- function(data) {
	t1 <- sum(is.na(data))
	return(t1)
}



### P值符合要求
F_p_save <- function(data) {
	return(length(which(data < P)))
}


### 挑选UP
F_up <- function(data){
	len <- length(which(data[1] < data))
	return(len)
}

###	挑选种属信息
F_ifno <- function(data){
	tt <-unlist(strsplit( as.character(data),split=";"))
	cc <- c("s__","g__","f__","p__")
	mm <- c()
	for(i in 1:length(cc)){
		s <- paste("",cc[i],".*",sep="")
		s1 <- grep(s,tt,value=F,fixed = F,ignore.case = F)
		if(length(s1) == 0) {
			mm <- c(mm,NA)			
		} else {
			hh <- unlist(strsplit( tt[s1],split="__"))
			#nn <- paste("-",hh[2],sep="")
			mm <- c(mm,hh[2])
		}
		
	}
	return(mm)
}
#####################################################

pvalue <- read.csv(file="02_p_value.csv",header=T,row.names=1)


gut <- read.csv(file="02_all_gut.csv",header=T,row.names=1)
gut_row <- rownames(gut)
otu <- sub(pattern="denovo", replacement="OTU",gut_row)  ###替换
rownames(gut) <- otu
gut_col <- colnames(gut)


grp <- length(arg)

########## 比较的P值
p_col <- colnames(pvalue)
cc <- c()
for (i in 1:grp) {
	group <- unlist(strsplit(arg[i],split="-"))
	m1 <- paste(group[1],".*",group[2],sep="")
	c1 <- grep(m1,p_col,value=F,fixed = F,ignore.case = F)
	cc <- c(cc,c1)
}

#######	挑出data	
if (grp != 1){
	len_na <- apply(pvalue[,cc],1,F_del_na)
	p1 <- pvalue[-which(len_na>0),cc]
	all_p1 <- pvalue[-which(len_na>0),]
	g1 <- gut[-which(len_na>0),]
	len_p <- apply(p1,1,F_p_save)
	p2 <- p1[which(len_p > 0),]
	all_p2 <- all_p1[which(len_p > 0),]
	g2 <- g1[which(len_p >0),]

} else {
	len_na <- which(is.na(pvalue[,cc]))
	p1 <- pvalue[-len_na,cc]
	all_p1 <- pvalue[-len_na,]
	g1 <- gut[-len_na,]
	p2 <- p1[which(p1 < P)]
	all_p2 <- all_p1[which(p1 < P),]
	g2 <- g1[which(p1 < P),]
	names(p2) <- rownames(g2)
}

###### UP DOWN
mm <- c("0")
for (i in 1:grp){
	group <- unlist(strsplit(arg[i],split="-"))
	mm <- c(mm,group[2])
	if (i == grp){
		mm[1] <- group[1]
	}
}


nco <- length(mm)+1

abundance <- matrix(NA,ncol=nco,nrow=length(rownames(g2)))
colnames(abundance) <- c(mm,"Factor") ### 1:UP ,0:down
rownames(abundance) <- rownames(g2)

for (i in 1:length(mm)){
	m1 <- paste("^",mm[i],"[0-9]*",sep="")
	c1 <- grep(m1,gut_col,value=F,fixed = F,ignore.case = F)
	abundance[,i] <- apply(g2[,c1],1,mean)
	
}

len_up <- apply(abundance[,1:length(mm)],1,F_up)
abundance[which(len_up > 0),nco] <- 1
abundance[which(is.na(abundance[,nco])),nco] <- 0 


#ord <- order(abundance[,nco],decreasing = F)

#all_abundance <- abundance[ord,]
###########	处理 种属信息
info <- read.csv(file="02_info.csv",header=T,row.names=1)
info_row <- rownames(info)
info_otu <-sub(pattern="denovo", replacement="OTU",info_row)
rownames(info) <- info_otu


tt <- apply(info,1,F_ifno)
temp <- t(tt)
temp <- cbind(temp,rownames(info))
colnames(temp) <- c("Species","Genus","Family","Phylum","ID")

d1 <- cbind(abundance,ID=rownames(abundance))


d2 <- merge(d1,temp,by.x="ID",by.y="ID",sort=F)
############排序
#data <- data[order(-data[[2]], data[[1]]), ]
#d[order(c,-as.integer(b)),]
ord <- order(d2$Factor,d2$Phylum,d2$Family,d2$Genus,d2$Species,decreasing = F)

d3 <- d2[,-1]
rownames(d3) <- d2[,1]


############

write.csv(p2[ord,],file="03_p_value.csv",row.names=T)
write.csv(d3[ord,],file="03_abundance.csv",row.names=T)
write.csv(g2[ord,],file="03_gut.csv",row.names=T)
write.csv(all_p2[ord,],file="03_all_p.csv",row.names=T)
write.csv(temp[,-length(temp[1,])],file="03_all_info.csv",row.name=T)






