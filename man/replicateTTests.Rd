% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tTest.R
\name{replicateTTests}
\alias{replicateTTests}
\title{Simulate multiple data sets to show the effects of optional testing for safe (and frequentist) tests.}
\usage{
replicateTTests(
  n1Plan,
  n2Plan = NULL,
  deltaTrue,
  muGlobal = 0,
  sigmaTrue = 1,
  paired = FALSE,
  alternative = c("two.sided", "greater", "less"),
  lowN = 3,
  mIter = 1000L,
  alpha = 0.05,
  safeOptioStop = TRUE,
  deltaS = NULL,
  freqOptioStop = FALSE,
  n1PlanFreq = NULL,
  n2PlanFreq = NULL,
  logging = TRUE,
  seedNumber = NULL,
  pb = TRUE,
  ...
)
}
\arguments{
\item{n1Plan}{integer, that defines the maximum number of samples to plan for (according to the safe test,
use designSafeT to find this)}

\item{n2Plan}{optional integer, that defines the maximum number of samples of the second group to plan for}

\item{deltaTrue}{numeric, the value of the true effect size (test-relevant parameter)}

\item{muGlobal}{numeric, the true global mean of a paired or two-sample t-test. Its value shouldn't matter for the
test. This parameter treated is treated as a nuisance.}

\item{sigmaTrue}{numeric > 0,the true standard deviation of the data. Its value shouldn't matter for the test.
This parameter treated is treated as a nuisance.}

\item{paired}{logical, true if the simulated data are paired.}

\item{alternative}{a character string specifying the alternative hypothesis must be one of "two.sided" (default),
"greater" or "less"}

\item{lowN}{the smallest number of samples (first group) at which monitoring of the tests begins}

\item{mIter}{the number of replications, that is, experiments with max samples n1Plan and n2Plan}

\item{alpha}{the tolerable type I error to be conserved. Also defines the decision rule s > 1/alpha, and for
frequentist tests the decision rule is p < alpha.}

\item{safeOptioStop}{logical, TRUE implies that optional stopping simulation is performed for the safe test}

\item{deltaS}{numeric, the safe test defining deltaS (use designSafeT to find this)}

\item{freqOptioStop}{logical, TRUE implies that optional stopping simulation is performed for the frequentist test}

\item{n1PlanFreq}{integer, that defines the maximum number of samples to plan for (according to the frequentist
test,use designFreqT to find this)}

\item{n2PlanFreq}{optional integer, that defines the maximum number of samples of the second group to plan for}

\item{logging}{logical, if TRUE, then return the sampled sample sizes}

\item{seedNumber}{To set the seed for the simulated data}

\item{pb}{logical, if TRUE, then show progress bar}

\item{...}{further arguments to be passed to or from methods.}
}
\value{
Returns a safeSim object.
}
\description{
Simulate multiple data sets to show the effects of optional testing for safe (and frequentist) tests.
}
\examples{

# Design safe test
alpha <- 0.05
beta <- 0.20
designObj <- designSafeT(1, alpha=alpha, beta=beta)

# Design frequentist test
freqObj <- designFreqT(1, alpha=alpha, beta=beta)

# Simulate under the alternative with deltaTrue=deltaMin
simResults <- replicateTTests(n1Plan=designObj$n1Plan, deltaTrue=1, deltaS=designObj$deltaS,
n1PlanFreq=freqObj$n1PlanFreq)

# Should be about 1-beta
simResults$safeSim$powerAtN1Plan

# This is higher due to optional stopping
simResults$safeSim$powerOptioStop

# Optional stopping allows us to do better than n1PlanFreq once in a while
simResults$safeSim$probLeqN1PlanFreq
graphics::hist(simResults$safeSim$allN, main="Histogram of stopping times", xlab="n1",
breaks=seq.int(designObj$n1Plan))

# Simulate under the alternative with deltaTrue > deltaMin
simResults <- replicateTTests(n1Plan=designObj$n1Plan, deltaTrue=1.5, deltaS=designObj$deltaS,
n1PlanFreq=freqObj$n1PlanFreq)

# Should be larger than 1-beta
simResults$safeSim$powerAtN1Plan

# This is even higher due to optional stopping
simResults$safeSim$powerOptioStop

# Optional stopping allows us to do better than n1PlanFreq once in a while
simResults$safeSim$probLeqN1PlanFreq
graphics::hist(simResults$safeSim$allN, main="Histogram of stopping times", xlab="n1",
breaks=seq.int(designObj$n1Plan))

# Under the null deltaTrue=0
simResults <- replicateTTests(n1Plan=designObj$n1Plan, deltaTrue=0, deltaS=designObj$deltaS,
n1PlanFreq=freqObj$n1PlanFreq, freqOptioStop=TRUE)

# Should be lower than alpha, because if the null is true, P(S > 1/alpha) < alpha for all n
simResults$safeSim$powerAtN1Plan

# This is a bit higher due to optional stopping, but if the null is true,
# then still P(S > 1/alpha) < alpha for all n
simResults$safeSim$powerOptioStop

# Should be lowr than alpha, as the experiment is performed as was planned
simResults$freqSim$powerAtN1Plan

# This is larger than alpha, due to optional stopping.
simResults$freqSim$powerOptioStop
 simResults$freqSim$powerOptioStop > alpha
}
