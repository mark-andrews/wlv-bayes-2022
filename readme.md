# Bayesian Data Analysis

Bayesian methods are now increasingly widely in data analysis across most
scientific research fields.  Given that Bayesian methods differ conceptually
and theoretically from their classical statistical counterparts that are
traditionally taught in statistics courses, many researchers do not have
opportunities to learn the fundamentals of Bayesian methods, which makes using
Bayesian data analysis in practice more challenging.  The aim of this course is
to provide a solid introduction to Bayesian methods, both theoretically and
practically.  We will begin by teaching the fundamental concepts of Bayesian
inference and Bayesian modelling, including how Bayesian methods differ from
their classical statistics counterparts, and then provide a solid introdction
to how to do Bayesian data analysis with real world problems.  Throughout this
course, we will be using, via the brms package, Stan based Markov Chain Monte
Carlo (MCMC) methods, which is argubly the state-of-the-art approach to modern
Bayesian data analysis. On the first day of the course, we will provide a
general introduction to R.


## Software

A guide to software requirements for this course is [here](software.md).
However, attendees will also be able to use R/RStudio and Bayesian MCMC tools online using a Binder service like this: [![Binder](https://notebooks.gesis.org/binder/badge_logo.svg)](https://notebooks.gesis.org/binder/v2/gh/mark-andrews/hellobinder-rstan/HEAD?urlpath=rstudio)


## Schedule

## Day 1: R bootcamp

* *The What and Why of R*. We'll start by briefly explaining what R is, what is used for, and why is has become so popular.
* *Guided tour of RStudio*. RStudio is the most widely used interface to R. We will provide a tour of all its parts and features and how to use it effectively.
* *Step by step introduction to R*. Having explain what R is, and introduced RStudio, we turn to our coverage of all the fundamentals of R and the R environment. These include 
    * variables and assignment
    * vectors
    * data frames
    * functions 
    * scripts
    * installing and loading packages
    * using RStudio projects
    * reading in data, etc. 
    This topic will be detailed so that everyone obtains a solid grasp on these fundamentals, which makes all subsequent learning much easier.
* *Brief introduction to wrangling, visualization, statistics*. In the last section of the course, we will provide a very brief introduction to data wrangling, data visualization, and doing statistical analysis in R. These are huge topics, and so here, we just provide a brief introduction.

## Day 2

* We will begin with a overview of what Bayesian data analysis is in essence and how it fits into statistics as it practiced generally. Our main point here will be that Bayesian data analysis is effectively an alternative school of statistics to the traditional approach, which is referred to variously as the *classical*, or *sampling theory based*, or *frequentist* based approach, rather than being a specialized or advanced statistics topic. However, there is no real necessity to see these two general approaches as being mutually exclusive and in direct competition, and a pragmatic blend of both approaches is entirely possible.

* Introducing Bayes' rule. Bayes' rule can be described as a means to calculate the probability of causes from some known effects. As such, it can be used as a means for performing statistical inference. In this section of the course, we will work through some simple and intuitive calculations using Bayes' rule. Ultimately, all of Bayesian data analysis is based on an application of these methods to more complex statistical models, and so understanding these simple cases of the application of Bayes' rule can help provide a foundation for the more complex cases.

* Bayesian inference in a simple statistical model. In this section, we will work through a classic statistical inference problem, namely inferring the bias of a coin flip, or equivalent problems. This problem is easy to analyse completely with just the use of R, but yet allows us to delve into all the key concepts of all Bayesian statistics including the likelihood function, prior distributions, posterior distributions, maximum a posteriori estimation, high posterior density intervals, posterior predictive intervals, marginal likelihoods, Bayes factors, model evaluation of out-of-sample generalization.

## Day 3

* Markov Chain Monte Carlo. The previous sections provides so-called analytical approaches to inference. This is where we can calculate desired quantities and distributions by way of simple formulae. However, analytical approaches to Bayesian analyses are only possible in a relatively restricted set of cases. On the other hand, numerical methods, specifically Markov Chain Monte Carlo (MCMC) methods can be applied to virtually any Bayesian model. In this section, will introduce the general topic of MCMC and how it is used for Bayesian inference. We will re-perform the analysis presented in the previous sections but using MCMC methods. For this, we will use the *brms* package in R that provides an exceptionally easy to use interface to Stan.

## Day 4

* Bayesian linear models. We begin by covering Bayesian linear regression. For this, we will use the `brm` command from the `brms` package, and we will compare and contrast the results with the standard `lm` command.
By comparing and contrasting `brm` with `lm` we will see all the major similarities and differences between the Bayesian and classical approach to linear regression.
We will, for example, see how Bayesian inference and model comparison works in practice and how it differs conceptually and practically from inference and model comparison in classical regression.
As part of this coverage of linear models, we will also use categorical predictor variables and explore varying intercept and varying slope linear models.

## Day 5

* Extending Bayesian linear models. Classical normal linear models are based on strong assumptions that do not always hold in practice.
For example, they assume a normal distribution of the residuals, and assume homogeneity of variance of this distribution across all values of the predictors.
In Bayesian models, these assumptions are easily relaxed.
For example, we will see how we can easily replace the normal distribution of the residuals with a t-distribution, which will allow for a regression model that is robust to outliers.
Likewise, we can model the variance of the residuals as being dependent on values of predictor variables.

* Bayesian generalized linear models. Generalized linear models include models such as logistic regression, including multinomial and ordinal logistic regression, Poisson regression, negative binomial regression, zero-inflated models, and other models. Again, for these analyses we will use the `brms` package and explore this wide range of models using real world data-sets. In our coverage of this topic, we will see how powerful Bayesian methods are, allowing us to easily extend our models in different ways in order to handle a variety of problems and to use assumptions that are most appropriate for the data being modelled.


