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
    geom_point() +
    xlab("Difference in groundwater level (m)") +
    ylab("Recharge (mm/day)") +
    theme_minimal() +
    theme(axis.title.x = element_text(face = "bold"),
          axis.title.y = element_text(face = "bold")
          )
gg07


