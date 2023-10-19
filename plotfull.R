Sys.setenv(TZ = "UTC")
min(tv.xts[,1], na.rm = TRUE);max(tv.xts[,2], na.rm = TRUE)
datelim.full <- c(ISOdate(2018,11,1, tz = "UTC"), ISOdate(2022,10,10, tz = "UTC"))

plot.fullgw <- function(gw, met, outfile = NULL, datelim, temp = TRUE, xaxs.default = TRUE) {
    require(xts)
    if(!is.null(outfile)) {
        pdf(outfile, width = 14)
    }
par(mar = c(3.1, 4.1, 0.6, 4.1))
plot.zoo(gw[,1],
         xaxs = "i", yaxs = "i",
         xaxt = "n",
         xlab = "", ylab = "GW [m]",
         xlim = datelim, ylim = c(-8.76, -2)
         )
lines(as.zoo(gw[,2]),
      col = 2)
    if(xaxs.default) {
        axis.POSIXct(1)
    } else {
        timeaxisdata <- as.POSIXct(paste0("20",16:22,"-01-01"))
        axis(1, at = timeaxisdata, label = FALSE)
        axis.POSIXct(1, at = timeaxisdata + 183 * 24 * 60 *60, format = "%Y", tck = 0)
    }
legend("bottomleft", legend = c("Oak", "Contr."), lwd = 1, col = 1:2)
par(new = TRUE)
plot.zoo(met[,3], type = "h", lend = 2,
         xaxs = "i", yaxs = "i",
         xaxt = "n", yaxt = "n",
         xlab = "", ylab = "",
         xlim = datelim, ylim = c(100,0),
         col = "blue"
         )
axis(4, at = c(0,10,20), col = "blue")
mtext("Prec. [mm/day]", 4, at = 10, col = "blue", line = 3)
if(temp) {
par(new = TRUE)
plot.zoo(met[,4],
         xaxs = "i", yaxs = "i",
         xaxt = "n", yaxt = "n",
         xlab = "", ylab = "",
         xlim = datelim, ylim = c(-50,50),
         col = "red"
         )
axis(4, at = c(-10,0,10,20), col = "red")
mtext("Temp. [deg. C]", 4, at = 10, col = "red", line = 3)
}
    if(!is.null(outfile)) {
        dev.off()
    }
}

plot.fullgw(gw = tv.xts, met = met.xts, datelim = datelim.full)
plot.fullgw(gw = tv.xts, met = met.xts, outfile = "Gwfull.pdf", datelim = datelim.full)

datelim.long <- c(ISOdate(2015,11,1, tz = "UTC"), ISOdate(2022,10,08, tz = "UTC"))
plot.fullgw(gw = tvlong.xts, met = tvlong.xts, outfile = "GwLongfull.pdf", datelim = datelim.long)

plot.fullgw(gw = tvlongfill.xts, met = tvlongfill.xts, outfile = "GwLongfullfill.pdf", datelim = datelim.long)

plot.fullgw(gw = tvlongfill.xts, met = tvlongfill.xts, outfile = "GwLongfullfill.pdf", datelim = datelim.long, xaxs.default = FALSE)
