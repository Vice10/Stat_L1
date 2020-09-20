library(ggpubr)
library(lubridate)
library(tidyverse)
library(qqplotr)
AEP_Data <- read.csv("C:/Statistics_Labs/Lab1/AEP_hourly.csv")

ggqqplot(AEP_Data, x="AEP_MW", color = "red", ggtheme = theme_pubclean())

buildPPplot<-function(){
  m <- mean(AEP_Data$AEP_MW)
  s <- sd(AEP_Data$AEP_MW)
  dp <- list(mean = m, sd = s)
  gg <- ggplot(data = AEP_Data, mapping = aes(sample = AEP_MW)) +
    stat_pp_band(distribution = "norm", dparams = dp) +
    qqplotr::stat_pp_line() +
    stat_pp_point(dparams = dp) +
    labs(x = "Probability Points", y = "Cumulative Probability")
  gg
}

buildPPplot()