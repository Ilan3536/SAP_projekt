
# Može li se na temelju zadanih parametara procijeniti dob pacijenta?
 
# Odg:
# Može
# R-squared:  0.7347, p-value < 2.2e-16


library(tidyverse)
library(here)
library(ggplot2)
library(corrplot)
library(caret)
library(car)  

dataset <- read.csv(here("data", "diabetes_dataset00.csv"))
summary(dataset)

set.seed(123)

train_index <- createDataPartition(dataset$Age, p = 0.8, list = FALSE)
train_data <- dataset[train_index, ]
test_data <- dataset[-train_index, ]

# Remove the 'Target' column from both training and testing data
train_data_without_target <- train_data[, !colnames(train_data) %in% c("Target")]
test_data_without_target <- test_data[, !colnames(test_data) %in% c("Target")]

# Create dummy variables for categorical features in the training and testing data
train_data_dummy <- data.frame(model.matrix(~ . - 1, data = train_data_without_target))
test_data_dummy <- data.frame(model.matrix(~ . - 1, data = test_data_without_target))
lm_model <- lm(Age ~ ., data = train_data_dummy)

summary(lm_model)
predictions <- predict(lm_model, newdata = test_data_dummy)

comparison <- data.frame(Actual = test_data$Age, Predicted = predictions)

residuals <- lm_model$residuals

qqnorm(residuals, main = "Q-Q Plot of Residuals", pch = 19, col = "blue")  # Normal Q-Q plot
qqline(residuals, col = "red", lwd = 2)  # Add the reference line for normal distribution





