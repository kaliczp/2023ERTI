## Intervall import
library(readxl)
raw.interv <- read_excel("Nyugalmi időszak dátumok Péternek.xlsx")
interv.only <- na.omit(raw.interv[,2:3, drop = TRUE])
interv.asc <- data.frame(From = as.character(as.Date(interv.only[,1, drop = TRUE])),
                         To = as.character(as.Date(interv.only[,2, drop = TRUE])))

## All day selecte
interv.day <- as.Date(raw.interv[,1, drop = TRUE])


## plot
pdf(width = 42/2.54, height = 29.7/2.54)
par(mfrow = c(3,3))
## Given time intervall
for(tti in 1:nrow(interv.asc)) {
    from.to <- paste(interv.asc[tti,1],interv.asc[tti,2], sep = "/")
    simitott <- simit(tv.xts[,1], from.to)
    plot.zoo(tv.xts[from.to,1], xaxs = "i", main = from.to)
    lines(as.zoo(simitott), col = "magenta")
}
dev.off()

plot(tv.xts$Controll['2018-11-01/2019-04-01'])

simit <- function(x, fromto = NULL, wwidth = 13, diff.plot = FALSE) {
    ## Cut with window
    if(is.null(fromto)) {
        windowed <- x
    } else {
        windowed <- x[from.to]
    }
    ## Generate filter
    filter.vec <- rep(1/wwidth, wwidth)
    filtered <- filter(coredata(windowed), filter = filter.vec)
    ## Plot for test
    if(diff.plot) {
        tst.diff <- diff(filtered)
        plot(tst.diff)
        axis(2,0,tck=1, lab = FALSE)
    }
    xts(filtered, index(windowed))
}

long.rang.full <- long.rang
pdf(width = 35)
for(tti in 1:length(interv.day)) {
    longfrom.to <- paste(interv.day[tti]-1,interv.day[tti]+6, sep = "/")
    longterm.xts <- tv.xts[longfrom.to,1]
    longterm.lm <- lm(coredata(longterm.xts) ~ as.numeric(index(longterm.xts)))
    long.rang <- range(longterm.xts)
    long.rang[1] <- trunc(long.rang[1]*10)/10 - 0.1
    long.rang[2] <- long.rang[1] + 0.2
    from.to <- paste(interv.day[tti]-1,interv.day[tti]+1, sep = "/")
    simitott <- simit(tv.xts[,1], from.to)
    strongsimitott <- simit(tv.xts[,1], from.to, wwidth = 25)
    strongstrongsimitott <- simit(tv.xts[,1], from.to, wwidth = 93)
    par(fig = c(0,0.2,0,1))
    plot.zoo(tv.xts[as.character(interv.day[tti]),1], xaxs = "i", main = interv.day[tti])
    lines(as.zoo(simitott), col = "magenta")
    lines(as.zoo(strongsimitott), col = "red")
    lines(as.zoo(strongstrongsimitott), col = "blue")
    abline(longterm.lm)
    par(fig = c(0.2,0.6,0,1), new = TRUE)
    plot.zoo(tv.xts[from.to,1], xaxs = "i", main = from.to, xaxs = "i", ylim = long.rang)
    lines(as.zoo(simitott), col = "magenta")
    axis(1, at = as.POSIXct(c(interv.day[tti],interv.day[tti]+1)), tck = 1, col = "lightgray", lab = FALSE)
    abline(longterm.lm)
    par(fig = c(0.6,1,0,1), new = TRUE)
    plot.zoo(longterm.xts, xaxs = "i", main = longfrom.to, xaxs = "i", ylim = long.rang)
    lines(as.zoo(simitott), col = "magenta")
    lines(as.zoo(strongsimitott), col = "red")
    lines(as.zoo(strongstrongsimitott), col = "blue")
    axis(1, at = as.POSIXct(c(interv.day[tti],interv.day[tti]+1)), tck = 1, col = "lightgray", lab = FALSE)
    abline(longterm.lm)
}
dev.off()
