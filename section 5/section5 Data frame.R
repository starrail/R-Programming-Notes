#Section 5 Data Frames
#51 recap 
#1 import data 
#2 explore dataset: head(),tail(),summary(),str()
#3 "$"
#4 operation with data frame
#5 filter a data frame 
#6 Qplot 
#7 build data frame: data.frame()
#8 merge data fram: merge()



#41 import data 
#1. select the file manually 
data <- read.csv(file.choose(), stringsAsFactors = T)

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
  #add stringAsFactors=T to read.csv



#44 Basic operation with data frame
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
#Execute below code to generate three new vectors
Countries_2012_Dataset <- c("Aruba","Afghanistan","Angola","Albania","United Arab Emirates","Argentina","Armenia","Antigua and Barbuda","Australia","Austria","Azerbaijan","Burundi","Belgium","Benin","Burkina Faso","Bangladesh","Bulgaria","Bahrain","Bahamas, The","Bosnia and Herzegovina","Belarus","Belize","Bermuda","Bolivia","Brazil","Barbados","Brunei Darussalam","Bhutan","Botswana","Central African Republic","Canada","Switzerland","Chile","China","Cote d'Ivoire","Cameroon","Congo, Rep.","Colombia","Comoros","Cabo Verde","Costa Rica","Cuba","Cayman Islands","Cyprus","Czech Republic","Germany","Djibouti","Denmark","Dominican Republic","Algeria","Ecuador","Egypt, Arab Rep.","Eritrea","Spain","Estonia","Ethiopia","Finland","Fiji","France","Micronesia, Fed. Sts.","Gabon","United Kingdom","Georgia","Ghana","Guinea","Gambia, The","Guinea-Bissau","Equatorial Guinea","Greece","Grenada","Greenland","Guatemala","Guam","Guyana","Hong Kong SAR, China","Honduras","Croatia","Haiti","Hungary","Indonesia","India","Ireland","Iran, Islamic Rep.","Iraq","Iceland","Israel","Italy","Jamaica","Jordan","Japan","Kazakhstan","Kenya","Kyrgyz Republic","Cambodia","Kiribati","Korea, Rep.","Kuwait","Lao PDR","Lebanon","Liberia","Libya","St. Lucia","Liechtenstein","Sri Lanka","Lesotho","Lithuania","Luxembourg","Latvia","Macao SAR, China","Morocco","Moldova","Madagascar","Maldives","Mexico","Macedonia, FYR","Mali","Malta","Myanmar","Montenegro","Mongolia","Mozambique","Mauritania","Mauritius","Malawi","Malaysia","Namibia","New Caledonia","Niger","Nigeria","Nicaragua","Netherlands","Norway","Nepal","New Zealand","Oman","Pakistan","Panama","Peru","Philippines","Papua New Guinea","Poland","Puerto Rico","Portugal","Paraguay","French Polynesia","Qatar","Romania","Russian Federation","Rwanda","Saudi Arabia","Sudan","Senegal","Singapore","Solomon Islands","Sierra Leone","El Salvador","Somalia","Serbia","South Sudan","Sao Tome and Principe","Suriname","Slovak Republic","Slovenia","Sweden","Swaziland","Seychelles","Syrian Arab Republic","Chad","Togo","Thailand","Tajikistan","Turkmenistan","Timor-Leste","Tonga","Trinidad and Tobago","Tunisia","Turkey","Tanzania","Uganda","Ukraine","Uruguay","United States","Uzbekistan","St. Vincent and the Grenadines","Venezuela, RB","Virgin Islands (U.S.)","Vietnam","Vanuatu","West Bank and Gaza","Samoa","Yemen, Rep.","South Africa","Congo, Dem. Rep.","Zambia","Zimbabwe")
Codes_2012_Dataset <- c("ABW","AFG","AGO","ALB","ARE","ARG","ARM","ATG","AUS","AUT","AZE","BDI","BEL","BEN","BFA","BGD","BGR","BHR","BHS","BIH","BLR","BLZ","BMU","BOL","BRA","BRB","BRN","BTN","BWA","CAF","CAN","CHE","CHL","CHN","CIV","CMR","COG","COL","COM","CPV","CRI","CUB","CYM","CYP","CZE","DEU","DJI","DNK","DOM","DZA","ECU","EGY","ERI","ESP","EST","ETH","FIN","FJI","FRA","FSM","GAB","GBR","GEO","GHA","GIN","GMB","GNB","GNQ","GRC","GRD","GRL","GTM","GUM","GUY","HKG","HND","HRV","HTI","HUN","IDN","IND","IRL","IRN","IRQ","ISL","ISR","ITA","JAM","JOR","JPN","KAZ","KEN","KGZ","KHM","KIR","KOR","KWT","LAO","LBN","LBR","LBY","LCA","LIE","LKA","LSO","LTU","LUX","LVA","MAC","MAR","MDA","MDG","MDV","MEX","MKD","MLI","MLT","MMR","MNE","MNG","MOZ","MRT","MUS","MWI","MYS","NAM","NCL","NER","NGA","NIC","NLD","NOR","NPL","NZL","OMN","PAK","PAN","PER","PHL","PNG","POL","PRI","PRT","PRY","PYF","QAT","ROU","RUS","RWA","SAU","SDN","SEN","SGP","SLB","SLE","SLV","SOM","SRB","SSD","STP","SUR","SVK","SVN","SWE","SWZ","SYC","SYR","TCD","TGO","THA","TJK","TKM","TLS","TON","TTO","TUN","TUR","TZA","UGA","UKR","URY","USA","UZB","VCT","VEN","VIR","VNM","VUT","PSE","WSM","YEM","ZAF","COD","ZMB","ZWE")
Regions_2012_Dataset <- c("The Americas","Asia","Africa","Europe","Middle East","The Americas","Asia","The Americas","Oceania","Europe","Asia","Africa","Europe","Africa","Africa","Asia","Europe","Middle East","The Americas","Europe","Europe","The Americas","The Americas","The Americas","The Americas","The Americas","Asia","Asia","Africa","Africa","The Americas","Europe","The Americas","Asia","Africa","Africa","Africa","The Americas","Africa","Africa","The Americas","The Americas","The Americas","Europe","Europe","Europe","Africa","Europe","The Americas","Africa","The Americas","Africa","Africa","Europe","Europe","Africa","Europe","Oceania","Europe","Oceania","Africa","Europe","Asia","Africa","Africa","Africa","Africa","Africa","Europe","The Americas","The Americas","The Americas","Oceania","The Americas","Asia","The Americas","Europe","The Americas","Europe","Asia","Asia","Europe","Middle East","Middle East","Europe","Middle East","Europe","The Americas","Middle East","Asia","Asia","Africa","Asia","Asia","Oceania","Asia","Middle East","Asia","Middle East","Africa","Africa","The Americas","Europe","Asia","Africa","Europe","Europe","Europe","Asia","Africa","Europe","Africa","Asia","The Americas","Europe","Africa","Europe","Asia","Europe","Asia","Africa","Africa","Africa","Africa","Asia","Africa","Oceania","Africa","Africa","The Americas","Europe","Europe","Asia","Oceania","Middle East","Asia","The Americas","The Americas","Asia","Oceania","Europe","The Americas","Europe","The Americas","Oceania","Middle East","Europe","Europe","Africa","Middle East","Africa","Africa","Asia","Oceania","Africa","The Americas","Africa","Europe","Africa","Africa","The Americas","Europe","Europe","Europe","Africa","Africa","Middle East","Africa","Africa","Asia","Asia","Asia","Asia","Oceania","The Americas","Africa","Europe","Africa","Africa","Europe","The Americas","The Americas","Asia","The Americas","The Americas","The Americas","Asia","Oceania","Middle East","Oceania","Middle East","Africa","Africa","Africa","Africa")

mydf <- data.frame(Countries_2012_Dataset,Codes_2012_Dataset,Regions_2012_Dataset)
#change names of cols
colnames(mydf) <- c("Codes","Countries","Region") #first way 
rm(mydf)
mydf <- data.frame(Country=Countries_2012_Dataset,Code=Codes_2012_Dataset,
                   Region=Regions_2012_Dataset) #second way 



#49 merging data frame
#combine data and mydf
merged <- merge(data, mydf, by.x="Country.Code",by.y="Code")
  #x is the one on the left (data) and y is the one on the right (mydf) 
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
