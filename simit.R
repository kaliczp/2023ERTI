## Intervall import
library(readxl)
raw.interv <- read_excel("Nyugalmi időszak dátumok Péternek.xlsx")
interv.only <- na.omit(raw.interv[,2:3, drop = TRUE])
interv.asc <- data.frame(From = as.character(as.Date(interv.only[,1, drop = TRUE])),
                         To = as.character(as.Date(interv.only[,2, drop = TRUE])))

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

simit <- function(x, fromto, wwidth = 13, diff.plot = FALSE) {
    ## Cut with window
    windowed <- x[from.to]
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
