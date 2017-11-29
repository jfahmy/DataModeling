#Opens the tab delimited text file of records pulled from kb database
#data frame is created
getwd()
df <- read.csv("testaa",
               header = TRUE,
               sep = "\t",
               fill = TRUE,
               # If you don't add this then R will try to guess what kind of classes you want. 
               # Originally I imported without this and R made some things factors, logical etc. 
               # Which was blocking me on cleaning up data because I'm a Rookie. stringAsFactors fixed it.
               stringsAsFactors=FALSE)

#specifies to remove columns at these indexes. This leaves us with just 19 variables in our new data frame
df <- df[ -c(2:8, 10:12, 15, 18, 20, 22, 29, 32:38, 40:42, 44:46, 48:49) ]

# Transforming the columns one by one. 
df$oclcnum[is.na(df$oclcnum)]<- "match_absent"
df$oclcnums <- replace(df$oclcnums, df$oclcnums != "", "oclcnums_present")
df$oclcnums <- replace(df$oclcnums, df$oclcnums == "", "oclcnums_absent")
df$issn <- replace(df$issn, df$issn != "NULL", "issn_present")
df$issn <- replace(df$issn, df$issn == "NULL", "issn_absent")
df$eissn <- replace(df$eissn, df$eissn != "NULL", "eissn_present")
df$eissn <- replace(df$eissn, df$eissn == "NULL", "eissn_absent")
df$isbn <- replace(df$isbn, df$isbn != "NULL", "isbn_present")
df$isbn <- replace(df$isbn, df$isbn == "NULL", "isbn_absent")
df$title <- replace(df$title, df$title != "", "title_present")
df$title <- replace(df$title, df$title == "", "title_absent")
df$publisher <- replace(df$publisher, df$publisher != "", "publisher_present")
df$publisher <- replace(df$publisher, df$publisher == "", "publisher_absent")
df$url <- replace(df$url, df$url != "", "URL_present")
df$url <- replace(df$url, df$url == "", "URL_absent")
df$author <- replace(df$author, df$author != "", "author_present")
df$author <- replace(df$author, df$author == "", "author_absent")
df$jkey <- replace(df$jkey, df$jkey != "", "jkey_present")
df$jkey <- replace(df$jkey, df$jkey == "", "jkey_absent")
df$bkey <- replace(df$bkey, df$bkey != "", "bkey_present")
df$bkey <- replace(df$bkey, df$bkey == "", "bkey_absent")
df$pubtype[is.na(df$pubtype)]<- "pubtype_absent"
df$pubtype <- replace(df$pubtybe, df$pubtype != "pubtype_present", "pubtype_present")
#This is grepping to see if anything in the coverage column contains "@"
# Then changing the value based on that. If it contains @ then it has a publishing date listed
df$coverage[grepl("@", df$coverage)] <- "date_present"
df$coverage <- replace(df$coverage, df$coverage != "date_present", "date_absent")
df$openaccess <- replace(df$openaccess, df$openaccess == "yes", "OpenAccess!")
df$openaccess <- replace(df$openaccess, df$openacces == "no", "Not_OpenAccess")
df$holdings_regid <- replace(df$holdings_regid, df$holdings_regid == "6569", "holdings_absent")
df$holdings_regid <- replace(df$holdings_regid, df$holdings_regid != "holdings_absent", "holdings_present")
df$isbns <- replace(df$isbns, df$isbns != "NULL", "isbns_present")
df$isbns <- replace(df$isbns, df$isbns == "NULL", "isbns_absent")


#Creates file and write my dataframe to the csv
write.csv(df, "unmatched_clean.csv")
