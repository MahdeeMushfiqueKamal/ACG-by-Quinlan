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

Babies birth-weight is normally distributed with a mean of 3586 grams and standard deviation of 460.

**Question 1**: What is the probability of a birth-weight being greater than or equal to 4000 grams?

```r
# use complement rule, 1 - P(lower than 460)
1 - pnorm(4000, mean = 3586, sd = 460, lower.tail=TRUE)

# or flip tails of distribution
pnorm(4000, mean = 3586, sd = 460, lower.tail=FALSE)

```

**Question 1**: What is the probability of a birth-weight being between 3000 and 4000 grams?

```r
# subtract the two CDF probabilities
pnorm(4000, mean = 3586, sd = 460, lower.tail=TRUE) - pnorm(3000, mean = 3586, sd = 460, lower.tail=TRUE)

```


#### QQ-Plot (Quantile Quantile Plot)

T-distribution, chi-square distribution are similar in shape to normal distribution. So only plotting isn't enough for finding if a distribution is normally distributed. We use Quantile-Quantile Plot for that. 

**Quantile:** values that divide a frequency distribution into groups with equal number of values. 

Quartiles: divide into 4 groups
Quintiles: divide into 5 groups
Deciles:   divide into 10 groups
Vigintiles: divide into 20 groups
Percentiles: divide into 100 groups

On the X-asis of QQ-Plot there is theoretical quantiles and on the y-axis there is Observed quantiles. 

#### QQ Plot code in R: 

Code for smaller value:

```r
## QQ-Plot
observed <- c(7.19, 6.31, 5.89, 4.5, 3.77, 4.25, 5.19, 5.79, 6.79)
qqnorm(sort(observed))
qqline(sort(observed))
```
![](/figs/gauss2.png)

Code for Galton's Data of Heights:

```r
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
```

![](/figs/gauss3.png)

- If the data is normally distributed then the points will be on the line. 
- Small deviation from the line is because of sampling error. 

---

This is a class note from **Aaron Quinlan's** [Salt Lake Learners of Biostatistics](https://github.com/quinlan-lab/sllobs-biostats) course created by mmk. See acknowledgement in README.md