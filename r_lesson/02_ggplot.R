install.packages("ggplot2")
library(ggplot2)

#dataframe
#variables
#visualization

gapminder <- read.csv("gapminder.csv", stringsAsFactors = TRUE)
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp))

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) + geom_point()

ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp)) + geom_point()

ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp,
                                       color = continent)) + geom_point()
ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp,
                                       color = continent, by = country)) + geom_line()
ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp,
                                       color = continent, by = country)) + geom_boxplot()

ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp,
                                       color = continent, by = country)) + geom_line() + geom_point()

?geom_line
ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp,
                                       by = country)) + 
  geom_line(mapping = aes (color=continent)) + geom_point()

ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp,
                                       by = country)) + 
  geom_line(mapping = aes (color=continent))
lifeExpYear <- ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp,
                                                      by = country)) + 
  geom_line(mapping = aes (color=continent))
lifeExpYear
ggsave(filename = "lifeExpYear.png", lifeExpYear)
#Swappin geom_point and geom_line changes the order in which they are renedered

ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp,
                                       by = country)) + 
  geom_point() + geom_line(mapping = aes (color=continent))

#Fitting models
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp
                                      )) + geom_point() + scale_x_log10() + geom_smooth(method = 'loess')

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp
)) + geom_point(mapping = aes (color=continent)) + scale_x_log10() + geom_smooth(method = 'loess')

?mapping
?aes
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp
)) + geom_point(shape = 18, size = 2, mapping = aes (color=continent)) + scale_x_log10() + geom_smooth(method = 'loess')

#ggplot wants 3 things
#1. data frame, 2. variables from the data frame, 2. how you want to displaty the data

ggplot(data=gapminder, mapping = aes(x = gdpPercap, 
                                     fill = continent)) +
   geom_density() +
  scale_x_log10() +
  facet_wrap(~ year)

