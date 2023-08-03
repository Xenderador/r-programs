# Installing necessary packages
install.packages('rpart')

# Load necessary libraries
library(rpart)

# Loading the built-in dataset
data(iris)

# Setting seed for reproducibility
set.seed(123)

# Splitting the data into training and testing sets
train_indices <- sample(1:nrow(iris), 0.7 * nrow(iris)) # 70% for training
train_data <- iris[train_indices, ]
test_data <- iris[-train_indices, ]

# Creating Decision Tree model with the help of training data
# Predicting the 'Species' column based on other features
tree_model <- rpart(Species ~ ., data = train_data)

# Making Predictions using decision tree model
predicted_species <- predict(tree_model, newdata = test_data, type = "class")

# Comparing predicted species with the actual species for accuracy
acc <- sum(predicted_species == test_data $ Species) / nrow(test_data)
cat("Accuracy :", acc)