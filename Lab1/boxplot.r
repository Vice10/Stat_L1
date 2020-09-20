library(lubridate)
AEP_Data <- read.csv("C:/Statistics_Labs/Lab1/AEP_hourly.csv")
d2_date = as.POSIXct(AEP_Data$Datetime , format = "%Y-%m-%d %H:%M:%S ")
AEP_Data$DATE = d2_date
head(AEP_Data)

month = lubridate::month(AEP_Data$DATE)
AEP_Data$Month = month

plot(AEP_Data$AEP_MW, month)

boxplot(AEP_Data$AEP_MW~Month, data=AEP_Data,
        main="Power Output per Month",
        ylab="Power, MW",
        col="orange",
        border="brown")
abline(h=quantile(AEP_Data$AEP_MW, c(0.25, 0.75)), col="red")
abline(h=range(AEP_Data$AEP_MW), col="brown")

boxplot(AEP_Data$AEP_MW,
        main="Power Output of AEP facilities",
        ylab="Power",
        xlab="MW",
        col = "orange",
        border = "brown",
        horizontal = TRUE,
        notch = FALSE)

