plot.zoo(tv.xts[,1],
         xaxs = "i", ylab = names(tv.xts[1])
         )
lines(as.zoo(tv.xts[,2]),
      col = 2)
