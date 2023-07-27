library(readxl)
FigRechGw <- read_excel("Recharge vs GW dGW_erdő_NV simított vs. simítás előtti.xlsx")
plot(FigRechGw[,4:5])
plot(FigRechGw[,c(3,5)])

## Delta gw with smoothed
plot(FigRechGw[,3, drop = TRUE], recharge.xts[,"s3hr"] * 0.0932)
