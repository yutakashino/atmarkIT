contagion <-
function (horizontal=200, vertical=500, spontaneous=1, width=150, 
	height=100, times=200) 
{
	# placed in the public domain 2011 by Burns Statistics

	if(length(horizontal) != 1 || mode(horizontal) != "numeric") {
		stop("'horizontal' needs to be numeric if length 1")
	}
	if(length(vertical) != 1 || mode(vertical) != "numeric") {
		stop("'vertical' needs to be numeric if length 1")
	}
	ans <- array(NA, c(width, height))
	alen <- length(ans)
	vertmat <- hormat <- ans
	hormat <- rbeta(alen, 1, horizontal)
	vertmat <- rbeta(alen, 1, vertical)
	wfalse <- rep(FALSE, width)
	hfalse <- rep(FALSE, height)

	for(i in seq(length=times)) {
		# spontaneous failures
		spon <- runif(alen) < spontaneous / alen
		ans[spon & is.na(ans)] <- i
		# vertical contagion
		ana <- is.na(ans)
		tc <- ana & c(wfalse, !ana[,-height]) & runif(alen) < vertmat
		ans[tc] <- i
		bc <- ana & c(!ana[,-1], wfalse) & runif(alen) < vertmat
		ans[bc] <- i
		# vertical contagion
		ana <- is.na(ans)
		rc <- ana & c(hfalse, !ana[-width,]) & runif(alen) < hormat
		ans[rc] <- i
		lc <- ana & c(!ana[-1,], hfalse) & runif(alen) < hormat
		ans[lc] <- i
	}
	attr(ans, "call") <- match.call()
	class(ans) <- "contagion"
	ans
}

plot.contagion <-
function (x, col=topo.colors(20), ...) 
{
	# placed in the public domain 2011 by Burns Statistics

	image(x, xaxt="n", yaxt="n", col=col, ...)
}

