# Define the data
dose <- c(1.6907, 1.7242, 1.7552, 1.7842, 1.8113, 1.8369, 1.8610, 1.8839)
killed <- c(6, 13, 18, 28, 52, 53, 61, 60)
total_insects <- c(59, 60, 62, 56, 63, 59, 62, 60)

# Define the number of iterations and convergence threshold
max_iterations <- 100
convergence_threshold <- 1e-6

# Initialize the coefficients (beta)
beta <- c(0, 0)

# Function to calculate the probability based on the current coefficients
calculate_probability <- function(x, beta) {
  odds <- exp(beta[1] + beta[2] * x)
  probability <- odds / (1 + odds)
  return(probability)
}

# Function to calculate the gradient (first-order derivative)
calculate_gradient <- function(x, y, beta) {
  probability <- calculate_probability(x, beta)
  gradient <- matrix(0, nrow = 2, ncol = 1)
  gradient[1] <- sum(y - probability)
  gradient[2] <- sum((y - probability) * x)
  return(gradient)
}

# Function to calculate the Hessian matrix (second-order derivative)
calculate_hessian <- function(x, beta) {
  probability <- calculate_probability(x, beta)
  hessian <- matrix(0, nrow = 2, ncol = 2)
  hessian[1, 1] <- -sum(probability * (1 - probability))
  hessian[2, 2] <- -sum(probability * (1 - probability) * x^2)
  hessian[1, 2] <- -sum(probability * (1 - probability) * x)
  hessian[2, 1] <- hessian[1, 2]
  return(hessian)
}

beta <- c(2, 0)
# Perform the Newton-Raphson iterations
for (iteration in 1:max_iterations) {
  # Calculate the gradient and Hessian matrix
  gradient <- calculate_gradient(dose, killed / total_insects, beta)
  hessian <- calculate_hessian(dose, beta)
  
  # Check if the Hessian matrix is invertible
  if (is.matrix(solve(hessian))) {
    # Update the coefficients using the Newton-Raphson equation
    beta_old <- beta
    beta <- beta - solve(hessian) %*% gradient
    cat("Iteration:", iteration-1, "β0:", beta_old[1], "β1:", beta_old[2], "\n")
    
    # Calculate the gradients of beta0 and beta1
    gradient_beta0 <- gradient[1]
    gradient_beta1 <- gradient[2]
    cat("Gradient of β0:", gradient_beta0, "Gradient of β1:", gradient_beta1, "\n")
    
    # Check for convergence
    if (max(abs(beta - beta_old)) < convergence_threshold) {
      break
    }
  } else {
    # Handle the case when the Hessian matrix is not invertible
    cat("Hessian matrix is not invertible. Consider using a different optimization method.\n")
    break
  }
}

# Print the estimated coefficients
cat("Estimated Coefficients (beta): β0 =", beta[1],", β1 =", beta[2],"and i=", iteration-1, "\n")

    
    
    
    
    