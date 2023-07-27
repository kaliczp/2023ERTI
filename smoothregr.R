plot.recharge(x = tv.xts[,1], recharge.xts['2018-11-01/2019-05-01'])
plot.recharge(x = tv.xts[,1], recharge.xts['2019-11-01/2020-05-01'])
plot.recharge(x = tv.xts[,1], recharge.xts['2020-11-01/2021-05-01'])
plot.recharge(x = tv.xts[,1], recharge.xts['2021-11-01/2022-05-01'])

plot.recharge(x = tv.xts[,1], recharge.xts['2018-11-01/2018-12-01'])
plot.recharge(x = tv.xts[,1], recharge.xts['2018-12-01/2019-05-01'])
plot.recharge(x = tv.xts[,1], recharge.xts['2019-11-01/2019-11-20'])
plot.recharge(x = tv.xts[,1], recharge.xts['2019-12-01/2020-01-01'])
plot.recharge(x = tv.xts[,1], recharge.xts['2020-01-01/2020-05-01'])
plot.recharge(x = tv.xts[,1], recharge.xts['2020-11-01/2021-05-01'])
plot.recharge(x = tv.xts[,1], recharge.xts['2021-11-01/2021-12-31'])
plot.recharge(x = tv.xts[,1], recharge.xts['2022-01-01/2022-05-01'])

## 3.25 hours
sim3hr.xts <- simit(tv.xts[,1], wwidth = 13, na.rm = TRUE)
sim3hr.xts <- sim3hr.xts['2018-10-31/2022-09-30']
## 6.25 hours
sim6hr.xts <- simit(tv.xts[,1], wwidth = 25, na.rm = TRUE)
sim6hr.xts <- sim6hr.xts['2018-10-31/2022-09-30']
## 1 day
sim1day.xts <- simit(tv.xts[,1], wwidth = 97, na.rm = TRUE)
sim1day.xts <- sim1day.xts['2018-10-31/2022-09-30']
## 3 days
sim3day.xts <- simit(tv.xts[,1], wwidth = 289, na.rm = TRUE)
sim3day.xts <- sim3day.xts['2018-10-31/2022-09-30']
## 7 days
sim7day.xts <- simit(tv.xts[,1], wwidth = 673, na.rm = TRUE)
sim7day.xts <- sim7day.xts['2018-10-31/2022-09-30']
## 10 days
sim10day.xts <- simit(tv.xts[,1], wwidth = 961, na.rm = TRUE)
sim10day.xts <- sim10day.xts['2018-10-31/2022-09-30']
sim10day.xts <- c(sim7day.xts['2018-10-31'],sim10day.xts)
## 14 days
sim14day.xts <- simit(tv.xts[,1], wwidth = 1344, na.rm = TRUE)
sim14day.xts <- c(sim10day.xts['2018-10-31/2018-11-02 23:40'],sim14day.xts)

recharge <- data.frame(s3hr = white.lmxts(x = sim3hr.xts, at = interv.day))
recharge$s6hr <- white.lmxts(x = sim6hr.xts, at = interv.day)
recharge$s1day <- white.lmxts(x = sim1day.xts, at = interv.day)
recharge$s3day <- white.lmxts(x = sim3day.xts, at = interv.day)
recharge$s7day <- white.lmxts(x = sim7day.xts, at = interv.day)
recharge$s10day <- white.lmxts(x = sim10day.xts, at = interv.day)
recharge$s14day <- white.lmxts(x = sim14day.xts, at = interv.day)
recharge.xts <- xts(recharge, interv.day)

pdf(width = 35)

png(width = 2400)
## img2pdf --output out.pdf *png # in shell
for(tti in 1:length(interv.day)) {
    longfrom.to <- paste(interv.day[tti]-5,interv.day[tti]+6, sep = "/")
    longterm.xts <- tv.xts[longfrom.to,1]
    long.rang <- range(longterm.xts)
    long.rang[1] <- trunc(long.rang[1]*10)/10 - 0.1
    long.rang[2] <- long.rang[1] + 0.2
    from.to <- paste(interv.day[tti]-1,interv.day[tti]+1, sep = "/")
    par(fig = c(0,0.25,0,1))
    plot.recharge(sim3hr.xts[from.to], recharge.xts[from.to,1], xaxs = "i", main = from.to, xaxs = "i", xlab ="", col = "magenta", ylab = "GW")
    lines(as.zoo(tv.xts[,1]))
    lines(as.zoo(sim6hr.xts), col = "red")
    lines(as.zoo(sim1day.xts), col = "green")
    lines(as.zoo(sim3day.xts), col = "blue")
    lines(as.zoo(sim7day.xts), col = "darkred")
    lines(as.zoo(sim10day.xts), col = "darkgreen")
    lines(as.zoo(sim14day.xts), col = "darkblue")
    par(fig = c(0.25,0.5,0,1), new = TRUE)
    plot.recharge(sim3hr.xts[from.to,1], recharge.xts[from.to,1], xaxs = "i", main = from.to, xaxs = "i", ylim = long.rang, xlab = "", col = "magenta", ylab = "GW")
    lines(as.zoo(tv.xts[,1]))
    lines(as.zoo(sim6hr.xts), col = "red")
    lines(as.zoo(sim1day.xts), col = "green")
    lines(as.zoo(sim3day.xts), col = "blue")
    lines(as.zoo(sim7day.xts), col = "darkred")
    lines(as.zoo(sim10day.xts), col = "darkgreen")
    lines(as.zoo(sim14day.xts), col = "darkblue")
    axis(1, at = as.POSIXct(c(interv.day[tti],interv.day[tti]+1)), tck = 1, col = "lightgray", lab = FALSE)
    par(fig = c(0.5,1,0,1), new = TRUE)
    plot.zoo(longterm.xts, xaxs = "i", main = longfrom.to, xaxs = "i", ylim = long.rang, xlab = "", ylab = "GW")
    lines(as.zoo(sim3hr.xts), col = "magenta")
    lines(as.zoo(sim6hr.xts), col = "red")
    lines(as.zoo(sim1day.xts), col = "green")
    lines(as.zoo(sim3day.xts), col = "blue")
    lines(as.zoo(sim7day.xts), col = "darkred")
    lines(as.zoo(sim10day.xts), col = "darkgreen")
    lines(as.zoo(sim14day.xts), col = "darkblue")
    lines(as.zoo(simitott), col = "magenta")
    axis(1, at = as.POSIXct(c(interv.day[tti],interv.day[tti]+1)), tck = 1, col = "lightgray", lab = FALSE)
}
dev.off()
