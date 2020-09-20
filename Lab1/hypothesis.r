library(nortest)
library(fBasics)
AEP_Data <- read.csv("C:/Statistics_Labs/Lab1/AEP_hourly.csv")

normalTest(AEP_Data$AEP_MW, method="sw")

