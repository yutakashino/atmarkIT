#read preformatted data by Google Refine
setwd("/Users/yutakashino/Dropbox/sandboxDrop/@IT/sandbox/sumo/codes/")
fn <- file("out.csv", open="r", encoding="utf-8")
df0 <- read.csv(file = fn, header = FALSE)
names(df0) <- c("rikishi", "vs", "win", "year", "month")
#nrow(df0)

#remove draws and absence
df0 <- subset(df0, df0$win!=-100 & df0$win!=-1)

#utilities: Mathematica's FoldList(Plus, ...) in R
foldsumwin <- function(l) Reduce("+", l, accumulate = TRUE)

#utilities: calc "Bubble flag" from win-number list
bublist <- function(l){
    blist <- c()
    isbubl <- c(0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7)
    llengh <- length(l)
    for (i in 1:llengh) {
        if(i >= 9 & l[i] >= isbubl[i] & l[i] <= 7) blist[i] = 1
        else blist[i] = 0
    }
    blist
}

#utilities: calc Bubble-candidate given by year, month, and rikishi and add it to DF
#bubsubdf(1999, 1, '闘牙')
bubsubdf <- function(ayear, amonth, arikishi) {
    df <- subset(df0, df0$year == ayear & df0$month == amonth & df0$rikishi == arikishi)
    l <- df$win
    df['day'] <- 1:length(l)
    df['bubcand'] <- bublist(unlist(foldsumwin(l)))
    df['bub'] <- rep(0, length(l))
    df
}

#Bubble calc without opponent effect
library(plyr)
rikishilist <- dlply(df0, c("year", "month"), function(d) unique(as.character(d$rikishi)))
yearlab <- attr(rikishilist, "split_labels")$year
monthlab <- attr(rikishilist, "split_labels")$month
df1 <- data.frame()
for (i in 1:length(yearlab)) {
    for (j in 1:length(rikishilist[[i]])) {
        bdf <- bubsubdf(yearlab[i], monthlab[i], rikishilist[[i]][j])
        df1 <- rbind(df1, bdf) #df1 is the our main data flame equipped with Bubble info.
    }
}

#Bubble calc with opponent effect
attach(df1)
#extract Bubble data without opponent effect
df2 <- subset(df1, df1$bubcand == 1) #df2 is a temp data flame to calc the opponent effect of our data
brikishi <- as.character(df2$rikishi)
bvs <- as.character(df2$vs)
bwin <- df2$win
byear <- df2$year
bmonth <- df2$month
bday <- df2$day

#---Gosh, messy implementation. Need to refine later...---
for (i in 1:length(byear)){
    #set Bubble flag of opponent rikishi 
    bubvs <- subset(df1, df1$rikishi == bvs[i] & df1$vs == brikishi[i] & df1$year == byear[i] & df1$month == bmonth[i])$bubcand
    #recalc Bubble flag with opponent effect
    #We don't have a Jyuryo data, then create it from Makuuchi data as a "mirror image"
    if(length(bubvs) == 0){
        #subject:Bubble, opponent:non Bubble -> subject:1, opponent:-1
        df1$bub[df1$rikishi == brikishi[i] & df1$vs == bvs[i] & df1$year == byear[i] & df1$month == bmonth[i]] <- 1;
        df10 <- data.frame(rikishi = bvs[i], win = bwin[i], vs = brikishi[i], year = byear[i], month = bmonth[i], day = bday[i], bubcand = 1, bub = -1)
        df1 <- rbind(df1, df10)
    }
    else{
        #subject:Bubble, opponent:non Bubble -> subject:1, opponent:-1
        if(bubvs == 0){
            df1$bub[df1$rikishi == brikishi[i] & df1$vs == bvs[i] & df1$year == byear[i] & df1$month == bmonth[i]] <- 1;
            df1$bub[df1$rikishi == bvs[i] & df1$vs == brikishi[i] & df1$year == byear[i] & df1$month == bmonth[i]] <- -1
        }
    }
}

#linear regression by day
lmf <- function(d) summary(lm(win ~ bub, d))
results <- dlply(df1, .(day), lmf)
