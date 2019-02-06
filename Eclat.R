# Eclat 

#Data Preprocessing
#install.packages('arules')
#install.packages('Matrix')
library("Matrix", lib.loc="C:/Program Files/R/R-3.5.1/library")
library("arules", lib.loc="~/R/win-library/3.5")
dataset = read.csv('Market_Basket_Optimisation.csv', header = FALSE)
dataset = read.transactions('Market_Basket_Optimisation.csv', sep = ',',  rm.duplicates = TRUE)
summary(dataset)
itemFrequencyPlot(dataset, topN = 10)

# trainning Eclat on the dataset
rules = eclat(data = dataset, parameter = list(support =0.004, minlen = 2))

#visualizing the results
inspect(sort(rules, by = 'support')[1:10])
