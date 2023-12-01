## Import
library(readxl)
raw07 <- read_excel("07.ábra.xlsx")

## Convert to data.frame with factors
Fig07 <- data.frame(Year = factor(raw07[,1, drop = TRUE]),
                    Delta = raw07[,2, drop = TRUE],
                    Recharge = raw07[,3, drop = TRUE]
                    )
## Plot
library(ggplot2)

gg07 <- ggplot(data = Fig07, aes(x = Delta, y = Recharge)) +
    geom_point(aes(fill = Year), pch = 21) + 
    scale_fill_manual(values = c("#4d99e6",
                                 "#cc0033",
                                 "#33801a",
                                 "#ff6633",
                                 "#e6cc1a"
                                 )
                      ) +
    geom_smooth(method = lm) +
    xlab("Difference in groundwater level (m)") +
    ylab("Recharge (mm/day)") +
    theme_minimal() +
    theme(axis.title.x = element_text(face = "bold"),
          axis.title.y = element_text(face = "bold")
          )
gg07

gg07Large <- gg07 + geom_point(aes(fill = Year), pch = 21, size = 3)

gg07Final <-cowplot::plot_grid(
                         gg07 + theme(legend.position = "none"),
                         cowplot::get_legend(gg07Large),
                         ncol = 2, rel_widths = c(4, 0.8))

png("Fig07R.png", width = 15, height = 13.5, units = "cm", res = 300)
gg07Final
dev.off()
