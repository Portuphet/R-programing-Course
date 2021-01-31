## ggplot data visualization
library(tidyverse)

## ggplot +> data mapping geom

ggplot(data = mtcars, mapping = aes(x = mpg)) +
  geom_histogram(bins = 10)

ggplot(data = mtcars, mapping = aes(x = mpg)) +
  geom_density()

base_layer <- ggplot(data = mtcars, mapping = aes(x = mpg)) 

base_layer + geom_histogram()
base_layer + geom_density()

## two variables = > scatter plot
ggplot(mtcars, aes(wt, mpg)) +
  ## setting graphic aesthetics
  geom_point(colour = "red", size = 4, alpha = 0.5) +
  geom_smooth(method = "lm", se = F, color = "black")
