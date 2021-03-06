% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/interpola.R
\name{interpola}
\alias{interpola}
\title{Interpolate field using nearest neighbors}
\usage{
interpola(z, ns)
}
\arguments{
\item{z}{matrix containing the input field at coarse resolution.}

\item{ns}{the target size.}
}
\value{
The resulting fine-scale field with dimensions \code{c(ns, ns)}.
}
\description{
Interpolates a square input matrix to a finer
resolution \code{ns} using nearest neighbours.
}
\examples{
za <- rnorm(4 * 4)
dim(za) <- c(4, 4)
z <- interpola(za, 16)
dim(z)
# [1] 16 16
}
\author{
Jost von Hardenberg, \email{j.vonhardenberg@isac.cnr.it}
}
