library(readxl)
tv.raw <- as.data.frame(read_excel("Alapadatok_Péternek.xlsx"))
met.raw <- as.data.frame(read_excel("Alapadatok_Péternek.xlsx", 2))

## Remove last almost empty rows
tv.raw <- tv.raw[-(138176:138178),]
