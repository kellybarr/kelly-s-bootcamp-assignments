?7

house <- c(4.8, 3.8, 5.7) 
food<- c(3.5, 4.3, 5.0) 
fun <- c(7.8, 2.1, 10.5)
interestRate <- 0.0525
income <- c(21, 21, 21)
bankAccounts <- c(10, 9.2, 5.6) 
for(j in 1:5){
    for (i in 1:length(bankAccounts)){
      if(j%%2==1){
        bankAccounts[i]<-((bankAccounts[i]-(house[i]+food[i]+fun[i])+income[i])+(bankAccounts[i]*interestRate))
        bankAccounts[3]<-bankAccounts[3]+5000
        bankAccounts[1]<-bankAccounts[1]+5000
      }
      else if(j%%2==0){
        bankAccounts[i]<-((bankAccounts[i]-(house[i]+food[i]+fun[i])+income[i])+(bankAccounts[i]*interestRate))
      }
          }  

cat("\n",bankAccounts)
}


#?8
#Why not just sum(1:17)?  aka, not sure how to use a while for this

#?9  boom!
size<-function(num){
  if(num<=-1){
    cat(num," is small")
  }
  if(num>=1){
    cat(num, " is big")
  }
  else{
    cat(num," is medium")
  }
  }