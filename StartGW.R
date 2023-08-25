library(readxl)
StartGW.raw <- read_excel("Rech. time vs GW.xlsx")
plot(StartGW.raw)

library(chron)

## min 21 max 13
Start.shift <- StartGW.raw[,1, drop = TRUE] + 8.5 * 60 * 60

Start.chron <- times(format(Start.shift, "%H:%M:%S"))
plot(Start.chron, xlab = "")

StartGW.df <- data.frame(GW = StartGW.raw[, 2, drop = TRUE], Time = Start.chron)

StartGW.lm  <- lm(Time ~ GW, data = StartGW.df)
StartGW2.lm  <- lm(Time ~ GW, data = StartGW.df[StartGW.df$GW > -8.6,])
StartGW3.lm  <- lm(Time ~ GW + I(GW^2), data = StartGW.df[StartGW.df$GW > -8.6,])

Plotchron <- times(c("06:30:00", paste(seq(7,23, by = 3), "30:00", sep = ":"), "23:59:59"))
plot(Time ~ GW, data = StartGW.df,
     xlab = "Groundwater level (m)",
     xlim = c(-6.833, -8.707),
     ylim = Plotchron[c(1,length(Plotchron))],
     yaxt = "n", yaxs = "i",
     ylab = "")
mtext("Start time of daily recharge period", side = 2, line = 3)
axis(2, at = Plotchron[- c(1,length(Plotchron))], lab = paste0(c(23, seq(from = 2, to = 14, by = 3)),":00"))
abline(StartGW2.lm)
points(StartGW.df[StartGW.df$GW < -8.6,], col = "gray")
# lines(StartGW.df[StartGW.df$GW > -8.6, "GW"], predict(StartGW3.lm), col = 2)
