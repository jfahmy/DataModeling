#loading tidyverse library
library(tidyverse)

#reading csv file from URL
inspections <- read_csv('http://594442.youcanlearnit.net/inspections.csv')

# display the contents of the tibble
glimpse(inspections)

#load a help page for read_csv
?read_csv

#creating a vector of column names
names <- c("ID", "DBAName", "AKAName", "License", "FacilityType", "Risk", "Address",
           "City", "State", "ZIP", "InspectionDate", "InspectionType", "Results",
           "Violations", "Latitude", "Longitude", "Location")

# adding our column names and skipping the first row of data (old column headers) in the csv
inspections <- read_csv('http://594442.youcanlearnit.net/inspections.csv',
                        col_names = names, skip=1)

glimpse(inspections)

# now importanting TSV files!!!! tab seperated value files
inpatient <- read_tsv('http://594442.youcanlearnit.net/inpatient.tsv')
glimpse(inpatient)

names2 <- c("DRGDefinition", "ProviderID", "Name", "Address", 
            "City", "State", "ZIP", "Region", "Discharges",
            "AverageCharges", "AverageTotalPayments", "AverageMedicarePayments")

inpatient <- read_tsv('http://594442.youcanlearnit.net/inpatient.tsv', col_names = names2,
                      skip=1)
glimpse(inpatient)

#defining data types - we want the first 8 variables to be character types, but for 
# the discharges field to be an integer. then the last three variables will be 
# generic numeric data type
types <- 'ccccccccinnn'

inpatient <- read_tsv('http://594442.youcanlearnit.net/inpatient.tsv', col_names = names2,
                      skip=1, col_types = types)
glimpse(inpatient)

# Now importing delimited files!!!
?read_delim

# you can also use this to read csv and tsv files, as long as you set the right delimeter!
deaths <- read_delim(file='http://594442.youcanlearnit.net/drugdeaths.txt', delim='^')

#Now importing fixed-width files!!!
?read_fwf

names3 <- c("Name", "Title", "Department", "Salary")
lengths <- c(32, 50, 24, NA)

widths <- fwf_widths(lengths, names3)

employees <- read_fwf('http://594442.youcanlearnit.net/chicagoemployees.txt', widths, skip=1)
glimpse(employees)


#IMPORTING FUNNY FORMATTED DATA FROM EXCEL
library(readxl)

#need to have the file downloaded and in your working directory, then you can load to a tibble
breakfast <- read_excel('breakfast.xls', skip=3)
glimpse(breakfast)

names4 <- c("Year", "FreeStudents", "ReducedStudents", "PaidStudents", "TotalStudents",
           "MealsServed", "PercentFree")

breakfast <- read_excel('breakfast.xls', skip=5, col_names=names4)
glimpse(breakfast)

# Some of the numeric values of this file are meant to represent millions, so we need to
# mutliply this set of values so we have the accurate number
breakfast$FreeStudents = breakfast$FreeStudents * 10000000
breakfast$ReducedStudents = breakfast$ReducedStudents * 10000000
breakfast$PaidStudents = breakfast$PaidStudents * 10000000
breakfast$TotalStudents = breakfast$TotalStudents * 10000000
breakfast$MealsServed = breakfast$MealsServed * 10000000
glimpse(breakfast)

# We can express the percentage differently, with a decimal in front of the percent
breakfast$PercentFree = breakfast$PercentFree / 100
glimpse(breakfast)
