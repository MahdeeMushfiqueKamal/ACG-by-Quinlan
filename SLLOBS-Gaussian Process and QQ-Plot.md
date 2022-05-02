## Gaussian Process and QQ-Plot

Gaussian Distribution is a Continuous distribution with two parameters, mean(μ) and deviation(σ).

**Formula:** \
![](https://latex.codecogs.com/png.image?\dpi{150}\bg{white}f(x&space;|&space;\mu&space;,&space;\sigma&space;^2)&space;=&space;\frac{1}{\sqrt{2&space;\pi&space;\sigma&space;^2}}&space;e^{-\frac{(x-\mu)^2}{2&space;\sigma&space;^2}})


#### Properties of Normal Distribution:

1. 68.27% of values lie with in μ-σ to μ+σ
2. 95.45% of values lie with in μ-2σ to μ+2σ
3. 99.73% of values lie with in μ-3σ to μ+3σ

```r
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
```

![](/figs/gauss1.png)

```r
# Question:What is the probability of a birth-weight being greater than or equal to 4000 grams?
# use complement rule, 1 - P(lower than 460)
1 - pnorm(4000, mean = 3586, sd = 460, lower.tail=TRUE)

# or flip tails of distribution
pnorm(4000, mean = 3586, sd = 460, lower.tail=FALSE)

# What is the probability of a birth-weight being between 3000 and 4000 grams?
# subtract the two CDF probabilities
pnorm(4000, mean = 3586, sd = 460, lower.tail=TRUE) - pnorm(3000, mean = 3586, sd = 460, lower.tail=TRUE)

```