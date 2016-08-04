\name{honestCoTest.causalTree}
\alias{honestCoTest.causalTree}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Honest Cotest Estimation of Causal Effect
}
\description{
Estimate treatment effects using cotest, where cotest set of a data point including all data in the same leaf except for itself.
}
\usage{
honestCoTest.causalTree(M, object, data, weights, treatment, na.action = na.causalTree)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{M}{
  The minimum number of treated cases and controlled cases in the final leaf for cotest.
}
  \item{object}{
A tree-structured fit \code{rpart} object, such as one generated as a \code{causalTree} fit.
}
  \item{data}{
New data frame for estimating causal effects.
}
  \item{weights}{
Weights of the new data frame, and the default is uniform weights.
}
  \item{treatment}{
Treatment status vector of the new data frame.
}
}


\value{
A vector of honest cotest estimate of causal effect for each data.
}


%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
tree <- causalTree(y~ x1 + x2 + x3 + x4, data = simulation.1, treatment = simulation.1$treatment,
                  split.Rule = "CT", cv.option = "CT", split.Honest = T, cv.Honest = T, split.Bucket = F, xval = 5, 
                  cp = 0, minsize = 20, propensity = 0.5)
                  
opcp <- tree$cptable[,1][which.min(tree$cptable[,4])]

opfit <- prune(tree, opcp)

coEstimate <- honestCoTest.causalTree(15, opfit, data = simulation.2, treatment = simulation.2$treatment)

  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.

