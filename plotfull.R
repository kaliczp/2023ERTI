min(tv.xts[,1], na.rm = TRUE);max(tv.xts[,2], na.rm = TRUE)

plot.zoo(tv.xts[,1],
         xaxs = "i", yaxs = "i",
         xlab = "", ylab = names(tv.xts[1]),
         ylim = c(-8.76, -6.16)
         )
lines(as.zoo(tv.xts[,2]),
      col = 2)
