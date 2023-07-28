library(readxl)
FigRechGw <- read_excel("Recharge vs GW dGW_erdő_NV simított vs. simítás előtti.xlsx")
plot(FigRechGw[,4:5])
plot(FigRechGw[,c(3,5)])

## Delta gw with smoothed
pdf(width = 10)
for(akt.name in names(recharge.xts))
plot(FigRechGw[,3, drop = TRUE], recharge.xts[,akt.name] * 0.0932, main = akt.name,
     xlim = c(0,1.8), ylim = c(-1,8), xaxs = "i", yaxs = "i",
     ylab = "Recharge (mm)", xlab = "delta GWL (m)")
dev.off()

recharge.xts[c(13, 21, 22, 24, 25, 30, 33, 34, 36, 121, 129),] * 0.0932
