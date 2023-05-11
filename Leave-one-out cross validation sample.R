# Generate example data
set.seed(123) # For reproducibility
X <- runif(30) # Example predictor variable X
X
Y <- rnorm(30) # Example response variable Y
Y
# Set index of observation to be excluded
test_index <- 15
test_index

# Perform LOOCV using a loop
results <- numeric(length(X)) # Create empty vector to store results
results
for (i in 1:length(X)) {
  if (i == test_index) {
    # Use observation at test_index as test set
    test_X <- X[i]
    test_Y <- Y[i]
    
    # Fit model on remaining observations as training set (example: linear regression)
    train_X <- X[-i]
    train_Y <- Y[-i]
    model <- lm(train_Y ~ train_X)
    
    # Make prediction on test set
    predicted_Y <- predict(model, newdata = data.frame(train_X = test_X))
    
    # Calculate prediction error (example: mean squared error)
    error <- (predicted_Y - test_Y)^2
    
    # Store prediction error in results vector
    results[i] <- error
  } else {
    # For all other observations, include them in training set
    # since they are not the observation at test_index
    train_X <- X[-test_index]
    train_Y <- Y[-test_index]
    
    # Fit model on training set (example: linear regression)
    model <- lm(train_Y ~ train_X)
    
    # No prediction or error calculation needed for these observations
    results[i] <- NA
  }
}

results
















