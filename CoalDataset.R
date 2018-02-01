# Coal Data Set Case Study :)

library(tidyverse)

coal <- read_csv('http://594442.youcanlearnit.net/coal.csv', skip=2)
glimpse(coal)

# setting the first vector in our dataset to have a new column header
colnames(coal)[1] <- 'region'
summary(coal)

coal_long <- gather(coal, 'year', 'coal_consumption', -region)

coal_long$year <- as.integer(coal_long$year)
summary(coal_long)

#for decimals you use numeric
coal_long$coal_consumption <- as.numeric(coal_long$coal_consumption)

#countries and continents are both in the regions column, so we should segment those
unique(coal_long$region)

noncountries <- c("North America", "Central & South America", "Antarctica", "Europe", "Eurasia",
                  "Middle East", "Africa", "Asia & Oceania", "World")

#calling match function with where we want it to search and the values we want our 
# function to search for
match(coal_long$region, noncountries)

#shows the non country values as TRUE and rest as FALSE
!is.na(match(coal_long$region, noncountries))

matches <- which(!is.na(match(coal_long$region, noncountries)))

coal_country <- coal_long[-matches,]
coal_region <- coal_long[matches,]

unique(coal_country$region)
unique(coal_region$region)

planet <- c("World")
#which means where TRUE!
matchworld<- which(!is.na(match(coal_region$region, planet)))
unique(matchworld)
coal_continent <- coal_region[-matchworld,]
coal_planet <- coal_region[matchworld,]
unique(coal_planet$region)


ggplot(data=coal_region, mapping=aes(x=year, y=coal_consumption)) +
  geom_line(mapping=aes(color=region))
