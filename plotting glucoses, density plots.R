zz<-read.table("pheno.txt",header=T)

quan25<-quantile(zz[,2],probs=c(0.25))
quan75<-quantile(zz[,2],probs=c(0.75))
plot(density(zz[,2],),xlab="Glucose Levels mmol/L",main="Population Sample of Glucose Levels",ylab="Percent of Individals")
abline(v=quan25,lty=3,col="blue")            
abline(v=quan75,lty=3,col="red")
