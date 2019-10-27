install.packages('dplyr')
library(dplyr)

#select
#chooses columns in a data frame

glimpse(gapminder)
select(gapminder, year)
select(gapminder, year, lifeExp, country)
select(gapminder, -year)


#filter
filter(gapminder, continent == "Asia")
filter(gapminder, continent != "Oceania")
filter(gapminder, year > 2000)

two_countries <- c("Albania", "Dominican Republic")
filter(gapminder, country %in% two_countries)

#piping

min(gapminder[, 'lifeExp'])
gapminder %>% select(lifeExp) %>% min()
#ctrl + shift + m == %>%

x1 <- 1:5
x2 <- 2:6
(x1-x2)^2 %>% sum() %>% sqrt()

gapminder %>% 
  select(-pop, -gdpPercap) %>% 
  filter(continent == 'Asia', year == 2007) %>% 
  head()

gapminder %>% 
  select(-pop, -gdpPercap) %>% 
  filter(continent == 'Asia' | continent == "Oceania", year == 2007)

#mutate
mean_life_exp_gapminder
gapminder %>%  mutate(NewColumn = lifeExp - mean_life_exp_gapminder) %>% head()
gapminder <- gapminder %>%  mutate(NewColumn = lifeExp - mean_life_exp_gapminder)
glimpse(gapminder)
gapminder <- select(gapminder, -NewColumn)
#or gapminder <- gapminder %>% select(-NewColumn)
glimpse(gapminder)
#Write a single command (which can span multiple lines and includes pipes) that will produce a dataframe that has the African values for lifeExp, country and year, but not for other Continents. How many rows does your dataframe have and why?
gapminder %>% select(country, year, continent, lifeExp) %>% filter(continent == 'Africa') %>% select(-continent) %>% glimpse()
#better to have filtered first

#groupby
gapminder %>% 
  group_by(continent)

gapminder %>% 
  group_by(year)

#summarize

gapminder %>% 
  group_by(continent) %>% 
  summarise(MeanLife = mean(lifeExp))

gapminder %>% 
  group_by(continent, year) %>% 
  summarise(MeanLife = mean(lifeExp),
           SeLife = sd(lifeExp) /sqrt(n())) %>% 
  ggplot(mapping = aes(x = year, y = MeanLife, color = continent)) +
  geom_line() +
  geom_errorbar(mapping = aes(ymin = MeanLife - SeLife,
                              ymax = MeanLife + SeLife,
                              width = 0.3))

#standard error:
#sd()/sqrt(n())

gapminder %>% 
  select(country, continent) %>% 
  unique() %>% 
  group_by(continent) %>% 
  summarise(count = n())
#n() tells us how many

gapminder %>% 
  select(country, continent) %>% 
  unique() %>% 
  group_by(continent) %>% 
  summarise(n = n()) %>% 
  mutate(count = sum(n),
            proportion = n / sum(n))

#Create a new dataframe that contains the minimum (MinExp) and maximum (MaxExp) life expectancies for each country.

gapminder %>% 
  select(country, lifeExp) %>% 
  group_by(country) %>% 
  summarize(min_life = min(lifeExp),
            max_life = max(lifeExp))

#Calculate the average life expectancy per country. Which has the longest average life expectancy and which has the shortest average life expectancy?


gapminder %>% 
  group_by(country) %>% 
  summarise(MeanLife = mean(lifeExp)) %>% 
  filter(MeanLife == min(MeanLife) | MeanLife == max(MeanLife))

#Make a ggplot scatterplot of the lifeExp vs GDPperCap for the countries whose average life expectancy is lower than average. Color the graph by continent

gapminder %>% 
  group_by(country) %>% 
  summarise(mean_le = mean(lifeExp),
            mean_gdp = mean(gdpPercap),
            continent = unique
            
  
