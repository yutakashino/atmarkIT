library(plyr)

# Group-wise summaries
# ======================================================

# Mean games, at bats, runs and hits by year

# using loops...
# split
pieces <- split(baseball[,6:9], baseball$year)
# apply
results <- vector("list", length(pieces))
names(results) <- names(pieces)
for(i in seq(1, length(pieces))){
	piece <- pieces[[i]]
	results[[i]] <- mean(piece)
}
# combine
result <- do.call("rbind", results)

# an easier way...
# split
pieces <- split(baseball[,6:9], baseball$year)
# apply 
results <- lapply(pieces, mean)
# combine
result <- do.call("rbind", results)

# with plyr.. (only 1 line of code!)
ddply(baseball, .(year), function(df) mean(df[, 6:9]))

# Mean games, at bats, runs and hits by league
ddply(baseball, .(lg), function(df) mean(df[, 6:9]))

# Mean games, at bats, runs and hits by year and league
ddply(baseball, c("year", "lg"), function(df) mean(df[, 6:9]))


# Constructing new variables with transform
# ======================================================

# creating a variable for career year (for each player)

# for Babe Ruth
baberuth <- subset(baseball, id == "ruthba01")
baberuth <- transform(baberuth, cyear = year - min(year) + 1)

# for all players
baseball <- ddply(baseball, .(id), transform, cyear = year - min(year) + 1)

# Using summarise
# ======================================================

# counting number of teams in the data set
summarise(baseball, nteams= length(unique(team)))

# Number of teams each player played for
ddply(baseball, "id", summarise, nteams = length(unique(team)))

# Models and plyr
# ======================================================
model <- function(df){
	lm(h/ab ~ cyear, data = df)	
}

baseball <- subset(baseball, ab >= 25)
bmodels <- dlply(baseball, .(id), model)
bcoefs <- ldply(bmodels, function(x) coef(x))
names(bcoefs)[2:3] <- c("intercept", "slope")

# NASA data
# ======================================================
nasa <- read.csv(file.choose())
head(nasa)
str(nasa)
summary(nasa)