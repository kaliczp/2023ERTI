## Nov1-tőll május1-ig
oak.tst <- tv.xts$Oak['2018-11-01/2019-04-01']
oak.tst.smth <- filter(coredata(oak.tst), filter = rep(1/385,385))

## plot
pdf(width = 14)
plot.zoo(oak.tst)
lines(as.zoo(xts(oak.tst.smth, index(oak.tst))), col = 2)
dev.off()


plot(tv.xts$Controll['2018-11-01/2019-04-01'])
