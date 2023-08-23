library(readxl)
StartGW.raw <- read_excel("Rech. time vs GW.xlsx")
plot(StartGW.raw)

library(chron)

Start.chron <- times(format(StartGW.raw[,1, drop = TRUE], "%H:%M:%S"))

plot(StartGW.raw[, 2, drop = TRUE], Start.chron)
