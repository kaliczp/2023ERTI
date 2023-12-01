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
    geom_smooth(method = lm, se = FALSE, colour = "black", linewidth = 0.5) +
    geom_point(aes(fill = Year), pch = 21) + 
    scale_fill_manual(values = c("#4d99e6",
                                 "#cc0033",
                                 "#33801a",
                                 "#ff6633",
                                 "#e6cc1a"
                                 )
                      ) +
    xlab("Groundwater level (m)") +
    ylab("Recharge (mm/day)") +
    scale_x_continuous(breaks = seq(-7, -6.25, 0.25), 
                       labels = ~sub("-", "\u2212", .x)) +
    scale_y_continuous(breaks = seq(-0.5, 1, 0.5), 
                       labels = ~sub("-", "\u2212", .x)) +
    theme_minimal() +
    theme(axis.title.x = element_text(face = "bold"),
          axis.title.y = element_text(face = "bold")
          )
gg08

gg08Large <- gg08 + geom_point(aes(fill = Year), pch = 21, size = 3)

gg08Final <-cowplot::plot_grid(
                         gg08 + theme(legend.position = "none"),
                         cowplot::get_legend(gg08Large),
                         ncol = 2, rel_widths = c(4, 0.8))

png("Fig08R.png", width = 15, height = 13.5, units = "cm", res = 300)
gg08Final
dev.off()

pdf("Fig08R.pdf", width = 15/2.54, height = 13.5/2.54)
gg08Final
dev.off()
