## T-Statistics, T-Test, T-Distribution and P-Values

According to **central limit theorem** as we increase the number of samples, sample mean tends to the true population mean and standard deviation of the sample decreases. 

Standard Error of the Mean (s.e.m): \
![](https://latex.codecogs.com/png.image?\inline&space;\huge&space;\dpi{150}\bg{white}\sigma_x&space;=&space;\frac{\sigma}{\sqrt{n}})

#### Significance Test:

We use p-value to find out if an observed value is significantly different: 

There are two types of T-tests:
1. Two tailed T-test:
    Probability of measuring a value at least as far as x from mean.
2. One tailed T-test:
    Probability of measuring a value greater than x. 

#### T-test:

T-test is a signal to noise ratio. 

Signal: distance of sample mean from population mean. 
Noise: Standard Error of the mean. 

**Formula for comparing mean to an standard population:** \
![](https://latex.codecogs.com/png.image?\inline&space;\huge&space;\dpi{150}\bg{white}t&space;=&space;\frac{x&space;-&space;\mu}{\frac{sd}{\sqrt{n}}})


**Formula for comparing two samples:** \
![](https://latex.codecogs.com/png.image?\inline&space;\huge&space;\dpi{150}\bg{white}t&space;=&space;\frac{\bar{x_1}&space;-&space;\bar{x_2}}{\sqrt{\frac{sd_{1}&space;^2}{n_1}&space;&plus;&space;\frac{sd_{2}&space;^2}{n_2}})


**One sample T-test code in R:**
```r
> # one sample T- test
> obs_exp = c(12.0,11.5,9.5,10.5,10.8)
> xhat = mean(obs_exp) # mean of the observed value.
> sem = sd(obs_exp)/sqrt(length(obs_exp)) # standard error of the mean
> tstat = (xhat - 10.0)/sem # u, the reference value is 10
> tstat
[1] 2.001624
> t.test(obs_exp, mu = 10, alternative = "two.sided")

	One Sample t-test

data:  obs_exp
t = 2.0016, df = 4, p-value = 0.1159
alternative hypothesis: true mean is not equal to 10
95 percent confidence interval:
  9.667098 12.052902
sample estimates:
mean of x 
    10.86 
```


**Two sample T-test code in R:**

**data:**
```
Diet,Bodyweight
chow,21.51
chow,28.14
chow,24.04
....
hf,25.71
hf,26.37
hf,22.8
```

```r
control = dat %>% filter(Diet=="chow")
> highfat = dat %>% filter(Diet=="hf")  
> 
> diff_of_means = mean(highfat$Bodyweight) - mean(control$Bodyweight)
> diff_of_means
[1] 3.020833
> pooled_se_noise <- sqrt(var(highfat$Bodyweight)/nrow(highfat) + var(control$Bodyweight)/nrow(control))
> pooled_se_noise
[1] 1.469867
> tstat = diff_of_means / pooled_se_noise
> tstat
[1] 2.055174
> t.test(highfat$Bodyweight, control$Bodyweight)

	Welch Two Sample t-test

data:  highfat$Bodyweight and control$Bodyweight
t = 2.0552, df = 20.236, p-value = 0.053
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -0.04296563  6.08463229
sample estimates:
mean of x mean of y 
 26.83417  23.81333 
```

---

This is a class note from **Aaron Quinlan's** [Salt Lake Learners of Biostatistics](https://github.com/quinlan-lab/sllobs-biostats) course created by mmk. See acknowledgement in README.md