date.df <- data.frame(yr = c(2018, rep(2019:2022, lenght = 8, each = 2)),
                      mnth = rep(c(11,5), length = 9)
                      )

    ttdate <- 1
    datelim.part <-  c(ISOdate(date.df[ttdate,"yr"],
                               date.df[ttdate,"mnth"],
                               1, tz = "UTC"),
                       ISOdate(date.df[ttdate + 1,"yr"],
                               date.df[ttdate + 1,"mnth"],
                               1, tz = "UTC")
                       )
plot.fullgw(temp = FALSE, datelim = datelim.part)