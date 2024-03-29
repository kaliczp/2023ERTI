white.lmxts <- function(x, at, time.unit = "sec") {
    require(xts)
recharge <- numeric()
## Based on simit.R
    for(tti in 1:length(at)) {
        longfrom.to <- paste(paste0(at[tti] - 1, " 23:59"),
                             paste0(at[tti], " 04:00"),
                             sep = "/")
        recharge.xts <- x[longfrom.to]
        longterm.lm <- lm(coredata(recharge.xts) ~ as.numeric(index(recharge.xts)))
        recharge <- c(recharge, as.numeric(coefficients(longterm.lm)[2]))
    }
    if(time.unit == "sec") {
        recharge <- recharge*60*60*24*1000
    }
    recharge
}

recharge <- white.lmxts(x = tv.xts[,1], at = interv.day)
recharge.xts <- xts(recharge, interv.day)

plot(interv.day,recharge)
axis(2,0,tck=1)

plot.recharge <- function(x, rech, ...) {
    days <- index(rech)
    plot.intervall <- paste(days[1], days[length(days)], sep = "/")
    plot.zoo(x[plot.intervall], ...)
    for(tti in 1:length(days)) {
        one.day <- as.POSIXct(c(days[tti], days[tti] + 1))
        gw.at.midnight <- as.numeric(coredata(x[as.character(days[tti]),1][1]))
        recharge.points <- c(gw.at.midnight,
                             coredata(rech[tti])/1000 + gw.at.midnight
                             )
        points(one.day[1], recharge.points[1])
        points(one.day[2], recharge.points[2])
        lines(one.day, recharge.points)
    }
    axis(1, at = as.POSIXct(days), tck = 1, col = "lighTgray", lab = FALSE)
    axis(1, at = as.POSIXct(days) + 4 * 60 * 60, tck = 1, col = "lighTgray", lab = FALSE)
}

plot.recharge(x = tv.xts[,1], recharge.xts[1:10], xaxs = "i")
plot.recharge(x = tv.xts[,1], recharge.xts['2018-11-01/2018-11-10'], xaxs = "i")
plot.recharge(x = tv.xts[,1], recharge.xts['2020-01-21/2020-01-31'], xaxs = "i")

write.table(data.frame(Date=interv.day, Rech = round(recharge,3)), "Rech_3_3.csv", row = FALSE)
