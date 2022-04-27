data(mtcars)
head(mtcars)

#histogram and scatter plot in regular R
hist(mtcars$hp)
plot(mtcars$hp, mtcars$mpg)

#installing package and importing
#install.packages("ggplot2")
library(ggplot2)

# ggplot
ggplot(mtcars, aes(x=mpg, y=hp)) + geom_point() 

p <- ggplot(mtcars, aes(x=mpg, y=hp))
p + geom_point() + geom_smooth() +
  labs(x="Miles per gallon",y="Horsepower",title="Relationship between MPG and HP")


p <- ggplot(mtcars, aes(x=mpg, y=hp))
p + geom_point(col="blue") + geom_smooth(method="lm", col="black", fill="red", alpha = 0.25) +
  labs(x="Miles per gallon",y="Horsepower",title="Relationship between MPG and HP")

# more on data
p <- ggplot(mtcars, aes(x=mpg, y=hp, col=cyl)) #sets the color of the point a function on cyl
p + geom_point() 


p <- ggplot(mtcars, aes(x=mpg, y=hp)) + 
  geom_point(size = 2,aes(col=factor(cyl))) +
  geom_smooth(method="lm") + 
  labs(x="Miles per gallon",y="Horsepower",title="Relationship between MPG and HP")


  
p <- ggplot(mtcars, aes(x=factor(cyl), y=mpg,col=cyl))
p + geom_violin(aes(col=factor(cyl))) + geom_jitter(aes(col=factor(cyl)))

