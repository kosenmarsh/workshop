3+2
4/2
1/0
(4*6)+2
(4
  +2)

#Data type
Data type
# NUMBER TYPE
3
2
2.4
3.66666
class(3)
class(hat)
3L
class(3L)
as.integer(3)
class(as.integer(3))
class(3+1i)      
#word type
'dog'

'plant'
class('dog')
TRUE

300>200
3 == 3L
class(3)==class(3L)



dog <- 3
dog
class(dog)
4 -> cat
cat
.day <- 5
.day
num_vector <- 1:5
num_vector + num_vector
num_vector * num_vector
my_list <- list(1:5)
my_list * my_list
my_list
my_list * my_list
phonebook <- list(name="Asher", phone="111-1111", age=27)
phonebook["name"]
<- matrix(nrow=2, ncol=3)
m <- matrix(1:6, nrow=2, ncol=3)
m
m <- matrix(1:6, nrow=2, ncol=3, byrow=TRUE)
m
df <- data.frame(id=letters[1:10], x=1:10, y=11:20)
df
class(df)
typeof(df)
head(df)
tail(df)
nrow(df)
ncol(df)
dim(df)
str(df)
str(df)
names(
  df
)
summary(df)
df <- 0
df
cats <- data.frame(coat=c("calico","black","tabby"),
                   weight=c(2.1, 5.0, 3.2),
                   likes_string=c(1, 0, 1))
cats
write.csv(x=cats, file="cats_data.csv", row.names = FALSE)
cats2 <- read.csv("cats_data.csv")
cats2
cats$coat
cats$weight+2
age <- c(3,4,5)
cbind(cats,age)
cats

##Load gapminder data
gapminder <- read.csv("gapminder.csv")
gapminder

str(gapminder)
head(gapminder)
ncol(gapminder)
cats <- cbind(cats,age)
cats
min(gapminder$year)
mean(gapminder$lifeExp)
max(gapminder$pop)

#Subset:#dataframe$variable
gapminder[1,1]
gapminder[1:5,6]
colnames(
  gapminder
)
gapminder[20:22,3:6]
colnames(gapminder)
gapminder2 <- gapminder[-3:-1704,-3:-4]
gapminder2
head(gapminder[,"lifeExp"])
head(gapminder[, c('lifeExp','pop')])
head(gapminder[gapminder$year == 1997, ])
head(gapminder[gapminder$country == "Gabon" & gapminder$year == 1997, ])
