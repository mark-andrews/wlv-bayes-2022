library(tidyverse)
library(brms)

# load data ---------------------------------------------------------------

weight_df <- read_csv("https://raw.githubusercontent.com/mark-andrews/wlv-bayes-2022/main/data/weight.csv")

ggplot(weight_df,
       aes(x = height, y = weight, colour = gender)
) + geom_point(size = 0.5, alpha = 0.5) + 
  scale_color_brewer(palette = 'Set1') +
  stat_smooth(method = 'lm', se = F, fullrange = T) +
  theme_classic()


# Classical/frequentist Ancova --------------------------------------------

M_freq_3 <- lm(weight ~ height + gender, data = weight_df)

# ancova version 1
drop1(M_freq_3, scope = ~gender, test = 'F')

M_freq_3_null <- lm(weight ~ height + 1, data = weight_df)

# ancova version 2
anova(M_freq_3_null, M_freq_3)



# Bayesian Ancova ---------------------------------------------------------


M_bayes_3 <- brm(weight ~ height + gender, data = weight_df, save_pars = save_pars(all = TRUE))
M_bayes_3_null <- brm(weight ~ height + 1, data = weight_df, save_pars = save_pars(all = TRUE))

loo(M_bayes_3, M_bayes_3_null)
bayes_factor(M_bayes_3, M_bayes_3_null)
