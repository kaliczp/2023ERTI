library(xts)
met.xts <- xts(met.nona[,3:6],met.nona[,1])
tv.xts <- xts(tv.nona[,3:4],tv.nona[,1])

tvlong.xts <- xts(tvlong.raw[,3:6], tvlong.raw[,1, drop = TRUE])

tvlongfill.xts <- xts(tvlongfill.raw[1:2535,3:6], tvlongfill.raw[1:2535,1, drop = TRUE])
tvlongfill.raw[2534:2538,1, drop = TRUE] # problem with length
