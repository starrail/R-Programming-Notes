## 72. Section Recap
# Grammar of Graphics & GGPlot2
# Factors in R
# Aesthetics & ggplot()
# Plotting with layers
# Overriding Aesthetics
# Mapping & Setting
# Histograms and Density Charts
# Starting Layer Tips
# Statistical Transformation
# Using Facets
# Coordinates
# Themes

# Data -> Aesthetics -> Geometrices -> Statistics -> Facets -> Coordinates -> Theme

## 61. What is a Factor?
movies <- read.csv("/Users/mosaic/Desktop/文件夹/笔记/网课笔记/R Prigramming A-Z/section 6/Movie-Ratings.csv")
head(movies)
colnames(movies) <- c("Film", "Genre", "CriticRating", "AudienceRating",
                      "BudgetMillions", "Year")
head(movies)
str(movies)
summary(movies)

# change Year to factor
factor(movies$Year)
movies$Year <- factor(movies$Year)
summary(movies)
str(movies)



## 62. Aesthetics
library(ggplot2)

ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))

#add geometry
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating)) +
  geom_point()

# add colous
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre)) +
  geom_point()

# add size
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
                        colour=Genre, size=BudgetMillions)) +
  geom_point()



## 63. Plotting with Layers
p <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre))

# point
p + geom_point()

# lines
p + geom_line()

#nultiple layers
p + geom_point() + geom_line() 
p + geom_line() + geom_point()



## 64. Overriding Aesthetics
q <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
                             colour=Genre, size=BudgetMillions)) 

# add geom layer
q + geom_point()

# overriding aes
# ex1
q + geom_point(aes(size=CriticRating))

# ex2
q + geom_point(aes(colour=BudgetMillions))

# ex3
q + geom_point(aes(colour=BudgetMillions)) + 
  xlab("Budget Millions $$$")

#ex 4
q + geom_line() + geom_point() 
#reduce line size
q + geom_line(size=1) + geom_point() 



## 65. Mapping vs. Setting
r <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))
r + geom_point()

# add colour
#1. Mapping (what we've done so far):
r + geom_point(aes(colour=Genre))
#2. Setting:
r + geom_point(colour="DarkGreen")
#Error:
#r + geom_point(aes(colour=Genre))

# 1. Mapping
r + geom_point(aes(size=BudgetMillions))
# 2. Setting
r + geom_point(size=10)
#Error:
#r + geom_point(aes(size=10))



## 66. Histogram and Density Charts
s <- ggplot(data=movies, aes(x=BudgetMillions))
s + geom_histogram(binwidth = 10)

# add colour
s + geom_histogram(binwidth=10, aes(fill=Genre))
# add a border
s + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black")

# density chart
s + geom_density(aes(fill=Genre))
s + geom_density(aes(fill=Genre), position="stack")



## 67. Starting Layer Tips
t <- ggplot(data=movies, aes(x=AudienceRating))
t + geom_histogram(binwidth=10, 
                   fill="White", colour="Blue")

# another way
t <- ggplot(data=movies)
t + geom_histogram(binwidth=10, 
                   aes(x=AudienceRating),
                   fill="White", colour="Blue")



## 68. Statistical Transformations
# geom_smooth()
u <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             colour=Genre))
u + geom_point() + geom_smooth(fill=NA)

# boxplots
u <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             colour=Genre))
u + geom_boxplot()
u + geom_boxplot(size=1.2)
u + geom_boxplot(size=1.2) + geom_point()
#tip/hack
u + geom_boxplot(size=1.2) + geom_jitter()
  #geom_jitter():It adds a small amount of random variation to the location of each point
  #is a useful way of handling overplotting caused by discreteness in smaller datasets
#another way
u + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5) 



## 69. Facets
v <- ggplot(data=movies, aes(x=BudgetMillions))
v + geom_histogram(binwidth=10, aes(fill=Genre),
                   colour="Black")

# facets
v + geom_histogram(binwidth=10, aes(fill=Genre),
                   colour="Black") +
  facet_grid(Genre~., scales="free")

# scatterplots
w <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
                             colour=Genre))
w + geom_point(size=3)

# facets
w + geom_point(size=3) +
  facet_grid(Genre~.)

w + geom_point(size=3) +
  facet_grid(.~Year)

w + geom_point(size=3) +
  facet_grid(Genre~Year)

w + geom_point(size=3) +
  geom_smooth() +
  facet_grid(Genre~Year)

w + geom_point(aes(size=BudgetMillions)) +
  geom_smooth() +
  facet_grid(Genre~Year)



## 70. coordiantes: limit & zoom
m <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             size=BudgetMillions,
                             colour=Genre))
m + geom_point()

m + geom_point() +
  xlim(50,100) +
  ylim(50,100)

# won't always work well
n <- ggplot(data=movies, aes(x=BudgetMillions))
n + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black")

n + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black") + 
  ylim(0,50)

#zoom
w + geom_point(aes(size=BudgetMillions)) + 
  geom_smooth() +
  facet_grid(Genre~Year) +
  coord_cartesian(ylim=c(0,100))
  


# Adding Themes
o <- ggplot(data=movies, aes(x=BudgetMillions))
h <- o + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black")

h

#axes labeles
h +
  xlab("Money Axis") + 
  ylab("Number of Movies")

#label, legend and title
h +
  xlab("Money Axis") + 
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(colour="DarkGreen", size=30),
        axis.title.y = element_text(colour="Red", size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20),
        
        legend.title = element_text(size=30),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        
        plot.title = element_text(colour="DarkBlue",
                                  size=40,
                                  family = "Courier"))

