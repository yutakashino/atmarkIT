library(twitteR)
library(igraph)
userToPlot <- "masui"
sess <- initSession("yutakashino", "iamthet1!")
friends.object <- userFriends(userToPlot, n=20, sess)
followers.object <- userFollowers(userToPlot, n=20, sess)
friends <- sapply(friends.object,name)
followers <- sapply(followers.object,name)
relations <- merge(data.frame(User=userToPlot, Follower=friends), 
    data.frame(User=followers,  Follower=userToPlot), 
    all=T)
g <- graph.data.frame(relations, directed = T)
V(g)$label <- V(g)$name
plot(g)
rglplot(g)
tkplot(g)