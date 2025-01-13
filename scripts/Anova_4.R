
# Postoje li razlike u BMI
# među oblicima dijabetesa pacijenata?

# Odg:
# Postoje vrlo značajne razlike u oblicima dijabetesa 
# ovisno o BMI-u bolesnika p-val < 2e-16

library(here)
library(ggplot2)

dataset <- read.csv(here("data", "diabetes_dataset00.csv"))

anova_test <- aov(BMI ~ Target, data = dataset)

summary(anova_test)


ggplot(dataset, aes(x = Target, y = BMI, fill = Target)) +
  geom_boxplot() +
  labs(title = "BMI by Diabetes Type",
       x = "Diabetes Type",
       y = "BMI") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(angle = 45, hjust = 1))
