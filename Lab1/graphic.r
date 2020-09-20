AEP_hourly <- read.csv("C:/Statistics_Labs/Lab1/AEP_hourly.csv")
hist_and_norm <- function(data){
  hist_min <- mean(data) - 4*sd(data)
  hist_max <- mean(data) + 4*sd(data)
  normalx <- seq(hist_min, hist_max, by = 1)
  normaly <- dnorm(normalx, mean = mean(data), sd = sd(data))
  hist(data, 
       main = "Histogram of Power Output in AEP",
       xlab = "Power, MW",
       xlim = c(hist_min, hist_max),
       ylim =c(0, max(normaly)),
       breaks = nclass.Sturges(data),
       freq = FALSE)
  lines(normalx, normaly, col = "red", lwd="2")
  lines(density(AEP_hourly$AEP_MW), col="green", lwd="2")
  abline(v=quantile(AEP_Data$AEP_MW, c(0.25, 0.75)), col="blue", lwd="2")
  abline(v=range(AEP_Data$AEP_MW), col="grey", lwd="2")
}

hist_and_norm(AEP_hourly$AEP_MW)

