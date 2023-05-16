Sys.setenv(TZ = "UTC")
min(tv.xts[,1], na.rm = TRUE);max(tv.xts[,2], na.rm = TRUE)
datelim <- c(ISOdate(2018,11,1, tz = "UTC"), ISOdate(2022,10,10, tz = "UTC"))

plot.zoo(tv.xts[,1],
         xaxs = "i", yaxs = "i",
         xlab = "", ylab = names(tv.xts[1]),
         xlim = datelim, ylim = c(-8.76, -6.16)
         )
lines(as.zoo(tv.xts[,2]),
      col = 2)

plot.zoo(met.xts[,3], type = "h",
         xaxs = "i", yaxs = "i",
         xlim = datelim, ylim = c(100,0),
         col = "blue"
         )
par(new = TRUE)
plot.zoo(met.xts[,4],
         xaxs = "i", yaxs = "i",
         ylim = c(-50,50),
         col = "red"
         )
