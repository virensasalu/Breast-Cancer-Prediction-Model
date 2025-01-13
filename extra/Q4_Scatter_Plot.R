library(e1071)
library(caret)
library(kernlab)


read.csv("data/cancer_dataset_cleaned.csv")


#load the dataset

training_set <- read.csv("data/train_set.csv")
validation_set <- read.csv("data/valid_set.csv")
test_set <- read.csv("data/test_set.csv")



training_set$diagnosis <- as.factor(training_set$diagnosis)
validation_set$diagnosis <- as.factor(validation_set$diagnosis)
test_set$diagnosis <- as.factor(test_set$diagnosis)



#Train with SVM model
svm_model <- svm(diagnosis ~ ., 
                 data = training_set, 
                 kernel = "radial", 
                 cost = 1, 
                 gamma = 0.01)



validation_predictions <- predict(svm_model, validation_set)
validation_conf_matrix <- confusionMatrix(validation_predictions, validation_set$diagnosis)
print(validation_conf_matrix)



test_predictions <- predict(svm_model, test_set)
test_conf_matrix <- confusionMatrix(test_predictions, test_set$diagnosis)
typeof(test_conf_matrix)  
test_conf_matrix$overall["Accuracy"]
print(test_conf_matrix)



training_set$predicted_class_svm <- as.factor(predict(svm_model, training_set))
validation_set$predicted_class_svm <-as.factor(predict(svm_model, validation_set))
test_set$predicted_class_svm <- as.factor(predict(svm_model, test_set))


#accuracy
accuracy_train_svm <- mean(training_set$diagnosis == training_set$predicted_class_svm)
print(accuracy_train_svm)

accuracy_valid_svm <- mean(validation_set$diagnosis == validation_set$predicted_class_svm)
print(accuracy_valid_svm)

accuracy_test_svm <- mean(test_set$diagnosis == test_set$predicted_class_svm)
print(accuracy_test_svm)


### NAIVE BAYES



nb_model <- naiveBayes(diagnosis ~ ., data = training_set)



predictions <- predict(nb_model, validation_set)
valid_confusion <- confusionMatrix(predictions,validation_set$diagnosis)
print(valid_confusion)


test_predictions <- predict(nb_model, test_set)
test_confusion <- confusionMatrix(test_predictions, test_set$diagnosis)
print(test_confusion)



training_set$predicted_class_nb <- as.factor(predict(nb_model, training_set))
validation_set$predicted_class_nb <-as.factor( predict(nb_model, validation_set))
test_set$predicted_class_nb <- as.factor(predict(nb_model, test_set))


#accuracy
accuracy_train_nb <- mean(training_set$diagnosis == training_set$predicted_class_nb)
print(accuracy_train_nb)

accuracy_valid_nb <- mean(validation_set$diagnosis == validation_set$predicted_class_nb)
print(accuracy_valid_nb)

accuracy_test_nb <- mean(test_set$diagnosis == test_set$predicted_class_nb)
print(accuracy_test_nb)




###Logistic regression


logistic_model <- glm(diagnosis ~ ., data = training_set, family = binomial)



# Predictions and confusion matrix for validation set
validation_set$predicted_prob <-predict(logistic_model, newdata = validation_set, type = "response")
validation_set$predicted_class_lr <- factor(ifelse(validation_set$predicted_prob >= 0.5, 1, 0))
valid_confusion <- confusionMatrix(validation_set$predicted_class_lr, validation_set$diagnosis)
print(valid_confusion)



# Predictions and confusion matrix for test set
test_set$predicted_prob <- predict(logistic_model, newdata = test_set, type = "response")
test_set$predicted_class_lr <- factor(ifelse(test_set$predicted_prob >= 0.5, 1, 0))
test_confusion <- confusionMatrix(test_set$predicted_class_lr, test_set$diagnosis)
print(test_confusion)



training_set$predicted_prob <- predict(logistic_model, newdata = training_set, type = "response")
training_set$predicted_class_lr <- factor(ifelse(training_set$predicted_prob >= 0.5, 1, 0))

validation_set$predicted_prob <- predict(logistic_model, newdata = validation_set, type = "response")
validation_set$predicted_class_lr <- factor(ifelse(validation_set$predicted_prob >= 0.5, 1, 0))

test_set$predicted_prob <- predict(logistic_model, newdata = test_set, type = "response")
test_set$predicted_class_lr <- factor(ifelse(test_set$predicted_prob >= 0.5, 1, 0))



#accuracy
accuracy_train_logistic <- mean(training_set$diagnosis == training_set$predicted_class_lr)
print(accuracy_train_logistic)

accuracy_valid_logistic <- mean(validation_set$diagnosis == validation_set$predicted_class_lr)
print(accuracy_valid_logistic)

accuracy_test_logistic <- mean(test_set$diagnosis == test_set$predicted_class_lr)
print(accuracy_test_logistic)

###PLOTTING


# Create dataframes for each dataset accuracy
accuracy_train_data <- data.frame(
  Metric = c("SVM", "Naive Bayes", "Logistic Regression"),
  Value = c(accuracy_train_svm, accuracy_train_nb, accuracy_train_logistic),
  Dataset = "Train"
)

accuracy_valid_data <- data.frame(
  Metric = c("SVM", "Naive Bayes", "Logistic Regression"),
  Value = c(accuracy_valid_svm, accuracy_valid_nb, accuracy_valid_logistic),
  Dataset = "Validation"
)

accuracy_test_data <- data.frame(
  Metric = c("SVM", "Naive Bayes", "Logistic Regression"),
  Value = c(accuracy_test_svm, accuracy_test_nb, accuracy_test_logistic),
  Dataset = "Test"
)



# Combine the data for all datasets
combined_data <- rbind(
  accuracy_train_data,
  accuracy_valid_data,
  accuracy_test_data
)

# Ensure the Dataset factor is ordered correctly
combined_data$Dataset <- factor(combined_data$Dataset, levels = c("Train", "Validation", "Test"))

# Print combined data to verify
print(combined_data)





# Create the bar chart
ggplot(combined_data, aes(x = Metric, y = Value, fill = Dataset)) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label = round(Value, 2)), 
            position = position_dodge(width = 0.9), 
            vjust = -0.5, 
            size = 4) +
  labs(title = "Model Accuracy Across Training, Validation, and Test Sets",
       x = "Model",
       y = "Accuracy") +
  theme_minimal() +
  scale_fill_manual(values = c("Train" = "#7C9885", 
                               "Validation" = "#D4A5A5", 
                               "Test" = "#A5C4D4"))


# Question number 4
# Create the scatter plot SVM
ggplot(data=test_set, aes(concave.points_worst,perimeter_worst, color = predicted_class_svm))+
  geom_point(size=3, alpha=0.85)+
  theme_minimal() +
  scale_color_manual(values = c("0" = "#F2545B", "1" = "#19323C"))+
  labs(
    title="Scatter Plot of concave.points_worst vs perimeter_worst by SVM",
    x="Concave Points Worst",
    y= "Perimeter Worst",
    color="SVM Class"
  )
# Save the plot
#ggsave("scatter_svm.png", width=10, height = 8, dpi=600)

# Create the scatter plot for LR
ggplot(data=test_set, aes(concave.points_worst,perimeter_worst, color = predicted_class_lr))+
  geom_point(size=5, alpha=0.85)+
  theme_minimal() +
  scale_color_manual(values = c("0" = "#F2545B", "1" = "#19323C"))+
  labs(
    title="Scatter Plot of concave.points_worst vs perimeter_worst by Logistic Regression",
    x="Concave Points Worst",
    y= "Perimeter Worst",
    color="LR Class"
  )+
  theme(
    plot.title = element_text(size = 28), 
    axis.title = element_text(size = 22), 
    legend.title = element_text(size = 18),
    legend.text = element_text(size = 16)
  )

# Save the plot
#ggsave("scatter_lr.png", width=10, height = 8, dpi=600)

# Create the scatter plot for NB
ggplot(data=test_set, aes(concave.points_worst,perimeter_worst, color = predicted_class_svm))+
  geom_point(size=5, alpha=0.9)+
  theme_minimal() +
  scale_color_manual(values = c("0" = "#F2545B", "1" = "#19323C"))+
  labs(
    title="Scatter Plot of concave.points_worst vs perimeter_worst by Naive Bayes",
    x="Concave Points Worst",
    y= "Perimeter Worst",
    color="NB Class"
    )+
  theme(
    plot.title = element_text(size = 28), 
    axis.title = element_text(size = 22), 
    legend.title = element_text(size = 18),
    legend.text = element_text(size = 16)
  )

# Save the plot
#ggsave("scatter_nb.png", width=10, height = 8, dpi=600)