
# Postoje li razlike u razini zdravlja gušterače 
# među oblicima dijabetesa pacijenata?

# Odg:
# Postoje vrlo značajne razlike u oblicima dijabetesa 
# ovisno o zdravlju gušterače bolesnika p-val < 2e-16

library(here)
library(ggplot2)

dataset <- read.csv(here("data", "diabetes_dataset00.csv"))

anova_test <- aov(Pancreatic.Health ~ Target, data = dataset)

summary(anova_test)


ggplot(dataset, aes(x = Target, y = Pancreatic.Health, fill = Target)) +
  geom_boxplot() +
  labs(title = "Pancreatic Health by Diabetes Type",
       x = "Diabetes Type",
       y = "Pancreatic Health") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(angle = 45, hjust = 1))

# Postoje vrlo značajne razlike u oblicima dijabetesa 
# ovisno o zdravlju gušterače bolesnika p-val < 2e-16