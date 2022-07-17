library(tidyverse)

# A simulated data set ----------------------------------------------------

# normal linear 
set.seed(10101) # Omit or change this if you like

N <- 25

x_1 <- rnorm(N)
x_2 <- rnorm(N)

beta_0 <- 1.25
beta_1 <- 1.75
beta_2 <- 2.25

mu <- beta_0 + beta_1 * x_1 + beta_2 * x_2

y <- mu + rnorm(N, mean=0, sd=1.75)

data_df1 <- tibble(x_1, x_2, y)


# Another simulated data set ----------------------------------------------

# non-homogeneity of variance

set.seed(10101)
n <- 250
data_df2 <- tibble(A = rnorm(n, mean = 1, sd = 1),
                   B = rnorm(n, mean = 0.25, sd = 2)
) %>% pivot_longer(cols = everything(), names_to = 'x', values_to = 'y')


# And so more -------------------------------------------------------------

# normal-linear with outliers

set.seed(10101)
n <- 25
data_df3 <- tibble(x = rnorm(n),
                  y = 5 + 0.5 * x + rnorm(n, sd = 0.1))


data_df4 <- data_df3
data_df4[12,2] <- 7.5


