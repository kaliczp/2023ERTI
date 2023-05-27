library(xts)
met.xts <- xts(met.nona[,3:6],met.nona[,1])
tv.xts <- xts(tv.nona[,3:4],tv.nona[,1])
