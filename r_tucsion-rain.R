remove(list = ls()) #clear the environment
getwd() #check wd
setwd("C:/Users/VIP Lab/Downloads") #change wd to tucson_rain csv location

rain = read.csv(file = 'tucson_rain.csv') # read in file
head(rain) # inspect top portion of dataset

cols=c("gaugeId", "readingDate","rainAmount","quality") #defining relevant variables

rain_good = rain[which(rain$quality=='Good'), cols]

# ncol = dim(rain)[2] # number of observations

# nrow = dim(rain)[1] # number of variables in 'rain'

rain_good_19 <- rain_good[grep("2019", rain_good$readingDate), cols]
head(rain_sub_19)

# rain_sub_19$Date <- as.Date(rain_sub_19$readingDate)
# # aggregate(rain_sub_19$rainAmount, ,which(rain_sub_19$quality=='Good',), sum)

rain_good_20 <- rain_good[grep("2020", rain_good$readingDate), cols]
head(rain_sub_20)

# rain_19_20 <- rain[grep("2019|2020", rain$readingDate), cols]
# head(rain_19_20)

# test = sum(rain_sub_19[which(rain_sub_19$quality=='Good'), 3])
# print(test)

# for (i in nrow)
#   if rain_sub(i,4) == "Good"

# print(typeof(rain$readingDate[1])) 


library(lubridate)
bymonth19_good <- aggregate(rainAmount~month(readingDate),
                     data=rain_good_19,FUN=sum)

bymonth20_good <- aggregate(rainAmount~month(readingDate),
                      data=rain_good_20,FUN=sum)
bymonth19_good
bymonth20_good