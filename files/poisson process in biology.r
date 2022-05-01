#EPL Example
library(ggplot2)
num_rc <- 0:10
p_num_rc <- dpois(0:10, lambda=0.11)
rc_prob = data.frame(num_rc, p_num_rc)
ggplot(rc_prob, aes(x=as.factor(num_rc), y=p_num_rc)) + 
  labs(title = "Probability distribution of Number of Red cards") +
  geom_col() 
  

#de novo mutation example - zero non-coding mutation
dpois(x =0, lambda = 1.402)
#plotting
library(ggplot2)
num_dnm <- 0:10
p_num_dnm <- dpois(0:10, lambda=1.402)
dnm_prob = data.frame(num_dnm, p_num_dnm)
ggplot(dnm_prob, aes(x=as.factor(num_dnm), y=p_num_dnm)) +
  labs(title = "Probability distribution of de novo coding mutation") +
  geom_col()


#chocolate chip cookie example
chunks <- read.csv(file = "sllobs_chocolate_chunks.csv",header = TRUE,dec = ",")
library(ggplot2)
library(cowplot)
ggplot(chunks,aes(x=num_chunks)) + geom_bar() 



#install.packages("vcd")   vcd = visualize categorical data
library("vcd")
gf <- goodfit(chunks$num_chunks, "poisson")
rootogram(gf)




# see if a randomly generated poisson data fits in goodfit
pd <- rpois(n = 1000, lambda= 3)
gf <- goodfit(pd, "poisson")
rootogram(gf)







