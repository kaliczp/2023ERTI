min(tv.xts[,1], na.rm = TRUE);max(tv.xts[,2], na.rm = TRUE)

plot.zoo(tv.xts[,1],
         xaxs = "i", yaxs = "i",
         xlab = "", ylab = names(tv.xts[1]),
         ylim = c(-8.76, -6.16)
         )
lines(as.zoo(tv.xts[,2]),
      col = 2)

plot.zoo(met.xts[,3], type = "h",
         xaxs = "i", yaxs = "i",
         ylim = c(100,0),
         col = "blue"
         )
par(new = TRUE)
plot.zoo(met.xts[,4],
         xaxs = "i", yaxs = "i",
         ylim = c(-50,50),
         col = "red"
         )
