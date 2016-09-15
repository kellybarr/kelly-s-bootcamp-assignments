mean_heights_100<-0
mean_heights_1000<-0
get_heights<-function(num){
  heights<-rnorm(num,mean=69,sd=10)
  return(mean(heights))
}
for(i in 1:1000){
  mean_heights_100[i]<-get_heights(100)
  mean_heights_1000[i]<-get_heights(1000)
}
bins<-seq(65,72.5,by=0.5)
counts100<-hist(mean_heights_100,breaks=bins)$counts
counts1000<-hist(mean_heights_1000,breaks=bins)$counts

pdf(file="kellys_barplot_heights.pdf",width=6,height=6)
par(mfrow=c(1,1),mar=c(4,4,3,2))

barplot(rbind(counts100,counts1000),col=c(2,4),beside=T,names.arg=seq(65,72,by=0.5),xlab="Mean Heights",ylab="Total")
legend("right",c("N=100","N=1000"),col=c(2,4),lwd=2,bty="n")
dev.off()
