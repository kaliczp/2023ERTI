library(xts)
met.xts <- xts(met.nona[,3:6],met.nona[,1])
tv.xts <- xts(tv.nona[,3:4],tv.nona[,1])

tvlong.xts <- xts(tvlong.raw[,3:6], tvlong.raw[,1, drop = TRUE])

tvlongfill.xts <- xts(tvlongfill.raw[1:2535,3:6], tvlongfill.raw[1:2535,1, drop = TRUE])
tvlongfill.raw[2534:2538,1, drop = TRUE] # problem with length

## Fill 2020 oak gaps
tvlongfill.xts['2020-01-28/2020-02-13',1] <- coredata(apply.daily(gap1.xts['/2020-02-13'], mean)[,1])
tvlongfill.xts['2020-03-02/2020-03-19',1] <- coredata(apply.daily(gap2.xts['/2020-03-19'], mean)[,1])
