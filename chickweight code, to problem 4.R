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


####BELOW This is experimental, trying to figure out problem 4.
Diet_mean<-subset(data,Chick)
Diet1<-subset(data,Diet==1)
Diet2<-subset(data,Diet==2)
Diet3<-subset(data,Diet==3)
Diet4<-subset(data,Diet==4)
Diet1_mean<-apply(Diet1,(Diet1$weight),mean)
plot(Diet1$Time,mean(Diet1$weight))
