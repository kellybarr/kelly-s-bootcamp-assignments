data<-ChickWeight
data_day0<-subset(data,Time==0)
boxplot(data_day0$weight~data_day0$Diet)
anova1<-aov(data_day0$weight~data_day0$Diet)
summary(anova1)
TukeyHSD(anova1)
##no differences, yeah!

#checking for differences on last day
max(data$Time)
data_day21<-subset(data,Time==21)
boxplot(data_day21$weight~data_day21$Diet)
anova2<-aov(data_day21$weight~data_day21$Diet)
summary(anova2)
TukeyHSD(anova2)

#yes!  Treatment 3 is statistically higher than 1.  There's no difference between the rest.

data<-within(data,{
  Chick<-factor(Chick)
  Diet<-factor(Diet)
  Time<-factor(Time)
})
summary(aov(weight~Diet*Time+Error(Chick),data=data))

#p<0.0001 (2e-16)


####This resolves problem 4
Diet1<-subset(data,Diet==1)
Diet2<-subset(data,Diet==2)
Diet3<-subset(data,Diet==3)
Diet4<-subset(data,Diet==4)
Diet1a<-aggregate(Diet1[,1],list(Diet1$Time),mean)
Diet2a<-aggregate(Diet2[,1],list(Diet2$Time),mean)
Diet3a<-aggregate(Diet3[,1],list(Diet3$Time),mean)
Diet4a<-aggregate(Diet4[,1],list(Diet4$Time),mean)

plot(Diet1a[,1],Diet1a[,2],type="l",ylim=c(40,280),col="red",lwd=4,ylab="Weight (g)",xlab="Time (days)")
lines(Diet2a[,1],Diet2a[,2],col="blue",lwd=4)
lines(Diet3a[,1],Diet3a[,2],col="darkorange",lwd=4)
lines(Diet4a[,1],Diet4a[,2],col="turquoise4",lwd=4)
legend("topleft",legend=c("Diet 1","Diet 2","Diet 3","Diet 4"),lty=1,lwd=4,col=c("red","blue","darkorange","turquoise4"),bty="n",cex=1.2)

####problem 5:  Why do I need a "for" loop?
plot(data$Time,data$weight, col=data$Chick,pch=20)

##question for the reviewer:  the above does not work with "type = 'l'"?

