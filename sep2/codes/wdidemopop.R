#WDI demo with ggplot2   
prewd <- getwd()
setwd("/Users/yutakashino/Dropbox/sandboxDrop/@IT/sandbox/sep2/docs")

library(ggplot2)
library(WDI)

pop <- WDI(country = c("US", "JP", "CN", "KR"), indicator = "SP.POP.TOTL", start = 1960, end = 2008)
ggplot(pop, aes(year, SP.POP.TOTL, color=country)) + geom_line(stat="identity") + xlab("Year") + opts(title="Population") + ylab("")
ggsave(file = 'population.png', scale = 0.8)

popgrow <- WDI(country = c("US", "JP", "CN", "KR"), indicator = "SP.POP.GROW", start = 1960, end = 2008)
ggplot(popgrow, aes(year, SP.POP.GROW, color=country)) + geom_line(stat="identity") + xlab("Year") + opts(title="Population Growth") + ylab("")
ggsave(file = 'populationgrow.png', scale = 0.8)

setwd(prewd)