library(e1071)
generalDesc = function(energyData)list(
  # Centre values:
  sum=summary(energyData),
  
  # Variation values:
  ###
  # Standard deviation:
  standDev=sd(energyData),
  
  # Disperse of a random variable:
  disp=var(energyData),
  
  # Variation coefficient:
  varCoef=sd(energyData)/mean(energyData)*100,
  
  # Variation range:
  ran=range(energyData),
  
  # Quantile:
  quant=quantile(energyData),
  
  # IQR:
  iqr=IQR(energyData),
  
  # First and Ninth Decile:
  fn_decile=quantile(energyData, prob = c(0.1, 0.9)),
  
  # Estimate skewness:
  skew=skewness(energyData),
  
  # Excess kurtosis
  kurt=kurtosis(energyData)
  
)

generalDesc(AEP_hourly$AEP_MW)
