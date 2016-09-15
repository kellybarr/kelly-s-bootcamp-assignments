pvalsbelow<-function(number){sum(pvals<number)}
#<0.05 181, <0.01 41, <0.001 5

num_pval<-length(pvals)
4014

exp_pvals<-0
for(i in 1:length(pvals)){
  exp_pvals[i]<-(i/(length(pvals)))
}
exp_pvals1<-((1:length(pvals))/length(pvals))

sort_pvals<-sort(pvals)

log_sort_pvals<-(-log10(sort_pvals))
log_exp_pvals<-(-log10(exp_pvals))

qqplot(log_exp_pvals,log_sort_pvals, xlab="-log10 (observed P-Value)", ylab="-log10 (expected P-value)")
lines(log_exp_pvals,log_exp_pvals,col="blue",lwd=3,lty=2)
