## Import additional data
library(readxl)
kieg <- as.data.frame(read_excel("2020-as adatsor.xlsx"))
## Convert to xts
library(xts)
kieg.xts <- xts(kieg[,-1], kieg[,1])
