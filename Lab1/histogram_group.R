library(tidyverse)
require(MASS)
AEP_Data <- read.csv("C:/Statistics_Labs/Lab1/AEP_hourly.csv")


buildByGroup<-function(energyData, breaksCount){
  hist_min <- mean(energyData) - 3*sd(energyData)
  hist_max <- mean(energyData) + 3.5*sd(energyData)
  normalx <- seq(hist_min, hist_max, by = 1)
  normaly <- dnorm(normalx, mean = mean(energyData), sd = sd(energyData))
  hist(energyData, 
       main = "Histogram of Power Output in AEP",
       xlab = "Power, MW",
       xlim = c(hist_min, hist_max),
       ylim =c(0, max(normaly)),
       breaks = breaksCount,
       freq = FALSE)
  lines(density(energyData), col = "green", lwd="2")
  lines(normalx, normaly, col = "red", lwd="2")
}

buildFreq<-function(binsCount){
  ggplot(AEP_Data,aes(x=AEP_MW))+
    geom_histogram(bins=binsCount, color="white",
        aes(fill=..count..))+
    scale_x_continuous("Power, MW")+
    scale_y_continuous("Frequency")+
    scale_fill_gradient("Count", low="green", high="red")+
    labs(title = "Power Output in AEP")
}

# Sturges(Base) Rule
k=nclass.Sturges(AEP_Data$AEP_MW)
# Freedman-Diaconis Rule
fd=nclass.FD(AEP_Data$AEP_MW)
# Scott Rule
s=nclass.scott(AEP_Data$AEP_MW)

buildByGroup(AEP_Data$AEP_MW, s)
buildFreq(fd)


# hist.scott(AEP_Data$AEP_MW)
# hist.FD(AEP_Data$AEP_MW)
