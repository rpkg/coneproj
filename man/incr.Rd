\name{incr}

\alias{incr}

\title{Specify an Increasing Shape-Restriction in a SHAPEREG Formula}

\description{
A symbolic routine to define that the mean vector is increasing in a predictor in a formula argument to shapereg.}

\usage{incr(x)}

\arguments{
  \item{x}{A numeric predictor which has the same length as the response vector.}
}

\value{The vector x with two attributes, i.e., name: the name of x; shape: 1 ("increasing").}

\details{
  "incr" returns the vector "x" and imposes on it two attributes: name and shape. 

  The shape attribute is 1 ("increasing"), and according to the value of the vector itself and this attribute, the cone edges of the cone generated by the constraint matrix, which constrains the relationship between the mean vector and "x" to be increasing,  will be made. The cone edges are a set of basis employed in the hinge algorithm. 

  Note that "incr" does not make the corresponding cone edges itself. It sets things up to a subroutine called makedelta in coneproj.

  See references cited in this section for more details.
}

\references{
  Meyer, M. C. (2013b) A simple new algorithm for quadratic programming with applications in statistics. \emph{Communications in Statistics \bold{42(5)}}, 1126--1139. 
}

\author{
  Mary C. Meyer and Xiyue Liao
}

\examples{
  data(cubic)

  # extract x
  x <- cubic$x

  # extract y
  y <- cubic$y

  # regress y on x with the shape restriction: "increasing"
  ans <- shapereg(y ~ incr(x))

  # make a plot
  par(mar = c(4, 4, 1, 1))
  plot(x, y, cex = .7, xlab = "x", ylab = "y")
  lines(x, fitted(ans), col = 2)
  legend("topleft", bty = "n", "shapereg: increasing fit", col = 2, lty = 1)
}

\seealso{
  \code{\link{incr.conc}}, \code{\link{incr.conv}}
}

\keyword{shape routine}
