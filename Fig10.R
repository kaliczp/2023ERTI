## Import
library(readxl)
raw10 <- read_excel("10.ábra.xlsx")

## Convert to data.frame with factors
Fig10 <- data.frame(Year = factor(raw10[1:47,3, drop = TRUE]),
                    Amplitude = raw10[1:47,2, drop = TRUE],
                    Recharge = raw10[1:47,1, drop = TRUE]
                    )

## Plot
library(ggplot2)

gg10 <- ggplot(data = Fig10, aes(x = Amplitude, y = Recharge)) +
    geom_point(aes(fill = Year), pch = 21) +
    scale_fill_manual(values = c('#4d99e6', 
                                 '#cc0033',
                                 '#33801a',
                                 '#ff6633'
                                 )
                      ) +
    geom_smooth(method = lm) +
    xlab("Amplitude (mm)") +
    ylab("Recharge (mm/day)") +
    theme_minimal() +
    theme(axis.title.x = element_text(face = "bold"),
          axis.title.y = element_text(face = "bold")
          )
gg10

gg10Large <- gg10 + geom_point(aes(fill = Year), pch = 21, size = 3)

gg10Final <-cowplot::plot_grid(
                         gg10 + theme(legend.position = "none"),
                         cowplot::get_legend(gg10Large),
                         ncol = 2, rel_widths = c(4, 0.8))

png("Fig10R.png", width = 15, height = 13.5, units = "cm", res = 300)
gg10Final
dev.off()
