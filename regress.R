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

plot(interv.day,recharge)
axis(2,0,tck=1)

    plot.intervall <- '2018-11-01/2018-11-10'
    plot.zoo(tv.xts[plot.intervall,1])
for(tti in 1:10) {
points(as.POSIXct(interv.day[tti]),as.numeric(coredata(tv.xts[as.character(interv.day[tti]),1][1])))
points(as.POSIXct(interv.day[tti]+1),recharge[tti]/1000+as.numeric(coredata(tv.xts[as.character(interv.day[tti]),1][1])))
lines(c(as.POSIXct(interv.day[tti]),as.POSIXct(interv.day[tti]+1)),c(as.numeric(coredata(tv.xts[as.character(interv.day[tti]),1][1])),recharge[tti]/1000+as.numeric(coredata(tv.xts[as.character(interv.day[tti]),1][1]))))
}

write.table(data.frame(Date=interv.day, Rech = round(recharge,3)), "Rech_3_3.csv", row = FALSE)
