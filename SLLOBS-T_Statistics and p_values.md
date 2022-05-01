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

---

This is a class note from **Aaron Quinlan's** [Salt Lake Learners of Biostatistics](https://github.com/quinlan-lab/sllobs-biostats) course created by mmk. See acknowledgement in README.md