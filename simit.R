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
    oak.tst <- tv.xts$Oak[from.to]
oak.tst.smth <- filter(coredata(oak.tst), filter = rep(1/13,13))
oak.tst.diff <- diff(oak.tst.smth)
## plot(oak.tst.diff)
## axis(2,0,tck=1, lab = FALSE)
oak.tst.smth[which(oak.tst.diff<0)]

oak.smth.xts <- xts(oak.tst.smth, index(oak.tst))

    plot.zoo(oak.tst, xaxs = "i", main = from.to)
    lines(as.zoo(oak.smth.xts), col = "magenta")
}
dev.off()

plot(tv.xts$Controll['2018-11-01/2019-04-01'])
