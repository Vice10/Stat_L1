AEP_hourly <- read.csv("C:/Statistics_Labs/Lab1/AEP_hourly.csv")
summary(AEP_hourly$AEP_MW)

hist(AEP_hourly$AEP_MW,
        main = "Histogram for Power Production in AEP",
        xlab = "Energy, MW",
        border = "blue",
        col = "orange",
        las = 1,
        breaks = 1000,
        prob = TRUE)
lines(density(AEP_hourly$AEP_MW), col="green", lwd="1")

distModel<-dnorm(AEP_hourly$AEP_MW, mean = mean(AEP_hourly$AEP_MW), sd = sd(AEP_hourly$AEP_MW))
plot(AEP_hourly$AEP_MW, distModel, type="p", main = "Normal Distribution", col="blue")
