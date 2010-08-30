#WDI demo with ggplot2   
library(ggplot2)
library(WDI)
DF2 <- WDI(country=c("US","JP","CN"), indicator="NY.GDP.MKTP.KD.ZG", start=1970, end=2008 )
p = ggplot(DF2, aes(year, NY.GDP.MKTP.KD.ZG, color=country))+geom_line(stat="identity")+theme_bw()+xlab("Year")+opts(title="Annual GDP Growth rate (%)")+ylab("")
ggsave(p, filename = "testgg.png", scale=0.8, dpi=300)