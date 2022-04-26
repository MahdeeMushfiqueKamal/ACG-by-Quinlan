set.seed(123)
X = rnorm(10, c(1:10))
Y = rnorm(10, c(1:10))

plot(X,Y)

X_resid = X - mean(X)
Y_resid = Y - mean(Y)

prod = X_resid * Y_resid

covariance = sum(prod) / (length(X)-1)

print(covariance)

print(cov(X,Y))

pierson_cc = covarience / (sd(X)*sd(Y))
print(pierson_cc)

print(cor(X,Y))


# linear regression
head(mtcars)
#install.packages("ggplot2")
#install.packages("cowplot")
library(ggplot2)
library(cowplot)


ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point() + geom_smooth(method="lm")
# geom_smooth(method="lm") to a plot invokes "ordinary least-squares" regression

ols_mod = lm(mpg ~ wt, data=mtcars)
summary(ols_mod)