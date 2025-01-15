library(here)
library(ggplot2)

dataset <- read.csv(here("data", "diabetes_dataset00.csv"))

spearman_test <- cor.test(dataset$Blood.Glucose.Levels, dataset$BMI, method = "spearman")
print(spearman_test)
