# Logistic Regression for Insect Mortality Prediction: Parameter Estimation

This repository provides an implementation of logistic regression in R for predicting insect mortality based on dosage data. The code primarily focuses on the estimation of parameters using the Newton-Raphson method for optimization and convergence.


## Data

The dataset used for this analysis includes the following variables:

    dose: Dosage of a substance administered to the insects
    killed: Number of insects killed at each dosage
    total_insects: Total number of insects tested at each dosage


## Implementation Details

### The code emphasizes the following aspects of parameter estimation:

- Defines the data and sets the maximum number of iterations and convergence threshold.

- Initializes the coefficients (beta).

- Defines functions for calculating the probability, gradient, and Hessian matrix.

- Performs the Newton-Raphson iterations to estimate the coefficients.

- Checks for convergence and handles cases where the Hessian matrix is not invertible.


## Usage

To use this code, follow these steps:

- Ensure that R is installed on your system.

- Clone this repository to your local machine.

- Open the R script file (logistic_regression.R) in your preferred R environment.

- Execute the code and observe the output, including the estimated coefficients and convergence information.

Feel free to modify the code or adapt it to your specific needs.


## Dependencies

The code requires the following R packages: None


## References

Logistic Regression - Wikipedia


If you have any questions or suggestions, feel free to contact us.

Enjoy!
