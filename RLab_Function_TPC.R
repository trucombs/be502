

remove(list = ls()) #clear the environment
getwd() #check wd
setwd("/Users/combs/Downloads") #change wd to tucson_rain csv location

rain = read.csv(file = 'tucson_rain.csv') # read in file
head(rain) # inspect top portion of dataset

cols=c("gaugeId", "readingDate","rainAmount","quality") #defining relevant variables

#Function: Quality Precipitation by Year and Month (QPYM)
qpym_function <- function(data, quality, per1, per2) {
  data_quality <- data[data$quality==quality, cols]
  quality_per1 <- data_quality[grep(per1, as.Date(data_quality$readingDate)), cols]
  quality_per2 <- data_quality[grep(per2, as.Date(data_quality$readingDate)), cols]
  print(typeof(quality_per2))
  #boxplot(quality_per1~per1)
  sum_per1 <- sum(quality_per1$rainAmount)
  sum_per2 <- sum(quality_per2$rainAmount)
  cat("Total rainfall of", quality, "quality for", per1, "and", per2, ", respectively:", sum_per1, "&", sum_per2)
  #return(sum_YYYYMM)
}

test = qpym_function(data = rain, quality = "Good", per1 = "2020-09", per2 = "2020-10")
