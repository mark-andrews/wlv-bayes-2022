library(tidyverse)
library(brms)

# Generate simulate data --------------------------------------------------

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



# Classical linear regression ---------------------------------------------

M_lm <- lm(y ~ x_1 + x_2, data = data_df1)
coef(M_lm) # estimates of the coefficients
sigma(M_lm) # estimate of the standard deviation

summary(M_lm)
round(summary(M_lm)$coefficients, 3)

round(confint(M_lm), 3) # 95% CI


# Bayesian linear regression ----------------------------------------------

M_bayes <- brm(y ~ x_1 + x_2, data = data_df1)

plot(M_bayes) # posterior distr and the trace plot

plot(M_bayes, par = 'b_Intercept') # just one var

mcmc_plot(M_bayes) # interval plot of posterior
mcmc_plot(M_bayes, type = 'hist', binwidth = 0.05) # histogram plot
mcmc_plot(M_bayes, type = 'areas') # density with shaded area
mcmc_plot(M_bayes, type = 'areas_ridges') # ridges plot