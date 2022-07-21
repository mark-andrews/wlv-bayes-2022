library(tidyverse)
library(brms)

# Generate simulate data --------------------------------------------------

# run this code, where `sim_data.R` is in `scripts` in https://github.com/mark-andrews/wlv-bayes-2022
# source("sim_data.R")

# Bayesian linear regression ----------------------------------------------

M_bayes <- brm(y ~ x_1 + x_2, data = data_df1)

# Look at the priors ------------------------------------------------------

prior_summary(M_bayes)
get_prior(y ~ x_1 + x_2, data = data_df1)

# General linear model: weight, height, gender, age -----------------------

weight_df <- read_csv("https://raw.githubusercontent.com/mark-andrews/wlv-bayes-2022/main/data/weight.csv")

ggplot(weight_df, aes(x = height, y = weight, colour = gender)) + 
  geom_point(size = 0.5) +
  stat_smooth(method = 'lm', fullrange = T) +
  scale_color_brewer(palette = 'Set1')

# classical/frequentist general linear model
M_freq_1 <- lm(weight ~ height + gender + age, data = weight_df)
summary(M_freq_1)
confint(M_freq_1)

# Bayesian general linear model
M_bayes_1 <- brm(weight ~ height + gender + age, data = weight_df)
M_bayes_1
plot(M_bayes_1)

# set prior explicitly
new_priors <- c(
  set_prior("normal(0, 10)", class = 'b', coef = 'age'),
  set_prior("normal(0, 10)", class = 'b', coef = 'height'),
  set_prior("normal(0, 100)", class = 'b', coef = 'genderMale'),
  set_prior("student_t(3, 78, 16)", class = 'Intercept'),
  set_prior("student_t(3, 0, 16)", class = 'sigma')
)

