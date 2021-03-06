% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/downscale.R
\name{downscale}
\alias{downscale}
\title{Downscale a precipitation field}
\usage{
downscale(r, f, weights = 1, fglob = FALSE, fsmooth = TRUE)
}
\arguments{
\item{r}{matrix of precipitation data to downscale.}

\item{f}{matrix containing a complex spectrum generated by the
\code{\link[=initmetagauss]{initmetagauss()}} function.}

\item{weights}{matrix with climatological weights generated with the
\code{\link[=rfweights]{rfweights()}} function.}

\item{fglob}{logical to conserve global average over domain.}

\item{fsmooth}{logical to use smoothing for conservation.
If neither option is set precipitation is conserved over each coarse box.}
}
\value{
The downscaled field, with the same dimensions as \code{f}.
}
\description{
Downscales an input precipitation matrix using a metagaussian
spectral field \code{f} previously generated with \code{\link[=initmetagauss]{initmetagauss()}}.
The target resolution is defined by the dimensions of \code{f}.
An optional weights array can be specified.
}
\examples{
# Make some sample synthetic rainfall data
r <- exp(rnorm(4 * 4))
dim(r) <- c(4, 4)
r
#           [,1]      [,2]      [,3]      [,4]
# [1,] 1.8459816 1.8536550 2.1600665 1.3102116
# [2,] 1.3851011 1.4647348 0.2708219 0.4571810
# [3,] 0.2492451 0.8227134 0.4790567 1.9320403
# [4,] 0.5985922 3.3065678 2.1282795 0.6849944
# Create help field `f` with logarithmic slope 1.7
# with `dim(f) = c(8 * 4 ,8 * 4)`
f <- initmetagauss(1.7, 8 * 4)
rd <- downscale(r, f, fsmooth=FALSE) 
# Verify that downscaled data maintained original box averages
agg(rd, 4) 
#           [,1]      [,2]      [,3]      [,4]
# [1,] 1.8459816 1.8536550 2.1600665 1.3102116
# [2,] 1.3851011 1.4647348 0.2708219 0.4571810
# [3,] 0.2492451 0.8227134 0.4790567 1.9320403
# [4,] 0.5985922 3.3065678 2.1282795 0.6849944
}
\author{
Jost von Hardenberg, \email{j.vonhardenberg@isac.cnr.it}
}
