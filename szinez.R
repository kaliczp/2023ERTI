library(readxl)
amptemp.raw <- as.data.frame(read_excel("Ábra szinezésre Péternek.xlsx"))
amptemp <- amptemp.raw
names(amptemp) <- c("Year", "GW", "Amp", "Temp")
amptemp$Year <- as.factor(format(amptemp$Year, "%Y"))

plot(Amp ~ GW, data = amptemp)
     
