setwd("Dropbox/sandboxDrop/@IT/sandbox/nov03/codes/")
library(ggplot2)
data(baseball)

# for Babe Ruth
baberuth <- subset(baseball, id == "ruthba01")
baberuth <- transform(baberuth, cyear = year - min(year) + 1)

# for all players
baseball <- ddply(baseball, .(id), transform, cyear = year - min(year) + 1)

baseball <- subset(baseball, ab >= 25)
xlim <- range(baseball$cyear, na.rm=TRUE)
ylim <- range(baseball$rbi / baseball$ab, na.rm=TRUE)
plotpattern <- function(df) { qplot(cyear, rbi / ab, data = df, geom = "line", xlim = xlim, ylim = ylim) }
pdf("paths.pdf", width = 8, height = 4)
d_ply(baseball, .(reorder(id, rbi / ab)), failwith(NA, plotpattern), .print = TRUE)
dev.off()