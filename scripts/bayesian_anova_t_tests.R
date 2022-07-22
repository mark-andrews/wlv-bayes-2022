library(tidyverse)
library(brms)


# Classical/frequentist oneway Anova --------------------------------------

M_freq_1 <- lm(weight ~ group, data = PlantGrowth)
M_freq_0 <- lm(weight ~ 1, data = PlantGrowth)

# version 1
anova(M_freq_0, M_freq_1)

# version 2
drop1(M_freq_1, scope = ~ group, test = 'F')

# version 3
M_freq_1_a <- aov(weight ~ group, data = PlantGrowth)
summary(M_freq_1_a)

AIC(M_freq_0) - AIC(M_freq_1)

# Bayesian one way Anova --------------------------------------------------

M_bayes_1 <- brm(weight ~ group, data = PlantGrowth)
M_bayes_0 <- brm(weight ~ 1, data = PlantGrowth)

loo(M_bayes_1)
loo(M_bayes_0)

loo(M_bayes_0, M_bayes_1)


# Bayes factor based one way Anova ----------------------------------------

M_bayes_1 <- brm(weight ~ group, data = PlantGrowth, save_pars = save_pars(all = TRUE))
M_bayes_0 <- brm(weight ~ 1, data = PlantGrowth, save_pars = save_pars(all = TRUE))

bayes_factor(M_bayes_0, M_bayes_1)
bayes_factor(M_bayes_1, M_bayes_0, log = TRUE)


# Bayesian t-test ---------------------------------------------------------

PlantGrowth2 <- filter(PlantGrowth, group != 'ctrl') # just the two trt group

M_bayes_2 <- brm(weight ~ group, data = PlantGrowth2, save_pars = save_pars(all = TRUE))
M_bayes_2_null <- brm(weight ~ 1, data = PlantGrowth2, save_pars = save_pars(all = TRUE))

loo(M_bayes_2_null, M_bayes_2)
bayes_factor(M_bayes_2, M_bayes_2_null, log = T)
