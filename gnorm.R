
rgnorm <- function(n, beta, s=1, m=0, debug=F) {
  auxf <- function(n, beta) { # Devroye sampling
    k <- exp(log(beta) - lgamma(1/beta))/2 # the density evaluated at the mode
    res <- rep(NA, n) # storing the results
    index <- 1:n # indices of entries to be fixed
    if (debug) trials <- 0
    while (n > 0) { # if some entries need to be fixed...
      if (debug) trials <- trials + n
      x <- rep(NA, n) # candidate replacements
      u <- runif(n, min = 0, max = 2) # U vector ~ U[0,2] as per Devroye
      v <- runif(n, min = 0, max = 1) # V vector ~ U[0,1]
      aux <- u > 1 # I tried using ifelse, but it evaluates log(u-1) even when u <= 1, then warnings, so...
      x[aux] <- 1-log(u[aux]-1)
      x[!aux] <- u[!aux]
      x <- x/k
      tt <- log(ifelse(u > 1, v*(u-1), v)) # log(T)
      rej <- (tt > -abs(x)^beta) # T > f(m+X/c)/f(m)
      res[index] <- x
      index <- index[rej]
      n <- length(index)
    }
    if (debug) attr(res, "acceptance rate") <- length(res)/trials
    return(res)
  }
  require(gnorm)
  if (beta < 1) return(gnorm::rgnorm(n=n, mu = m, alpha = s, beta = beta))
  v <- if (beta==Inf) {
    runif(n, min=-1, max=+1)
  } else {
    auxf(n=n, beta=beta)*sign(runif(n)-1/2)
  }
  return(v*s + m)
}
