% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/model_performance.rma.R
\name{model_performance.rma}
\alias{model_performance.rma}
\title{Performance of Meta-Analysis Models}
\usage{
\method{model_performance}{rma}(
  model,
  metrics = "all",
  estimator = "ML",
  verbose = TRUE,
  ...
)
}
\arguments{
\item{model}{A \code{rma} object as returned by \code{metafor::rma()}.}

\item{metrics}{Can be \code{"all"} or a character vector of metrics to be
computed (some of \code{c("AIC", "BIC", "I2", "H2", "TAU2", "R2", "CochransQ", "QE", "Omnibus", "QM")}).}

\item{estimator}{Only for linear models. Corresponds to the different
estimators for the standard deviation of the errors. If \code{estimator = "ML"}
(default), the scaling is done by n (the biased ML estimator), which is
then equivalent to using \code{AIC(logLik())}. Setting it to \code{"REML"} will give
the same results as \code{AIC(logLik(..., REML = TRUE))}.}

\item{verbose}{Toggle off warnings.}

\item{...}{Arguments passed to or from other methods.}
}
\value{
A data frame (with one row) and one column per "index" (see
\code{metrics}).
}
\description{
Compute indices of model performance for meta-analysis model from the
\pkg{metafor} package.
}
\details{
\subsection{Indices of fit}{
\itemize{
\item{\strong{AIC}} {Akaike's Information Criterion, see
\code{?stats::AIC}}

\item{\strong{BIC}} {Bayesian Information Criterion, see
\code{?stats::BIC}}

\item \strong{I2}: For a random effects model, \code{I2} estimates (in
percent) how much of the total variability in the effect size estimates
can be attributed to heterogeneity among the true effects. For a
mixed-effects model, \code{I2} estimates how much of the unaccounted
variability can be attributed to residual heterogeneity.

\item \strong{H2}: For a random-effects model, \code{H2} estimates the
ratio of the total amount of variability in the effect size estimates to
the amount of sampling variability. For a mixed-effects model, \code{H2}
estimates the ratio of the unaccounted variability in the effect size
estimates to the amount of sampling variability.

\item \strong{TAU2}: The amount of (residual) heterogeneity in the random
or mixed effects model.

\item \strong{CochransQ (QE)}: Test for (residual) Heterogeneity. Without
moderators in the model, this is simply Cochran's Q-test.

\item \strong{Omnibus (QM)}: Omnibus test of parameters.

\item \strong{R2}: Pseudo-R2-statistic, which indicates the amount of
heterogeneity accounted for by the moderators included in a fixed-effects
model.
}
See the documentation for \code{?metafor::fitstats}.
}
}
\examples{
if (require("metafor")) {
  data(dat.bcg)
  dat <- escalc(measure = "RR", ai = tpos, bi = tneg, ci = cpos, di = cneg, data = dat.bcg)
  model <- rma(yi, vi, data = dat, method = "REML")
  model_performance(model)
}
}
