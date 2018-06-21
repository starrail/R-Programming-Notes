###2.14 HW
N <- 100000 #sample size
counter <- 0 #reset counter
for(i in rnorm(N)){
  if(i<1 & i>-1){
    counter <- counter + 1
  }
}
answer <- counter/N
answer

#conclusion: the answer is almost equal to 0.68