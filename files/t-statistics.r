# one sample T- test
obs_exp = c(12.0,11.5,9.5,10.5,10.8)
xhat = mean(obs_exp) # mean of the observed value.
sem = sd(obs_exp)/sqrt(length(obs_exp)) # standard error of the mean
tstat = (xhat - 10.0)/sem # u, the reference value is 10
tstat
t.test(obs_exp, mu = 10, alternative = "two.sided")



#two sample t-test
dat = read.csv("https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv")

library(ggplot2)
library(dplyr)
ggplot(dat, aes(x=Diet, y=Bodyweight)) + geom_boxplot() + geom_jitter(aes(col=Diet)) +
  labs(title="box plot the weights of the control and high fat female mice")


control = dat %>% filter(Diet=="chow")
highfat = dat %>% filter(Diet=="hf")  

diff_of_means = mean(highfat$Bodyweight) - mean(control$Bodyweight)
diff_of_means
pooled_se_noise <- sqrt(var(highfat$Bodyweight)/nrow(highfat) + var(control$Bodyweight)/nrow(control))
pooled_se_noise
tstat = diff_of_means / pooled_se_noise
tstat
t.test(highfat$Bodyweight, control$Bodyweight)
