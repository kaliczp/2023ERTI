Sys.setenv(TZ = "UTC")
min(tv.xts[,1], na.rm = TRUE);max(tv.xts[,2], na.rm = TRUE)
datelim <- c(ISOdate(2018,11,1, tz = "UTC"), ISOdate(2022,10,10, tz = "UTC"))

par(mar = c(3.1, 4.1, 0.6, 4.1))
plot.zoo(tv.xts[,1],
         xaxs = "i", yaxs = "i",
         xlab = "", ylab = "GW [m]",
         xlim = datelim, ylim = c(-8.76, -3)
         )
lines(as.zoo(tv.xts[,2]),
      col = 2)
par(new = TRUE)
plot.zoo(met.xts[,3], type = "h", lend = 2,
         xaxs = "i", yaxs = "i",
         xaxt = "n", yaxt = "n",
         xlab = "", ylab = "",
         xlim = datelim, ylim = c(100,0),
         col = "blue"
         )
axis(4, at = c(0,10,20), col = "blue")
par(new = TRUE)
plot.zoo(met.xts[,4],
         xaxs = "i", yaxs = "i",
         xaxt = "n", yaxt = "n",
         xlab = "", ylab = "",
         ylim = c(-50,50),
         col = "red"
         )
axis(4, at = c(-10,0,10,20), col = "red")
