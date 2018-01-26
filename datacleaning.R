#detecting and removing outliers
library(tidyverse)

# Read in the Medicare payments dataset
names <- c("DRG", "ProviderID", "Name", "Address", "City", "State", "ZIP", "Region",
           "Discharges", "AverageChargesCovered", "AverageTotalPayments", "AverageMedicarePayments")
types = "ccccccccinnn"
inpatient <- read_tsv("http://594442.youcanlearnit.net/inpatient.tsv", col_names = names, skip=1, col_types = types)

#creating a histogram and using the values found in average charges
ggplot(data=inpatient) + 
  geom_histogram(mapping=aes(x=AverageChargesCovered))

#creating histogram but zooming in on the outliers
ggplot(data=inpatient) +
  geom_histogram(mapping=aes(x=AverageChargesCovered)) +
  coord_cartesian(ylim=c(0,25))

# now building a boxplot
ggplot(data=inpatient) +
  geom_boxplot(mapping=aes(State, AverageChargesCovered))

#creating new tibble that is inpatient filtered
# just the cases where the average charges are especially high
highCharges <- filter(inpatient, AverageChargesCovered > 500000)

#DRG is the variable for the type of procedure. There are hundreds
# different procedures, but this will let us see which procedures are
# in that high charge category
unique(highCharges$DRG)

#look at the high charge data visually
ggplot(data=highCharges) +
  geom_point(mapping=aes(DRG,AverageChargesCovered)) +
  theme(axis.text.x=element_text(angle=90, vjust=1, hjust=1))


# Dealing With Missing Values!
# R labels this as NA

names <- c("ID", "DBAName", "AKAName", "License", "FacilityType", "Risk", "Address",
           "City", "State", "ZIP", "InspectionDate", "InspectionType", "Results",
           "Violations", "Latitude", "Longitude", "Location")
inspections <-read_csv('http://594442.youcanlearnit.net/inspections.csv',
                       col_names=names, skip=1)

# Look at a summary of the data
summary(inspections)

#grabbing all the items where the license is N/A so we can take a look
nolicense <- which(is.na(inspections$License))
inspections[nolicense,]

#Let's put the 14 N/A records into a seperate tibble for analysis
unlicensed <- inspections[nolicense,]
# create the license vector and asking R to cinlude all rows except the no license ones
licensed <- inspections[-nolicense,]


#Working With Special Numbers!
badmath <- c(1,2,3,4/0,0/0, NA)
badmath

#notice you'll get false for hte numbers but true for the NAN and NA example
# run the others and see what you get
is.na(badmath)
is.nan(badmath)
is.finite(badmath)


#HOW TO BREAK APART COLUMNS INTO SEPERATE PARTS