library(readxl)
amptemp.raw <- as.data.frame(read_excel("Ábra szinezésre Péternek.xlsx"))
amptemp <- amptemp.raw
names(amptemp) <- c("Year", "GW", "Amp", "Temp")
amptemp$Year <- as.factor(format(amptemp$Year, "%Y"))

library(ggplot2)
GWaty <- ggplot(data = amptemp, aes (y = Amp, x = GW))

pdf()
GWaty + geom_point(aes(color = Temp, shape = Year)) +
    theme_minimal()
dev.off()
