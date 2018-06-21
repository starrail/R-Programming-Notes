###Lecture 16 what is a vector
#a vector is a sequence of elements 
#in R, index of a vector starts at 1
#a single number or a single character is a vator with lengthe 1



###Lecture 17 create some vectors:c;seq;rep
MyFirstVector = c(3,45,56,325) #combine
MyFirstVector
is.numeric(MyFirstVector) #TRUE
is.integer(MyFirstVector) #FALSE: R saved as double 
is.double(MyFirstVector) #TRUE

V2 <- c(3L,12L,345L,0L) #set as integer 
is.numeric(V2) #TRUE
is.integer(V2) #TRUE
is.double(V2) #FALSE

V3 <- c("a","ab3","Hello") #a character vector
V3
is.character(V3) #TRUE
is.numeric(V3) #FALSE
 
V4 <- c("a","ab3","Hello",7)
V4 #convert the number to a character
is.character(V4) #TRUE
is.numeric(V4) #FALSE
##a vector with elements in the samt type


##sequence-like":"
seq(1,15) #1:15
seq(1,15,2) #1 to 15 with step of 2

z <- seq(1,15,4) #15 is not included in the vector
z


##replicate
d <- rep(3,15)
rep("a",5) #replicate a character

x <- c(80,20)
y <- rep(x,20)
y



###Lecture 18 using []
w <- c("a","b","c","d","e")
w

w[1]
w[2]
w[-1] #a ll elements except for the first one
v <- w[-3] 
w[1:3]
w[3:5]
w[c(1,3,5)] #1st,3rd and 5th
w[c(-2,-4)]
w[-3:-5]
w[1:2]

##???????????????????????????????????????????????????????????????????????????????????
w[0]
w[7]
w[-7]



###Lecture 19 vectorized operation
##R can +,-,*,/,>,< two vectors directly without a loop

##recycling of vector 
#[50,32,111,7,24] + [100,2,56,12,0,65,93,10,244,1] -> past and copy the shorter vector at the end of the vector

##vector and function
#vector can be input into a function and a function can return a vector



###Lecture 20 power of vectorized operation
x <- rnorm(5)
x
#R-specific programming loop
for(i in x){
  print(i)
}

print(x[1]) #print the first value
print(x[2])

#conventional programming loop
for(j in 1:5){
  print(x[j])
}


##part 2
N <- 100
a <- rnorm(N)
b <- rnorm(N)
#vectorized appraoch
c <- a*b

#devectorized appraoch
d <- rep(NA,N) #creat an empty vector
for(i in 1:N){
  d[i] <- a[i]*b[i]
}

#vectorized appraoch run more quickly than devectorized appraoch does



###Lecture 21 Functions in R
#? get help in R
?rnorm()
rnorm(5) #R default sets mean is 0 and sd is 1
rnorm(5,mean=10,sd=8)

seq(from=10,to=20,by=2)
seq(from=10,to=20,length.out = 100) #length.out-get 100 numbers in the seq

x <- c("a","b","c")
seq(from=10,to=20,along.with=x) #along.with-specify a vector that want the vector generating to have the same length off
####????????????????????????????????????????????????????????????????????????????????

rep(5:6,times=10)
rep(5:6,each=10) #each variable repelicated 10 times
 
A <- seq(from=10,to=20,along.with=x)
A
sqrt(A)



###Lecture 22 Packages in R
#Packages are collections of R functions, data and compile code in a well-defined format. 
#The directory where packages are stored is called the library. 

##install packages 
install.packages("ggplot2")
##activate the package
library(ggplot2)

dimond <- read.csv(file.choose()) 
qplot(data=dimond,carat, price,
       colour=clarity, facets=.~clarity)



###Lecture 23 Recap
##vector: a vector can only include one type
##create vactor: c(), seq(),rep()
##check type: is.numeric()
##using [] to access vector 
##vectorized operation 
##Function in R
##Packages in R

