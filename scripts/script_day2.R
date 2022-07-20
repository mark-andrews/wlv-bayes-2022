library(tidyverse)
library(priorexposure)

help(package = 'priorexposure') # show the functions in that package


# define data -------------------------------------------------------------

n <- 250 # number of coin flips
m <- 139 # number of heads observed

# plot the likelihood function
bernoulli_likelihood(n, m) + coord_cartesian(xlim = c(0.4, 0.7))

bernoulli_likelihood(n, m)
bernoulli_likelihood(25, 14)
bernoulli_likelihood(250*2, 139*2)


# Beta priors -------------------------------------------------------------

beta_plot(alpha = 3, beta = 5)
beta_plot(alpha = 1, beta = 1)
beta_plot(alpha = 10, beta = 10)
beta_plot(alpha = 5, beta = 5)


# Posterior plots ---------------------------------------------------------

bernoulli_posterior_plot(n, m, alpha = 5, beta = 5, show_hpd = T)

bernoulli_posterior_plot(n, m, alpha = 5, beta = 5, show_hpd = T) + 
  coord_cartesian(xlim = c(0.4, 0.7))

# summarize the posterior distribution
bernoulli_posterior_summary(n, m, alpha = 5, beta = 5)

# 95% HPD
get_beta_hpd(m + 5, (n-m) + 5)

# posterior distribution with flat/uniform prior
bernoulli_posterior_plot(n, m, alpha = 1, beta = 1, show_hpd = T) + 
  coord_cartesian(xlim = c(0.4, 0.7))

bernoulli_posterior_summary(n, m, alpha = 1, beta = 1)


# Diamond Princess covid-19 IFR estimate -------------------------------

# Estimate the IFR of covid-19 from Diamond Princess outbreak
# https://en.wikipedia.org/wiki/COVID-19_pandemic_on_Diamond_Princess

infections <- 712
fatalities <- 14

# prior massed on the lower end of the interval
beta_plot(1, 10)

bernoulli_posterior_plot(infections, fatalities, alpha = 1, beta = 10) + 
  coord_cartesian(xlim = c(0.0, 0.05))

bernoulli_posterior_summary(infections, fatalities, alpha = 1, beta = 10)

