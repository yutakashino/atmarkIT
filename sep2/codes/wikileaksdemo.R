library(ggplot2)
setwd("/Users/yutakashino/Dropbox/sandboxDrop/@IT/temp/")
afg<-read.csv("afg.csv",stringsAsFactors=FALSE)

colnames(afg)<-c("ReportKey","DateOccurred","Type","Category","TrackingNumber","Title","Summary","Region","AttackOn",
    "ComplexAttack","ReportingUnit","UnitName","TypeOfUnit","FriendlyWIA","FriendlyKIA","HostNationWIA","HostNationKIA",
    "CivilianWIA","CivilianKIA","EnemyWIA","EnemyKIA","EnemyDetained","MGRS","Latitude","Longitude","OriginatorGroup",
    "UpdatedByGroup","CCIR","Sigact","Affiliation","DColor","Classification")

afg$DateOccurred <- as.Date(afg$DateOccurred)
afg$Region[grep("RC ",afg$Region,fixed=T,invert=T)]<-"UNKNOWN"
afg$Region<-as.factor(afg$Region)

event <- ggplot( afg, aes(x = DateOccurred) ) + stat_bin( aes( y = ..count.., fill = AttackOn ), binwidth=30 ) + facet_wrap( ~Region ) + 
    opts( title = "Monthly Event Report (Region and Attack Target)" ) + xlab( "Date ") + ylab( "Report Counts" ) + 
    scale_fill_manual( values = c( "darkred", "darkblue", "darkgreen", "orange" ), name = "Who Attacked" ) + scale_x_date( major = "years", minor = "months" )
ggsave("wikileaks_event.png", plot = event, width=10, height=5)

weeklyCount<-cbind(table(cbind(format.Date(afg$DateOccurred,"%Y %W"))))

pullLeaddigit<-function(x) {
    as.numeric(substring(formatC(x, format = 'e'), 1, 1))
} 

digits <- table(pullLeaddigit(weeklyCount))
digits <- cbind(digits)
digits <- as.data.frame(digits)
colnames(digits) <- "digitCount"
digits$digitCount <- digits$digitCount/sum(digits$digitCount)

dbenford <- function(x) {
    return(log10((1+x)/x))
}

benford <- ggplot(digits, aes(x=1:9, y=digitCount)) + geom_path(aes(colour = "observation")) + geom_point(aes(colour = "observation")) + stat_function(fun = dbenford, aes(colour = "theory")) + scale_colour_manual( values = c("observation" = "orange", "theory" = "blue")) + xlab("Digit") + ylab("Count Density") + opts(title="Applying Benford's law to Wikileaks Data") 
ggsave("wikileaks_benford.png", plot=benford, width=7, height=7)

# Chi-square test for goodness of fit
chisq.test(x= digits$digitCount, y = dbenford(1:9))