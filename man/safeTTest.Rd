% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tTest.R
\name{safeTTest}
\alias{safeTTest}
\title{Safe Student's t-test.}
\usage{
safeTTest(
  x,
  y = NULL,
  designObj = NULL,
  alternative = c("two.sided", "less", "greater"),
  mu0 = 0,
  paired = FALSE,
  varEqual = TRUE,
  confLevel = 0.95,
  pilot = FALSE,
  alpha = 0.05,
  ...
)
}
\arguments{
\item{x}{a (non-empty) numeric vector of data values}

\item{y}{an optional (non-empty) numeric vector of data values}

\item{designObj}{an object from designSafeT, or NULL, when pilot=TRUE}

\item{alternative}{a character string specifying the alternative hypothesis must be one of "two.sided" (default),
"greater" or "less"}

\item{mu0}{a number indicating the hypothesised true value of the mean under the null. For the moment mu0=0}

\item{paired}{a logical indicating whether you want to paired t-test.}

\item{varEqual}{a logical variable indicating whether to treat the two variances as being equal. For the moment,
this is always TRUE.}

\item{confLevel}{confidence level of the interval. Not yet implemented}

\item{pilot}{a logical indicating whether a pilot study is run. If TRUE, it is assumed that the number of samples is
exactly as planned.}

\item{alpha}{numeric representing the tolerable type I error rate. This also serves as a decision rule and it was
shown that for safe tests S we have P(S > 1/alpha) < alpha under the null.}

\item{...}{further arguments to be passed to or from methods.}
}
\value{
Returns a safeTest object
}
\description{
A safe version of t.test to perform one and two sample t-tests on vectors of data
}
\examples{
designObj <- designSafeT(deltaMin=0.6, alpha=0.008, alternative="greater",
testType="twoSampleT", sampleSizeRatio=1.2)

set.seed(1)
x <- rnorm(100)
y <- rnorm(100)
safeTTest(x, y, alternative="greater", designObj=designObj)      #0.2959334

safeTTest(1:10, y = c(7:20), pilot=TRUE)      # s = 3121.604 > 1/alpha
}
