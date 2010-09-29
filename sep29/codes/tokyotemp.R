#setwd("/Users/yutakashino/Dropbox/sandboxDrop/@IT/sandbox/sep29/codes/")
#data <- read.csv("tokyotempavg.csv", header=TRUE)

library(ggplot2)
data <- read.csv("http://spreadsheets.google.com/pub?key=0AlBuJgqcP5f3dDNCY0lFSEVJQXhDOWt5YkUtNTdLUHc&hl=en&output=csv", header=TRUE)

# temperture plot 1876-2010 in Tokyo
data1 <- melt(data, id=c("year", "Average"))
ggplot(data=data1, aes(x = year, y = value)) + geom_path() + facet_wrap( ~variable )
ggsave(file = "tokyotemperture.png")

base <- subset(data, year>1950 & year<=1980, c(Jun, Jul, Aug))

# August temperture anomaly based on 1950-1980 in Tokyo
baseAug <- mean(base$Aug)
dataAug <- subset(data, year>1980, c(year, Aug))
ggplot(data=dataAug, aes(x=year, y=Aug-baseAug)) + geom_path()
ggsave(file = "tokyoAugAnomaly.png")

# Summer temperture anomaly based on 1950-1980 in Tokyo
baseSummer <- sum(mean(base))/3
dataSummer <- subset(data, year>1980, c(year, Jun, Jul, Aug))
dataSummer2 <- (dataSummer$Jun+dataSummer$Jul+dataSummer$Aug)/3
dataSummer <- cbind(dataSummer, dataSummer2)
colnames(dataSummer) <- c("year", "Jun", "Jul", "Aug", "sumAverage")
ggplot(data=dataSummer, aes(x = year, y=sumAverage - baseSummer)) + geom_path()
ggsave(file = "tokyoSummerAnomaly.png")



datamax <- read.csv("https://spreadsheets.google.com/pub?key=0AlBuJgqcP5f3dGN1VkpudGozUDUyTk9qSk1kQXNkdXc&hl=en&output=csv", header=TRUE)
datamax1 <- melt(datamax, id=c("year", "Average"))
ggplot(data = datamax1, aes(x = year, y = value)) + geom_path() + facet_wrap( ~variable )
ggsave(file = "tokyotempertureMax.png")

datamin<- read.csv("https://spreadsheets.google.com/pub?key=0AlBuJgqcP5f3dDF1c1JDc19qd0pTM3lBZGYyTE55dmc&hl=en&output=csv", header=TRUE)
datamin1 <- melt(datamin, id=c("year", "Average"))
ggplot(data =datamin1, aes(x = year, y = value)) + geom_path() + facet_wrap( ~variable )
ggsave(file = "tokyotempertureMin.png")