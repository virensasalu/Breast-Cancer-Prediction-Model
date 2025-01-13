library(reshape2)
library(ggplot2)
library(tidyverse)
library(ggcorrplot)
library(corrplot)
library(grid)

data <- read_csv("data/cancer_dataset_cleaned.csv")

data$diagnosis <- as.numeric(as.factor(data$diagnosis))

numeric_data <- data[sapply(data, is.numeric)]

correlation_matrix <- cor(numeric_data, use = "complete.obs")

cor_values <- correlation_matrix[, "diagnosis"]

cor_values <- cor_values[names(cor_values) != "diagnosis"]

top_5_highest <- sort(cor_values, decreasing = TRUE)[1:5]

top_5_lowest <- sort(cor_values, decreasing = FALSE)[1:5]

selected_variables <- c("diagnosis", names(top_5_highest), names(top_5_lowest))

selected_correlation_matrix <- correlation_matrix[selected_variables, selected_variables]

masked_matrix <- selected_correlation_matrix
masked_matrix[upper.tri(masked_matrix)] <- NA

ggcorrplot(masked_matrix,
           method = "square",
           type = "full",
           lab = TRUE,
           lab_size = 3,
           colors = c("blue", "white", "red"),
           title = "Correlation Heatmap: Diagnosis and Selected Variables",
           legend.title = "Correlation") +
  theme(axis.text.x = element_blank(),
        axis.ticks.x = element_blank())

