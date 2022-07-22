library(tidyverse)
library(brms)
library(lme4)


# Sleepstudy plot ---------------------------------------------------------

ggplot(sleepstudy,
       aes(x = Days, y = Reaction, colour = Subject)
) + geom_point() +
  stat_smooth(method = 'lm', se = F) +
  facet_wrap(~Subject)



# Classical/frequentist ---------------------------------------------------

M_freq_6 <- lmer(Reaction ~ Days + (Days|Subject),
                 data = sleepstudy)

summary(M_freq_6)


# Bayesian lmm ------------------------------------------------------------

M_bayes_6 <- brm(Reaction ~ Days + (Days|Subject),
                 data = sleepstudy)

M_bayes_6
