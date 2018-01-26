#How to make wide data sets long using the gather function:
# It takes the name of the tibble, the name you want to use for the key
#column in the long data set, the name you would like to use for the value
# column in the long data set, and a list of columns from the wide datset
# you want to include or exclude.

#loading tidyverse
library(tidyverse)

#loading test dataset
pew <- read_csv("http://594442.youcanlearnit.net/pew.csv")

pew

#gather function
pew.long <- gather(pew, income, frequency, -religion)
# instead of listing the 10 columns we want to include, we use
# "-religion" here to grab every column accept the religion column

#show new tibble
pew.long


# now to review the opposite - how to make long data sets wide
# thought long data sets are better to work with in R, they're not always
# as human readable

weather <- read_csv("http://594442.youcanlearnit.net/mexicanweather.csv")

?spread
#using spread function
weather.long <- spread(weather, element, value)
