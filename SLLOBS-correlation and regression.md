## SLOOBS-correlation and regression

#### Correlation:

Formula: 
`cor(X,Y) = E[(x-E[x])(y-E[y])]`

code:
```r
> set.seed(123)
> X = rnorm(10, c(1:10))
> Y = rnorm(10, c(1:10))
> plot(X,Y)
> X_resid = X - mean(X)
> Y_resid = Y - mean(Y)
> 
> prod = X_resid * Y_resid
> 
> covariance = sum(prod) / (length(X)-1)
> print(covariance)
[1] 7.808618
> 
> print(cov(X,Y))
[1] 7.808618
```

#### Correlation:

Formula: 
`cor(x,y) = cov(x,y) / (sd(x)*sd(y))`

code: 
```r
> pierson_cc = covarience / (sd(X)*sd(Y))
> print(pierson_cc)
[1] 0.9495822
> 
> print(cor(X,Y))
[1] 0.9495822
```

#### Linear Regression

```r
> head(mtcars)
                   mpg cyl disp  hp drat    wt  qsec vs am gear carb
Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
> #install.packages("ggplot2")
> #install.packages("cowplot")
> library(ggplot2)
> library(cowplot)
> 
> 
> ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point() + geom_smooth(method="lm")
`geom_smooth()` using formula 'y ~ x'
> # geom_smooth(method="lm") to a plot invokes “ordinary least-squares” regression
> 
> ols_mod = lm(mpg ~ wt, data=mtcars)
> summary(ols_mod)

Call:
lm(formula = mpg ~ wt, data = mtcars)

Residuals:
    Min      1Q  Median      3Q     Max 
-4.5432 -2.3647 -0.1252  1.4096  6.8727 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  37.2851     1.8776  19.858  < 2e-16 ***
wt           -5.3445     0.5591  -9.559 1.29e-10 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 3.046 on 30 degrees of freedom
Multiple R-squared:  0.7528,	Adjusted R-squared:  0.7446 
F-statistic: 91.38 on 1 and 30 DF,  p-value: 1.294e-10

```

This is a class note from **Aaron Quinlan's** [Salt Lake Learners of Biostatistics](https://github.com/quinlan-lab/sllobs-biostats) course created by mmk. See acknowledgement in README.md