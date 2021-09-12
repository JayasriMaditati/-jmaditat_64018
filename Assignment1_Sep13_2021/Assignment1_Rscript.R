install.packages("dplyr")
install.packages("Hmisc")
library(dplyr)
library(Hmisc)

#Dataset from Kaggle
Cereal_data<- read.csv("Cereals.csv")
View(Cereal_data)
head(Cereal_data)

#Statistics of the data
describe(Cereal_data)
summary(Cereal_data)

#List of manufacturers with their total calories
data_by_mfr <- Cereal_data %>% group_by(mfr)
Calories_Count_by_mfr<-summarise(data_by_mfr,TotalCalories_of_each_mfr=sum(calories))
Calories_Count_by_mfr

#Plots for calorie distribution of Hot and cold type of cereals

hist(Cereal_data$calories [Cereal_data$type == "C"],
     xlim = c(50,160) ,#Limiting the scale on x
     breaks = 10,
     main="Calorie Distribution of Cold Type of Cereals",
     xlab= "Calories",
     ylab="No. of 'C' type Cereals",
     col="red")

hist(Cereal_data$calories [Cereal_data$type == "H"],
     xlim = c(50,160) ,#Limiting the scale on x
     breaks = 10,
     main="Calorie Distribution of Hot type of Cereals",
     xlab="Calories",
     ylab="No. of 'H' type Cereals",
     #add= TRUE,
     col="Green")






