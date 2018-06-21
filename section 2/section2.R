####2.6 Types of Variables
##integer
x <- 2L #<-assignment operator;
        #L: integer;default conducts a double varible
typeof(x) #check type of x

x1 <- 2
typeof(x1) #double

##double:decimal point
y <- 2.5

##complex
z <- 3+2i

##character
a <- "h"

##logical: True/False
q1 <- T
q2 <- FALSE #FALSE has to be in capital



###2.7 Using Variables
A <- 10
B <- 5

C = A+B 
C #print the outcome

var1 <- 2.5
var2 <- 4

result = var1/var2
result

ans <- sqrt(var2)
ans

greeting <- "Hello"
name <- "Bob"
message <- paste(greeting,name) #paste: add two strings together
message



###2.8 Logical Variables and Opertors
##logical: TRUE/T; FALSE/F
4 < 5
10 > 100
4 == 5


##logical operators: 
#==
#!=  
#<
#> 
#<= 
#>=
#!
#|(or) 
#& 
#isTRUE(x)

result <- 4<5
result 
typeof(result)

#!
result2 <-  !TRUE
result2

result3 <- !(4<5)
result3

#|;&
result | result2 #at lease one of results should be true
result & result2

#isTRUE
isTRUE(result)



###2.9 While Loop
while(abc){ #logical expression
  #body of loop
  xyz
}
#if logical expressino is true, R will excute what is inside the body of loop
#until the logical expression is false, the loop will end

while(TRUE){
  print("Hello") #need to use print in the loop
}
#end the infinite loop by pressing esc

##counter loop
counter <- 1
while(counter<12){
  print(counter)
  counter <- counter + 1
}



###2.10 For Loop
counter <- 1
while(counter<12){
  print(counter)
  counter <- counter + 1
}

for(i in 1:5){ #specify the iteration of the loop
               #1:5 -> a vector
  print("Hello")
}

for(i in 5:10){ #specify the iteration of the loop
  #1:5 -> a vector
  print("Hello")
}

###2.11 If statement
rm(answer) #remove
           #without remove, the previous answer will always be there after appearing at once
x <- rnorm(1) #generate a set of numbers which are randomly distributed accoding to random distribution
        #1:generate 1 number which is near zero;R default 
if(x>1){ #logical expression
  answer <- "Greater than 1"
} else{ #does not () as it does not need logical expression and it includes all other cases except for if statement 
  answer <- "Less or equal to 1"
}


##nested for loop
rm(answer)
x <- rnorm(1)
if(x>1){ #logical expression
  answer <- "Greater than 1"
} else{
    if(x >= -1){
      answer <- "Between -1 and 1"
    } else{
      answer <- "Less than -1"
    }
}


##improve nested loop by using else if
rm(answer)
x <- rnorm(1)
if(x>1){ #logical expression
  answer <- "Greater than 1"
} else if(x >= -1){
  answer <- "Between -1 and 1"
} else{
  answer <- "Less than -1"
}