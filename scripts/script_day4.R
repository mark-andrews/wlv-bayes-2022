library(tidyverse)
library(brms)

# Generate simulate data --------------------------------------------------

# run this code, where `sim_data.R` is in `scripts` in https://github.com/mark-andrews/wlv-bayes-2022
#source("sim_data.R")

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
prior_summary(M_bayes_1)

# set prior explicitly
new_priors <- c(
  set_prior("normal(0, 10)", class = 'b', coef = 'age'),
  set_prior("normal(0, 10)", class = 'b', coef = 'height'),
  set_prior("normal(0, 100)", class = 'b', coef = 'genderMale'),
  set_prior("student_t(3, 78, 16)", class = 'Intercept'),
  set_prior("student_t(3, 0, 16)", class = 'sigma')
)

# use new_priors
M_bayes_2 <- brm(weight ~ height + gender + age, 
                 prior = new_priors,
                 data = weight_df)

prior_summary(M_bayes_2)

fixef(M_bayes_1)
fixef(M_bayes_2)



# nonhomogeneity of variance t-test ---------------------------------------

ggplot(data_df2, aes(x = x, y = y)) + geom_boxplot(width = 0.5)
ggplot(data_df2, aes(x = x, y = y)) + geom_boxplot(width = 0.5) + geom_jitter(width = 0.25)

# frequentist analysis
M_freq_3 <- lm(y ~ x, data = data_df2)
t.test(y ~ x, data = data_df2, var.equal = T)
summary(M_freq_3)$coefficients

M_bayes_3 <- brm(y ~ x, data = data_df2) # t-test type model

M_bayes_4 <- brm(
  bf(y ~ x, sigma ~ x), # mean varies by x, sd varies by x
  data = data_df2)

fixef(M_bayes_3)
fixef(M_bayes_4)


# Robust regression -------------------------------------------------------


ggplot(data_df3, aes(x = x, y = y)) + geom_point()
ggplot(data_df4, aes(x = x, y = y)) + geom_point()

# normal linear model with non-outlier data
M_bayes_5 <- brm(y ~ x, data = data_df3)

# normal linear model with the outlier data
M_bayes_6 <- brm(y ~ x, data = data_df4)

fixef(M_bayes_5)
fixef(M_bayes_6)

M_bayes_7 <- brm(y ~ x, 
                 data = data_df4,
                 family = student())

fixef(M_bayes_7)


# One way anova -----------------------------------------------------------

M_freq_4 <- lm(weight ~ group, data = PlantGrowth) # general linear model M_freq_4
anova(M_freq_4) # model comparison based on the general linear model M_freq_4

M_freq_4a <- aov(weight ~ group, data = PlantGrowth)
summary(M_freq_4a)

drop1(M_freq_4, scope = ~ group, test = 'F')
M_freq_4_null <- lm(weight ~ 1, data = PlantGrowth) # null general linear model M_freq_4

anova(M_freq_4, M_freq_4_null) # 


# Bayesian one-way anova --------------------------------------------------

M_bayes_8 <- brm(weight ~ group, data = PlantGrowth) 
M_bayes_8_null <- brm(weight ~ 1, data = PlantGrowth)

# for Bayes factors `save_pars = save_pars(all = TRUE)` is required
M_bayes_8 <- brm(weight ~ group, data = PlantGrowth, save_pars = save_pars(all = TRUE))
M_bayes_8_null <- brm(weight ~ 1, data = PlantGrowth, save_pars = save_pars(all = TRUE))
