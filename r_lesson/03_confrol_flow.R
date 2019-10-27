for(my_var in 1:10){
  print(my_var)
}

for (i in 1:3){
  for(j in letters[1:3]){
    print(paste(i, j))
  }
}

c <- c()
c
for (i in 1:5){
  c <- c(c, i^2)
  print(c)
}

"X continent has a life expectancy between __ and __"
for(cont in unique(gapminder$continent)){ 
  min_life <- min(gapminder[gapminder$continent == cont, "lifeExp"])
  max_life <- max(gapminder[gapminder$continent == cont, "lifeExp"])
  print(paste(cont, "has a life expectancy between", min_life, "and", max_life))
}

#do a loop to print mean life expectancy for each continent
for(cont in unique(gapminder$continent)){ 
  mean_life <- mean(gapminder[gapminder$continent == cont, "lifeExp"])
  print(paste(cont, "has a mean life expectancy of", mean_life))
}

# if else
x <- 3
if (x>0){
  print("positive number")
} else if (x < 0){
    print("negative number")
} else{
    print("zero")
}

#note: as soon as first condition is met, R stops

#loop and conditional
for (i in c(-1, 3, 0, -7)) {
  if (i>0){
    print("Positive number")
  } else if (i < 0){
    print("negative number")
  } else {
    print ("zero")
  }
  
}

# gapminder with loops and conditional statements
mean_life_exp_gapminder <- mean(gapminder$lifeExp)
for (cont in unique(gapminder$continent)) {
   if (mean(gapminder[gapminder$continent == cont, "lifeExp"]) > mean_life_exp_gapminder){
    print(paste(cont, "has a mean life expectancy higher than the average for all countries"))
  }
}

summary(gapminder$gdpPercap)
summary(gapminder[gapminder$year == 2007,]$gdpPercap)

first_q <- summary(gapminder[gapminder$year == 2007,]$gdpPercap)[2]
first_q
third_q <- summary(gapminder[gapminder$year == 2007,]$gdpPercap)[5]
third_q
mid <- summary(gapminder[gapminder$year == 2007,]$gdpPercap)[3]
for (country in unique(gapminder$country)){
     country_gdp <- gapminder[gapminder$country == country & gapminder$year == 2007, 'gdpPercap']
  if (country_gdp <= first_q){
    print(paste(country, "has a GDP at or below the first quartile"))
  } else if (country_gdp == mid){
    print(paste(country, "has a GDP equal to the median"))
  } else if (country_gdp >= third_q){
    print(paste(country, "has a GDP at or above the third quartile"))
  }    
}
