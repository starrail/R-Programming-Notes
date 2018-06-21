#1.3 Get Excercise 

##import data
dimond <- read.csv(file.choose()) 

##get package
install.packages("ggplot2")
library("ggplot2", lib.loc="/Library/Frameworks/R.framework/Versions/3.4/Resources/library")

##scatter plot
ggplot(data=dimond[dimond$carat<2.5,], #filter insignificant data points
       aes(x=carat, y=price, colour=clarity)) + 
  geom_point(alpha=0.1) + #make the plot more clear 
  geom_smooth() #average of diffrent carats
 
##conclusion 
#the part where lines are across over is miss price
