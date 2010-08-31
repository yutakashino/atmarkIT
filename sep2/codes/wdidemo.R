#WDI demo with ggplot2   
prewd <- getwd()
setwd("/Users/yutakashino/Dropbox/sandboxDrop/@IT/sandbox/sep2/docs")

library(ggplot2)
library(WDI)

gdp <- WDI(country = c("US", "JP", "CN", "KR"), indicator = "NY.GDP.MKTP.CD", start = 1960, end = 2008)
gdppercapita <- WDI(country=c("US", "JP", "CN", "KR"), indicator = "NY.GDP.PCAP.CD", start = 1960, end = 2008)
gdpgrowth <- WDI(country=c("US", "JP", "CN", "KR"), indicator ="NY.GDP.MKTP.KD.ZG", start = 1960, end = 2008)

ggplot(gdp, aes(year, NY.GDP.MKTP.CD, color=country))+geom_line(stat="identity") + xlab("Year") + opts(title="GDP (current US$)") + ylab("")
ggsave(file = 'gdp.png', scale = 0.8)

ggplot(gdppercapita, aes(year, NY.GDP.PCAP.CD, color=country))+geom_line(stat="identity") + xlab("Year") + opts(title = "GDP per capita (current US$)") + ylab("")
ggsave(file = 'gdppercapita.png', scale = 0.8)

ggplot(gdpgrowth, aes(year, NY.GDP.MKTP.KD.ZG, color=country)) + geom_line(stat="identity") + xlab("Year") + opts(title="GDP growth (annual %)")+ylab("")
ggsave(file = 'gdpgrowth.png', scale = 0.8)

setwd(prewd)