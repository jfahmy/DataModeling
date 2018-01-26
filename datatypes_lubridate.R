#tidyverse does it's best to guess data types, but sometimes
# you need to do your own conversions.
# use "as" functions to convert data types
# use "is" to confirm the data type

foulshots <- c(18, 22, 15, 13, 5)
#adds numbers
sum(foulshots)

foulshots_strings <- c("18", "22", "15", "13", "5")
sum(foulshots_strings)
#throws errors because they're strings
#display class/data type
class(foulshots_strings)

foulshots_converted <- as.numeric(foulshots_strings)
class(foulshots_converted)
sum(foulshots_converted)

is.numeric(foulshots_strings)
is.character(foulshots_strings)

#creating variables
names <- c("Mike", "Rae", "Saly", "Dennis", "Ian", "Steve")
teams <- c(1,1,1,2,2,2)

#making tibble out of variables
assignments <- tibble(names, teams)
# by default, teams was treated as numeric, but it's really a categorical
# value so we convert it to a factor
assignments$teams <- as.factor(assignments$teams)

is.factor(assignments$teams)
is.factor(assignments$names)

#lubridate - deconstructing dates and times
library(lubridate)

weather <- read_csv("http://594442.youcanlearnit.net/mexicanweather.csv")

# the date format is y-m-d, but here's how we create a column with just the year
weather$year <- year(weather$date)
weather$month <- month(weather$date)
weather$day <-day(weather$date)

#returns the day of the week for that date, in this case 1 for Sunday
wday("2018-04-01")
# return the day in the year, in this case the 91st day of the year
yday("2018-04-01")
#convert this to standard date format
mdy("04/01/18")
# if written in european format use dmy
dmy("04/01/2018")
