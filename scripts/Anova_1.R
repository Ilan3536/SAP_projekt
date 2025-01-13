
# Utječe li razina fizičke aktivnosti na razinu inzulina u krvi pacijenta?

# Odg:
# Ne postoje značajne razliku u razinama inzulina ovisno o fizičkoj aktivnosti
# p-val = 0.226

library(ggplot2)
library(here)

dataset <- read.csv(here("data", "diabetes_dataset00.csv"))

dataset$Physical.Activity <- as.factor(dataset$Physical.Activity)

ggplot(dataset, aes(x = Insulin.Levels, color = Physical.Activity)) +
  geom_density(size = 1) +
  labs(
    title = "Density of Insulin Levels by Physical Activity Type",
    x = "Insulin Levels",
    y = "Density"
  ) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_color_brewer(palette = "Set2")


anova_test <- aov(Insulin.Levels ~ Physical.Activity, data = dataset)
summary(anova_test)

