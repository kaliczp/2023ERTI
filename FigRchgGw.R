library(readxl)
FigRechGw <- read_excel("Recharge vs GW dGW_erdő_NV simított vs. simítás előtti.xlsx")
plot(FigRechGw[,4:5])
plot(FigRechGw[,c(3,5)])

## Delta gw with smoothed
pdf(width = 10)
for(akt.name in names(recharge.xts))
plot(FigRechGw[,3, drop = TRUE], recharge.xts[,akt.name] * 0.0932, main = akt.name,
     ylab = "Recharge (mm)", xlab = "delta GWL (m)")
dev.off()
