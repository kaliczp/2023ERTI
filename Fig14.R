## Import
library(readxl)
raw14 <- read_excel("14.ábra_boxplot_V2.xlsx")

## Convert to data.frame with factors
Fig14 <- data.frame(Years = raw14[,3, drop = TRUE],
                    Recharge = raw14[,1, drop = TRUE]
                    )
Fig14 <- rbind(Fig14, data.frame(Years = raw14[,3, drop = TRUE],
                                 Recharge = raw14[,2, drop = TRUE]
                                 )
               )
Fig14 <- cbind(Plot = rep(c("Oak", "Control"), each = nrow(raw14)), Fig14)
Fig14$Plot <- factor(Fig14$Plot, levels = c("Oak", "Control"), ordered = TRUE)
Fig14$Years <- factor(Fig14$Years)

## Plot
library(ggplot2)

gg14 <- ggplot(data = Fig14, aes(x = Plot, y = Recharge)) +
    geom_boxplot(aes(fill=Plot)) +
    scale_fill_manual(values = c(Oak = '#4d99e6', 
                                 Control = '#cc0033')
                      ) +
    facet_wrap(. ~ Years, strip.position = "bottom", nrow = 1) +
    xlab(NULL) + 
    ylab("Recharge (mm/day)") +
    theme_minimal() +
    theme(panel.grid.major.x = element_blank(),
          axis.title.y = element_text(face = "bold"),
          axis.text.x=element_blank(),
          legend.title = element_blank()
          )
gg14

png("Fig14R.png", width = 14.25, height = 14.25, units = "cm", res = 300)
gg14
dev.off()

pdf("Fig14R.pdf", width = 14.25/2.54, height = 14.25/2.54)
gg14
dev.off()
