library(readxl)
tv.raw <- as.data.frame(read_excel("Alapadatok_Péternek.xlsx"))
met.raw <- as.data.frame(read_excel("Alapadatok_Péternek.xlsx", 2))

## Remove last almost empty rows
tv.raw <- tv.raw[-(138176:138178),]
## Add valid names to datasets
names(tv.raw) <- c("Date1", "Date2", "Oak", "Controll")
names(met.raw) <- c("Date1", "Date2", "Oak", "Controll", "Prec", "Temp")

## Remove missing data
tv.nona <- tv.raw[!is.na(tv.raw$Oak),]
met.nona <- met.raw[!is.na(met.raw$Temp),]
