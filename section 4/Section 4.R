## 42. Section Recap
# matrices
# building matrices: matrix(), rbind(), cbind()
# naming dimensions
# colnames() and rownames()
# matrix operation
# visualizing with Matplot()
# subsetting
# creating your first function 
# deriving insights



## 33. Building Your First Matrix
# matrix
my.data <- 1:20
my.data

A <- matrix(my.data, 4, 5) #has hour rows and five columns
A
A[2,3] #second row and third column

B <- matrix(my.data, 4, 5, byrow=T)
B
B[2,5]

# rbind(): bind row by row
r1 <- c("I", "am", "happy")
r2 <- c("what", "a", "day")
r3 <- c(1,2,3)
C <- rbind(r1, r2, r3)
C

# cbind()
c1 <- 1:5
c2 <- -1:-5
D <- cbind(c1, c2)
D



## 35. Colnames() and Rownames()
# Named Vectors
Charlie <- 1:5
Charlie

# give names 
names(Charlie) <- c("a","b","c","d","e")
Charlie
Charlie["d"]
names(Charlie)

# clear names
names(Charlie) <- NULL
Charlie

# Naming Matrix Dimensions 1
temp.vec <- rep(c("a","B","zZ"), each=3)
temp.vec

Bravo <- matrix(temp.vec, 3, 3)
Bravo

rownames(Bravo) <- c("how", "are", "you")
Bravo

colnames(Bravo) <- c("X", "Y", "Z")
Bravo

Bravo["are", "Y"] <- 0
Bravo

rownames(Bravo) <- NULL
Bravo

