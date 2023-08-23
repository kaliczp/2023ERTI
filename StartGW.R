library(readxl)
StartGW.raw <- read_excel("Rech. time vs GW.xlsx")
plot(StartGW.raw)

library(chron)

## min 21 max 13
Start.shift <- StartGW.raw[,1, drop = TRUE] + 8.5 * 60 * 60

Start.chron <- times(format(Start.shift, "%H:%M:%S"))
plot(Start.chron, xlab = "")

plot(StartGW.raw[, 2, drop = TRUE], Start.chron,
     xlab = "Groundwater level (m)",
     yaxt = "n",
     ylab = "")
mtext("Start time of daily recharge period", side = 2, line = 3)
