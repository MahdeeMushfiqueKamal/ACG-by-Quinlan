# drawing a basic bell curve
library(ggplot2)
library(cowplot)

x = seq(-4, 4, length=100)
y <- dnorm(x, mean = 0, sd = 1)
gauss <- data.frame(x, y) 
ggplot(gauss, aes(x, y)) + geom_line() + 
  geom_area(stat = "function", fun = dnorm, fill = "#00998a", alpha=1.0, xlim = c(-1, 1)) +
  geom_area(stat = "function", fun = dnorm, fill = "#00998a", alpha=0.50, xlim = c(-2, 2)) +
  geom_area(stat = "function", fun = dnorm, fill = "#00998a", alpha=0.25, xlim = c(-3, 3))


# birth weight probability density function and cumulative density function graph

weight = seq(2000, 6000, length=10000)

# Probability Density Function
# Question:What is the probability of a birth-weight being greater than or equal to 4000 grams?
# use complement rule, 1 - P(lower than 460)
1 - pnorm(4000, mean = 3586, sd = 460, lower.tail=TRUE)

# or flip tails of distribution
pnorm(4000, mean = 3586, sd = 460, lower.tail=FALSE)

# What is the probability of a birth-weight being between 3000 and 4000 grams?
# subtract the two CDF probabilities
pnorm(4000, mean = 3586, sd = 460, lower.tail=TRUE) - pnorm(3000, mean = 3586, sd = 460, lower.tail=TRUE)



## QQ-Plot
observed <- c(7.19, 6.31, 5.89, 4.5, 3.77, 4.25, 5.19, 5.79, 6.79)
qqnorm(sort(observed))
qqline(sort(observed))


# QQ plot for height:
#install.packages("UsingR", dependencies=TRUE)
library(UsingR)
library(ggplot2)
library(cowplot)
data("father.son")

head(father.son)

mean(father.son$fheight)
sd(father.son$fheight)

ggplot(father.son) + geom_histogram(aes(fheight)) + geom_vline(xintercept=mean(father.son$sheight),col="orange", size=2)


qqnorm(sort(father.son$fheight))
qqline(sort(father.son$fheight))

