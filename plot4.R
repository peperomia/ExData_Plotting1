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
#V3 variable is a factor variable. To change it to numerical, first I have to change it to 
#character(as.character) and then to numerical(as.numerical) because if I would change it 
#directly from factor to numerical that would distort the values of the variable. 
set$V3 <- as.character(set$V3)
str(set$V3)
set$V3 <- as.numeric(set$V3)
str(set$V3) # now values in set$V3 are correctly displayed, not changed
str(set$V7)
set$V7 <- as.character(set$V7)
str(set$V7)
set$V7 <- as.numeric(set$V7)
str(set$V7)
set$V8 <- as.character(set$V8)
str(set$V8)
set$V8 <- as.numeric(set$V8)
str(set$V8)
str(set$V9)
set$V9 <- as.character(set$V9)
str(set$V9)
set$V9 <- as.numeric(set$V9)
str(set$V9)
str(set$V5)
set$V5 <- as.character(set$V5)
str(set$V5)
set$V5 <- as.numeric(set$V5)
str(set$V4)
set$V4 <- as.character(set$V4)
str(set$V4)
set$V4 <- as.numeric(set$V4)
str(set$V4)
png('plot4.png',480, 480)
par(mfcol = c(2,2))
#PLOT 1 TOPLEFT
plot( set$V3,  type ='l', xaxt = 'n', xlab = '', ylab = 'Global Active Power (kilowatts)')
axis(side = 1, at = seq(0,2880,by = 1440), labels = c('Thu', 'Fri', 'Sat'))
#PLOT 2 BOTTOMLEFT
plot(set$V7, type = 'l', xaxt = 'n', xlab = '', ylab = 'Energy sub metering')
axis(side = 1, at = seq(0,2880,by = 1440), labels = c('Thu', 'Fri', 'Sat'))
lines(set$V8, col = 'red')
lines(set$V9, col = 'blue')
legend('topright',  c('Sub_metering_1','Sub_metering_2', 'Sub_metering_3'), lty=c(1,1,1), col = c('black', 'red', 'blue'), bty = 'n')
#PLOT 3 TOPRIGHT
plot(set$DateTime, set$V5, type = 'l', xlab = 'datetime', ylab = 'Voltage')
#PLOT 4 BOTTOMRIGHT
plot(set$DateTime, set$V4, type = 'l', xlab = 'datetime', ylab = 'Global_reactive_power')
dev.off()
