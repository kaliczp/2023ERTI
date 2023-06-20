## Import additional data
library(readxl)
kieg <- as.data.frame(read_excel("2020-as adatsor.xlsx"))
names(kieg) <- c("Date", "Oak", "Controll")
## Convert to xts
library(xts)
kieg.xts <- xts(kieg[,-1], kieg[,1])

## Two gaps
plot.zoo(kieg.xts['2020-01/2020-04',1])
lines(as.zoo(tv.xts)[,1], col = 3)
