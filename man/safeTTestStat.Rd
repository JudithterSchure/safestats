% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tTest.R
\name{safeTTestStat}
\alias{safeTTestStat}
\title{Safe t-test defined at deltaS based on the t-statistic and the sample sizes}
\usage{
safeTTestStat(
  t,
  deltaS,
  n1,
  n2 = NULL,
  alternative = c("two.sided", "less", "greater"),
  tDensity = FALSE,
  paired = FALSE,
  ...
)
}
\arguments{
\item{t}{numeric that represents the observed t-statistic}

\item{deltaS}{numeric this defines the safe test S, i.e., a likelihood ratio of t distributions with in the
denominator the likelihood with delta = 0 and in the numerator an average likelihood defined by
1/2 time the likelihood at the non-centrality parameter sqrt(nEff)*deltaS and 1/2 times the likelihood at the
non-centrality parameter -sqrt(nEff)*deltaS}

\item{n1}{integer that represents the size in a one-sample t-test, (n2=NULL). When n2 is not NULL, this specifies
the size of the first sample for a two-sample test}

\item{n2}{an optional integer that specifies the size of the second sample. If it's left unspecified, thus, NULL it
implies that the t-statistic is based on one-sample}

\item{alternative}{a character string specifying the alternative hypothesis must be one of "two.sided" (default),
"greater" or "less"}

\item{tDensity}{Uses the the representation of the safe t-test as the likelihood ratio of t densities}

\item{paired}{a logical, if TRUE ignores n2, and indicates that a paired t-test is performed}

\item{...}{further arguments to be passed to or from methods.}
}
\value{
Returns a safeTest object
}
\description{
Safe t-test defined at deltaS based on the t-statistic and the sample sizes
}
\examples{
safeTTestStat(t=1, n1=100, 0.4)
safeTTestStat(t=3, n1=100, deltaS=0.3)
}
