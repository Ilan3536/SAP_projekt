
# Postoji li razlike u oblicima bolesti medu pušačima i nepušačima?

# Odg:
# Nema razlike u tipovima dijabetese između pušača i nepušača
# p-val = 0.4306

library(here)
library(ggplot2)
library(ggmosaic)

dataset <- read.csv(here("data", "diabetes_dataset00.csv"))

dataset$Target <- as.numeric(factor(dataset$Target))

contingency_table <- table(dataset$Smoking.Status, dataset$Target)

chi_squared_test <- chisq.test(contingency_table)

print(chi_squared_test)

contingency_df <- as.data.frame(contingency_table)

colnames(contingency_df) <- c("Smoking.Status", "Diabetes.Type", "Count")

ggplot(data = contingency_df) +
  geom_mosaic(aes(weight = Count, x = product(Smoking.Status, Diabetes.Type), fill = Smoking.Status)) +
  labs(title = "Mosaic Plot: Smoking Status vs Diabetes Type",
       x = "Diabetes Type", 
       y = "Proportion") +
  theme_minimal()


