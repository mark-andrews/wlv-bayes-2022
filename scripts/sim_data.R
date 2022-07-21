library(tidyverse)

# Generate simulated data --------------------------------------------------

set.seed(10101) # set the random number generator seed

N <- 25

x_1 <- rnorm(N) # random values for predictor 1
x_2 <- rnorm(N) # random values for predictor 2

beta_0 <- 1.25 # intercept term
beta_1 <- 1.75 # coefficient for predictor x_1
beta_2 <- 2.25 # coefficient for predictor x_2

# mean vector
mu <- beta_0 + beta_1 * x_1 + beta_2 * x_2

# outcome variable
y <- mu + rnorm(N, sd = 1.75)

data_df1 <- tibble(x_1, x_2, y)


# Another data set --------------------------------------------------------

set.seed(10101)
n <- 250
data_df2 <- tibble(A = rnorm(n, mean = 1, sd = 1),
                   B = rnorm(n, mean = 0.25, sd = 2)
) %>% pivot_longer(cols = everything(), names_to = 'x', values_to = 'y')


# Another data set II -----------------------------------------------------

set.seed(10101)
n <- 25
data_df3 <- tibble(x = rnorm(n),
                   y = 5 + 0.5 * x + rnorm(n, sd = 0.1))


data_df4 <- data_df3
data_df4[12,2] <- 7.5

