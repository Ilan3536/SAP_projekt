
# Postoji li razlike u oblicima bolesti medu pušačima i nepušačima?

# Odg:
# Nema razlike u tipovima dijabetese između pušača i nepušača
# p-val = 0.4306

library(here)
library(ggplot2)
library(ggmosaic)

dataset <- read.csv(here("data", "diabetes_dataset00.csv"))

dataset$Target <- as.numeric(factor(dataset$Target))

contingency_table <- table(dataset$Family.History, dataset$Target)

chi_squared_test <- chisq.test(contingency_table)
print(chi_squared_test)

contingency_df <- as.data.frame(contingency_table)

colnames(contingency_df) <- c("Family.History", "Diabetes.Type", "Count")

ggplot(data = contingency_df) +
  geom_mosaic(aes(weight = Count, x = product(Family.History, Diabetes.Type), fill = Family.History)) +
  labs(title = "Mosaic Plot: Family.History vs Diabetes Type",
       x = "Diabetes Type", 
       y = "Proportion") +
  theme_minimal()


