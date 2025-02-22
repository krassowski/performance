% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_model.R
\name{check_model}
\alias{check_model}
\alias{check_model.default}
\title{Visual check of model assumptions}
\usage{
check_model(x, ...)

\method{check_model}{default}(
  x,
  dot_size = 2,
  line_size = 0.8,
  panel = TRUE,
  check = "all",
  alpha = 0.2,
  dot_alpha = 0.8,
  colors = c("#3aaf85", "#1b6ca8", "#cd201f"),
  theme = "see::theme_lucid",
  detrend = FALSE,
  verbose = TRUE,
  ...
)
}
\arguments{
\item{x}{A model object.}

\item{...}{Currently not used.}

\item{dot_size, line_size}{Size of line and dot-geoms.}

\item{panel}{Logical, if \code{TRUE}, plots are arranged as panels; else,
single plots for each diagnostic are returned.}

\item{check}{Character vector, indicating which checks for should be performed
and plotted. May be one or more of \code{"all"}, \code{"vif"}, \code{"qq"}, \code{"normality"},
\code{"linearity"}, \code{"ncv"}, \code{"homogeneity"}, \code{"outliers"}, \code{"reqq"}, \code{"pp_check"},
\code{"binned_residuals"} or \code{"overdispersion"}, Not that not all check apply
to all type of models (see 'Details'). \code{"reqq"} is a QQ-plot for random
effects and only available for mixed models. \code{"ncv"} is an alias for
\code{"linearity"}, and checks for non-constant variance, i.e. for
heteroscedasticity, as well as the linear relationship. By default, all
possible checks are performed and plotted.}

\item{alpha, dot_alpha}{The alpha level of the confidence bands and dot-geoms.
Scalar from 0 to 1.}

\item{colors}{Character vector with color codes (hex-format). Must be of
length 3. First color is usually used for reference lines, second color
for dots, and third color for outliers or extreme values.}

\item{theme}{String, indicating the name of the plot-theme. Must be in the
format \code{"package::theme_name"} (e.g. \code{"ggplot2::theme_minimal"}).}

\item{detrend}{Should QQ/PP plots be detrended?}

\item{verbose}{Toggle off warnings.}
}
\value{
The data frame that is used for plotting.
}
\description{
Visual check of model various assumptions (normality of residuals, normality
of random effects, linear relationship, homogeneity of variance,
multicollinearity).
}
\details{
For Bayesian models from packages \strong{rstanarm} or \strong{brms},
models will be "converted" to their frequentist counterpart, using
\href{https://easystats.github.io/bayestestR/reference/convert_bayesian_as_frequentist.html}{\code{bayestestR::bayesian_as_frequentist}}.
A more advanced model-check for Bayesian models will be implemented at a
later stage.
}
\note{
This function just prepares the data for plotting. To create the plots,
\CRANpkg{see} needs to be installed. Furthermore, this function suppresses
all possible warnings. In case you observe suspicious plots, please refer
to the dedicated functions (like \code{check_collinearity()},
\code{check_normality()} etc.) to get informative messages and warnings.
}
\section{Linearity Assumption}{

The plot \strong{Linearity} checks the assumption of linear relationship.
However, the spread of dots also indicate possible heteroscedasticity (i.e.
non-constant variance); hence, the alias \code{"ncv"} for this plot.
\strong{Some caution is needed} when interpreting these plots. Although these
plots are helpful to check model assumptions, they do not necessarily
indicate so-called "lack of fit", e.g. missed non-linear relationships or
interactions. Thus, it is always recommended to also look at
\href{https://strengejacke.github.io/ggeffects/articles/introduction_partial_residuals.html}{effect plots, including partial residuals}.
}

\section{Residuals for (Generalized) Linear Models}{

Plots that check the normality of residuals (QQ-plot) or the homogeneity of
variance use standardized Pearson's residuals for generalized linear models,
and standardized residuals for linear models. The plots for the normality of
residuals (with overlayed normal curve) and for the linearity assumption use
the default residuals for \code{lm} and \code{glm} (which are deviance
residuals for \code{glm}).
}

\examples{
\dontrun{
m <- lm(mpg ~ wt + cyl + gear + disp, data = mtcars)
check_model(m)

if (require("lme4")) {
  m <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)
  check_model(m, panel = FALSE)
}

if (require("rstanarm")) {
  m <- stan_glm(mpg ~ wt + gear, data = mtcars, chains = 2, iter = 200)
  check_model(m)
}
}
}
