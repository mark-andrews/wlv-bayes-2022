library(tidyverse)
library(brms)

# load data ---------------------------------------------------------------

weight_df <- read_csv("https://raw.githubusercontent.com/mark-andrews/wlv-bayes-2022/main/data/weight.csv")
biochem_df <- read_csv("https://raw.githubusercontent.com/mark-andrews/wlv-bayes-2022/main/data/biochemist.csv")


# Create a binary variable ------------------------------------------------

weight_df <- mutate(weight_df, dweight = weight > median(weight))


# Classical/frequentist logistic regression -------------------------------

M_freq_4 <- glm(dweight ~ height + gender + age, data = weight_df,
                family = binomial(link = 'logit'))

summary(M_freq_4)$coefficient


# Bayesian logistic regression --------------------------------------------

M_bayes_4 <- brm(dweight ~ height + gender + age, data = weight_df,
                 save_pars = save_pars(all = TRUE),
                family = bernoulli(link = 'logit'))

fixef(M_bayes_4)

M_bayes_4_null <- brm(dweight ~ height + age, data = weight_df,
                      save_pars = save_pars(all = TRUE),
                 family = bernoulli(link = 'logit'))

loo(M_bayes_4, M_bayes_4_null)
bayes_factor(M_bayes_4, M_bayes_4_null, log = TRUE)


# Poisson regression ------------------------------------------------------

# classical/frequentist

M_freq_5 <- glm(publications ~ prestige,
                data = biochem_df,
                family = poisson())

summary(M_freq_5)$coefficients


# Bayesian Poisson regression
M_bayes_5 <- brm(publications ~ prestige,
                 data = biochem_df,
                 save_pars = save_pars(all =TRUE),
                 family = poisson())

fixef(M_bayes_5)

# Bayesian Negative Binomial 
M_bayes_6 <- brm(publications ~ prestige,
                 data = biochem_df,
                 save_pars = save_pars(all =TRUE),
                 family = negbinomial())

M_bayes_6

loo(M_bayes_6, M_bayes_5)
bayes_factor(M_bayes_6, M_bayes_5, log = TRUE)
