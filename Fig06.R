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
Fig06$Plot <- factor(Fig06$Plot, levels = c("Oak", "Control"), ordered = TRUE)
Fig06$Season <- factor(Fig06$Season, labels = c("Dormant period", "Vegetative period"))

## Plot
library(ggplot2)

gg06 <- ggplot(data = Fig06, aes(x = Plot, y = Recharge)) +
    geom_boxplot(aes(fill=Plot)) +
    scale_fill_manual(values = c(Oak = '#4d99e6', 
                                 Control = '#cc0033')
                      ) +
    facet_wrap(. ~ Season, strip.position = "bottom") +
    xlab(NULL) + 
    ylab("Recharge (mm/day)") +
    theme_minimal() +
    theme(panel.grid.major.x = element_blank(),
          axis.title.y = element_text(face = "bold"),
          axis.text.x=element_blank(),
          legend.title = element_blank()
          )
gg06

png("Fig06R.png", width = 14.25, height = 14.25, units = "cm", res = 300)
gg06
dev.off()

pdf("Fig06R.pdf", width = 14.25/2.54, height = 14.25/2.54)
gg06
dev.off()


