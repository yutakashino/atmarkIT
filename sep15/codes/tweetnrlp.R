library(openNLP)
library(twitteR)


# Replace the user and password below
sess <- initSession('yutakashino','iamthet1!')
sea <- searchTwitter("#rstats")

# Cycle through the list and get the text from the tweets for analysis
names(sea)=c('tweet')
textdata=vector()
for (i in 1:length(sea)) {
    textdata = append(textdata, tokenize(text(sea[[i]])))
    }


# limit to entries that include alpha characters
textdata=factor(textdata)
textdata=textdata[grep("[a-zA-Z]",textdata)]


# Only include tokens that appear more than three times
s=summary(textdata)
subset=s[s>3]

# Set the chart options so that we can see the y axis
par(las=2,cex=.9,mar=c(11, 2, 4, 2) + 0.1)
barplot(subset,names=names(subset))