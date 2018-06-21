#Section 5 Data Frames

#41 import data 
#1. select the file manually 
data <- read.csv(file.choose())

#2 set the working directory 
getwd() #current WD
setwd() #different for Windows and Mac
data <- read.csv("Demographic Data") #enter file name 



#42 Explornig dataset
nrow(data) #number of row 
ncol(data) #number of col
head(data) #top 6 rows
  head(data,n=10) #top 10 rows
tail(data) #bottom 6 rows
  tail(data,n=8)
str(data) #structure
summary(data)



#43 Using the $ sign 
#Angolas's birth rate 
data[3,3]
data[3,"Birth.rate"]
data["Angola",3] #cannot do so because Angola is not a row; rows do not have name

data$Internet.users #data$col name
  #whole col of internet users
data[,"Internet.users"] #the same thing as data$Internet.users

levels(data$Income.Group) #show factors 



#44 Bacis operation with data frame
#subsetting 
data[1:10,] #first 10 rows
data[c(4,100),] #the 4th and 100th row

is.data.frame(data[1,])
  #extract one row from data frame and it stays as a data frame
  #no need for drop=F
is.data.frame(data[,1])
  #extract a col needs drop=F
data[,1, drop=F]
 
#mathematicl operation 
data$Birth.rate * data$Internet.users
data$Birth.rate + data$Internet.users

#add col
data$mycal <- data$Birth.rate * data$Internet.users
#test knowledge 
data$xyz <- 1:5 #1:5 recycled
data$xyz <- 1:4 #195 is not a multiple of 4, so get an error 

#remove a col
data$mycal <- NULL
data$xyz <- NULL



#45 filtering a data frame
filter <- data$Internet.users < 2
data[filter,] #display TRUE 
data[data$Birth.rate>40 & data$Internet.users < 2,]
data[data$Income.Group == "High income",]

#Ex. Find Malta
data[data$Country.Name == "Malta",]



#46 Qplot 
library(ggplot2)
qplot(data=data, x=Internet.users)
qplot(data=data, x=Income.Group, y=Birth.rate, size=I(3), color=I("blue"))
  #x, y do not need to be data$
  #when changes size and color, need to type "I"
qplot(data=data, x=Income.Group, y=Birth.rate, geom="boxplot")
  #get boxplot



#47 visualize Qplot(1)
qplot(data=data, x=Internet.users, y=Birth.rate,
       size=I(4), color=I("red"))
qplot(data=data, x=Internet.users, y=Birth.rate,
      size=I(4), color=Income.Group)
  #different income groups with different colors



#48 building data frames
mydf <- data.frame(Countries_2012_Dataset,Codes_2012_Dataset,Regions_2012_Dataset)
#change names of cols
colnames(mydf) <- c("Codes","Countries","Region") #first way 
rm(mydf)
mydf <- data.frame(Country=Countries_2012_Dataset,Code=Codes_2012_Dataset,
                   Region=Regions_2012_Dataset) #second way 



#49 merging data frame
#comebine data and mydf
merged <- merge(data, mydf, by.x="Country.Code",by.y="Code")
  #x is the one on the left and y is the one on the right 
merged$Country <- NULL



#50 visualizing with Qplot(2)
qplot(data=merged, x=Internet.users, y=Birth.rate)
qplot(data=merged, x=Internet.users, y=Birth.rate, color=Region)
#change shapes
qplot(data=merged, x=Internet.users, y=Birth.rate, color=Region, size=I(5),
      shape=I(17))
qplot(data=merged, x=Internet.users, y=Birth.rate, color=Region, size=I(5),
      shape=I(2))
qplot(data=merged, x=Internet.users, y=Birth.rate, color=Region, size=I(5),
      shape=I(23))

#transparent: alpha=0:1
qplot(data=merged, x=Internet.users, y=Birth.rate, color=Region, size=I(5),
      shape=I(19),alpha=I(0.1))
qplot(data=merged, x=Internet.users, y=Birth.rate, color=Region, size=I(5),
      shape=I(19),alpha=I(0.6))

#add title
qplot(data=merged, x=Internet.users, y=Birth.rate, color=Region, size=I(5),
      shape=I(19), alpha=I(0.6), main="birth rate vs. internet users")



#51 recap 
#1 import data 
#2 explore dataset: head(),tail(),summary(),str()
#3 "$"
#4 operation with data frame
#5 filter a data frame 
#6 Qplot 
#7 build data frame: data.frame()
#8 merge data fram: merge()

