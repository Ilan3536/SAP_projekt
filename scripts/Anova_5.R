
# Postoje li razlike u razini šećera u krvi
# među oblicima dijabetesa pacijenata?

# Odg:
# Postoje vrlo značajne razlike u oblicima dijabetesa 
# ovisno o razini šećera u krvi bolesnika p-val < 2e-16

library(here)
library(ggplot2)

dataset <- read.csv(here("data", "diabetes_dataset00.csv"))

anova_test <- aov(Blood.Glucose.Levels ~ Target, data = dataset)

summary(anova_test)


ggplot(dataset, aes(x = Target, y = Blood.Glucose.Levels, fill = Target)) +
  geom_boxplot() +
  labs(title = "Blood.Glucose.Levels by Diabetes Type",
       x = "Target",
       y = "Blood.Glucose.Levels") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylim(50, 250)
