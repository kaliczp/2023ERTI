recharge <- numeric()
## Based on simit.R
for(tti in 1:length(interv.day)) {
    longfrom.to <- paste(interv.day[tti]-1,interv.day[tti]+6, sep = "/")
    longterm.xts <- tv.xts[longfrom.to,1]
    longterm.lm <- lm(coredata(longterm.xts) ~ as.numeric(index(longterm.xts)))
    recharge <- c(recharge, as.numeric(coefficients(longterm.lm)[2]))
}
recharge*60*60*24*1000

plot(interv.day,recharge*60*60*24*1000)
axis(2,0,tck=1)

plot.zoo(tv.xts['2018-11-01/2018-11-03',1])
tti <- 1
points(as.POSIXct(interv.day[tti]),as.numeric(coredata(tv.xts[as.character(interv.day[tti]),1][1])))
points(as.POSIXct(interv.day[tti]+1),recharge[tti]*60*60*24+as.numeric(coredata(tv.xts[as.character(interv.day[tti]),1][1])))
lines(c(as.POSIXct(interv.day[tti]),as.POSIXct(interv.day[tti]+1)),c(as.numeric(coredata(tv.xts[as.character(interv.day[tti]),1][1])),recharge[tti]*60*60*24+as.numeric(coredata(tv.xts[as.character(interv.day[tti]),1][1]))))
