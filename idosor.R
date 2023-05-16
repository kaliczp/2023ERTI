library(xts)
met.xts <- xts(met.raw[,3:6],met.raw[,1])
tv.xts <- xts(tv.raw[,3:4],tv.raw[,1])
