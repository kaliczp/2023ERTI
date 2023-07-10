## Intervall import
library(readxl)
raw.interv <- read_excel("Nyugalmi időszak dátumok Péternek.xlsx")
interv.only <- na.omit(raw.interv[,2:3, drop = TRUE])
interv.asc <- data.frame(From = as.character(as.Date(interv.only[,1, drop = TRUE])),
                         To = as.character(as.Date(interv.only[,2, drop = TRUE])))
## Given time intervall
tti <- 1
oak.tst <- tv.xts$Oak[paste(interv.asc[tti,1],interv.asc[tti,2], sep = "/")]
oak.tst.smth <- filter(coredata(oak.tst), filter = rep(1/13,13))
oak.tst.diff <- diff(oak.tst.smth)
plot(oak.tst.diff)
axis(2,0,tck=1, lab = FALSE)
oak.tst.smth[which(oak.tst.diff<0)]

## plot
pdf(width = 14)
plot.zoo(oak.tst, xaxs = "i")
lines(as.zoo(xts(oak.tst.smth, index(oak.tst))), col = 2)
dev.off()


plot(tv.xts$Controll['2018-11-01/2019-04-01'])
