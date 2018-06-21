data <- read.csv("/Users/mosaic/Desktop/文件夹/笔记/R Prigramming A-Z/section 5/Section5-Homework-Data.csv")

data_1960 <- data[data$Year=="1960",]
data_2013 <- data[data$Year=="2013",]

life_expectancy <- data.frame(exp_1960 = Life_Expectancy_At_Birth_1960,
                              exp_2013 = Life_Expectancy_At_Birth_2013,
                              Code = Country_Code)
merge_1960 <- merge(data_1960, life_expectancy, 
                    by.x="Country.Code",by.y="Code")
merge_1960$exp_2013 <- NULL

merge_2013 <- merge(data_2013, life_expectancy, 
                    by.x="Country.Code",by.y="Code")
merge_2013$exp_1960 <- NULL

qplot(data=merge_1960, x=Fertility.Rate, y=exp_1960, 
      color=Region)
qplot(data=merge_2013, x=Fertility.Rate, y=exp_2013, 
      color=Region)
