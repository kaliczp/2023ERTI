## Import
library(readxl)
raw06 <- read_excel("06.ábra_boxplot.xlsx")

## Convert to data.frame with factors
Fig06 <- data.frame(Season = raw06[,1, drop = TRUE],
                    Recharge = raw06[,2, drop = TRUE]
                    )
Fig06 <- rbind(Fig06, data.frame(Season = raw06[,1, drop = TRUE],
                                 Recharge = raw06[,3, drop = TRUE]
                                 )
               )
Fig06 <- cbind(Plot = rep(c("Oak", "Control"), each = nrow(raw06)), Fig06)
Fig06$Plot <- factor(Fig06$Plot)
Fig06$Plot <- factor(Fig06$Season)
