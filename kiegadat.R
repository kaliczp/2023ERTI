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

## Height difference gap1
tail(tv.xts['2020-01-28'])
kieg.xts['2020-01-28 18:14:59',1]
head(tv.xts['2020-02-14',1])
kieg.xts['2020-02-14 08:59:59',1]
plot.zoo(kieg.xts['2020-01-28/2020-02-15',1]+0.040439)
lines(as.zoo(tv.xts)[,1], col = 3)
gap1.xts <- kieg.xts['2020-01-28 18:29:59/2020-02-14 08:44:59']
gap1.xts[,1] <- gap1.xts[,1] + 0.040439
tv.xts <- c(tv.xts, gap1.xts)

## Height difference gap2
tail(tv.xts['2020-03-02'])
kieg.xts['2020-03-02 01:44:59',1]
head(tv.xts['2020-03-20',1])
kieg.xts['2020-03-20 18:59:59',1]
plot.zoo(kieg.xts['2020-03-02/2020-03-20',1]+0.047)
lines(as.zoo(tv.xts)[,1], col = 3)
gap2.xts <- kieg.xts['2020-03-02 01:59:59/2020-03-20 18:44:59']
gap2.xts[,1] <- gap2.xts[,1] + 0.047
tv.xts <- c(tv.xts, gap2.xts)
