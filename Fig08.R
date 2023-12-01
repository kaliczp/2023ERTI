## Import
library(readxl)
raw08 <- read_excel("08.ábra.xlsx")

## Convert to data.frame with factors
Fig08 <- data.frame(Year = factor(raw08[,1, drop = TRUE]),
                    GW = raw08[,2, drop = TRUE],
                    Recharge = raw08[,3, drop = TRUE]
                    )

## Plot
library(ggplot2)

gg08 <- ggplot(data = Fig08, aes(x = GW, y = Recharge)) +
    geom_point(aes(fill = Year), pch = 21) + 
    scale_fill_manual(values = c("#4d99e6",
                                 "#cc0033",
                                 "#33801a",
                                 "#ff6633",
                                 "#e6cc1a"
                                 )
                      ) +
    geom_smooth(method = lm) +
    xlab("Groundwater level (m)") +
    ylab("Recharge (mm/day)") +
    theme_minimal() +
    theme(axis.title.x = element_text(face = "bold"),
          axis.title.y = element_text(face = "bold")
          )
gg08

png("Fig08R.png", width = 15, height = 13.5, units = "cm", res = 300)
gg08
dev.off()
