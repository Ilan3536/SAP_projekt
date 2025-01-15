
# Ovise li tipovi dijabetesa o genetskim markerima?

# Odg:
# Tipovi dijabetesa ovise o genetice
# p-val = 0.005308

library(here)
library(ggplot2)
library(ggmosaic)

dataset <- read.csv(here("data", "diabetes_dataset00.csv"))
dataset$Target <- as.numeric(factor(dataset$Target))

contingency_table <- table(dataset$Genetic.Markers, dataset$Target)

chi_squared_test <- chisq.test(contingency_table)

print(chi_squared_test)

contingency_df <- as.data.frame(contingency_table)

colnames(contingency_df) <- c("Genetic.Markers", "Diabetes.Type", "Count")

ggplot(data = contingency_df) +
  geom_mosaic(aes(weight = Count, x = product(Genetic.Markers, Diabetes.Type), fill = Genetic.Markers)) +
  labs(title = "Mosaic Plot: Genetic.Markers vs Diabetes Type",
       x = "Diabetes Type", 
       y = "Proportion") +
  theme_minimal()


