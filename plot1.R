library(dplyr)
household_power_consumption <- read.table("~/household_power_consumption.txt", sep=";", quote="\"")
electricity <- tbl_df(household_power_consumption)
dim(electricity)
names(electricity)
#names(electricity) doesn't yield right results, so I tried with the first row. This is where the
# names of the variables are stored
electricity[1,] 
#we need to combine variable Date and variable Time into one single variable to be able to work 
#on it further
DateTime <- paste(electricity$V1, electricity$V2)
DateTime[1]
#now we have to turn a character class into a special class POSIXct responsible for representing date 
#and time
dim(electricity)
levels(electricity$weekday)
library(dplyr)
household_power_consumption <- read.table("~/household_power_consumption.txt", sep=";", quote="\"")
electricity <- tbl_df(household_power_consumption)
dim(electricity)
names(electricity)
#names(electricity) doesn't yield right results, so I tried with the first row. This is where the
# names of the variables are stored
electricity[1,] 
#we need to combine variable Date and variable Time into one single variable to be able to work 
#on it further
DateTime <- paste(electricity$V1, electricity$V2)
DateTime[1]
dim(electricity)

#now we have to turn a character class into a special class POSIXct responsible for representing date 
#and time
library(lubridata)
ConvDT <- dmy_hms(DateTime)
ConvDT[1]
str(ConvDT)
#now to create new variable called "ConvDT" and at the same time assign to it values of the vector
# "DaTm" that containes dates with times.
electricity$DateTime <- ConvDT
dim(electricity)
names(electricity)
DateConv<-as.Date(strptime(electricity$V1, "%d/%m/%Y")) 
str(DateConv)
electricity$DateConv <- DateConv
#next line is to find out what is the day of the week for each row. "%a" produces names of the days
#of the week, but it produces them in current locale. For that reason I will turn vector a from 
#character vector to factor - it will make it easier to translate days of the week 
a <- format(DateConv, "%a")
class(a)
a <- as.factor(a)
levels(electricity$weekday)
electricity$weekday <- a
wd <-  c("Thu", "Sun", "Fri", "Mon", "Wed", "Sat", "Tue")
levels(electricity$weekday) <- wd
dim(electricity)
names(electricity)
electricity
set <- subset(electricity, electricity$DateConv == "2007-02-01" | electricity$DateConv == "2007-02-02")
str(set$V3)
set$V3 <- as.character(set$V3)
str(set$V3)
set$V3 <- as.numeric(set$V3)
str(set$V3) # now values in set$V3 are correctly displayed, not changed
hist(set$V3, col = 'red', ylab = 'Frequency', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')
library(lubridata)
ConvDT <- dmy_hms(DateTime)
ConvDT[1]
str(ConvDT)
electricity$DateTime <- ConvDT
dim(electricity)
names(electricity)
DateConv<-as.Date(strptime(electricity$V1, "%d/%m/%Y")) 
str(DateConv)
electricity$DateConv <- DateConv
a <- format(DateConv, "%a")
class(a)
a <- as.factor(a)
electricity$weekday <- a
dim(electricity)
electricity
set <- subset(electricity, electricity$DateConv == "2007-02-01" | electricity$DateConv == "2007-02-02")
str(set$V3)
set$V3 <- as.character(set$V3)
str(set$V3)
set$V3 <- as.numeric(set$V3)
str(set$V3) # now values in set$V3 are correctly displayed, not changed
png('plot1.png',480, 480)
hist(set$V3, col = 'red', ylab = 'Frequency', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')
dev.off()
