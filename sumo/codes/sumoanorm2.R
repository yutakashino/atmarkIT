#setwd("/Users/yutakashino/Dropbox/sandboxDrop/@IT/sandbox/sumo/codes/")
library(plyr)
#fn <- file("out.csv", open="r", encoding="utf-8")
#df <- read.csv(file = fn, header = FALSE)

df <- read.csv("https://spreadsheets.google.com/pub?key=0AlBuJgqcP5f3dElpb0lWcDRjZldkMzE1LW5aY1VtMHc&hl=en&single=true&gid=0&output=csv", header=FALSE)
names(df) <- c("rikishi", "vs", "win", "year", "month")
nrow(df)
df <- subset(df, df$win!=-100 & df$win!=-1)

#ddply(subset(df2, year==1999 & month==1), .(rikishi), function(d) data.frame(numwin = sum(d$win)))
#ddply(subset(df2, year==1999 & month==1), .(rikishi), summarize, numwin=sum(win))

df <- ddply(df, .(rikishi, year, month), summarize, numwin=sum(win))

library(ggplot2)
p2 <- ggplot(df, aes(numwin)) + geom_histogram(aes(y = ..count..))
ggsave(plot = p2, filename = "sumoobservation.png")

#p2 + stat_function(geom="line", fun = function(..., total){dbinom(...) * total}, arg = list(size=15, prob=1/2, total=nrow(df3)))

dsumo <- function(x, total) total*dbinom(x, size = 15, prob = 1/2)
dft<- data.frame(x = c(0:15), win_theory = dsumo(c(0:15), nrow(df)))
df2 <- as.data.frame(table(df$numwin))
names(df2) <- c("x", "win_observ")
str(df2)
df2 <- transform(df2, x = as.integer(x)-1, win_theory = dft$win_theory)
ggplot(data = melt(df2, id = 'x'), aes(x = x, y = value, colour = variable)) + geom_line()
ggplot(data = df2, aes(x)) + geom_point(aes(y = win_observ, colour = "win_observ")) + geom_line(aes(y = win_observ, colour = "win_observ")) + geom_line(aes(y = win_theory, colour = "win_theory"))
ggsave("sumoanorm.png")

#df5 <- merge(df2, dft, by="x")
#df6 <- df5[with(df5, order(x)),]
#write.csv(df5, file="df5.csv")
#d <- read.csv("df5.csv")
#ggplot(d, aes(x)) + geom_line(aes(y=win_observ, colour = "win_observ")) + geom_line(aes(y=win_theory, colour="win_theory"))
#ggplot(data=d, aes(x))+geom_rect(aes(xmin=x-1, xmax=x, ymin=0, ymax=win_observ, colour="darkgreen", fill="white"))+geom_line(aes(y=win_theory, colour="win_theory"))