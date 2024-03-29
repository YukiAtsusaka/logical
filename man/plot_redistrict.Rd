% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_redistrict.R
\name{plot_redistrict}
\alias{plot_redistrict}
\title{plot_redistrict}
\usage{
plot_redistrict(plans, range)
}
\arguments{
\item{plans}{a set of outputs from \code{sim_redistrict}}

\item{range}{the starting and ending points of C over which the model predictions are demonstrated}
}
\value{
A plot representing the substantive change in the probability of minority candidate emergence and electoral success
}
\description{
\code{plot_redistrict} visualizes the impact of redistricting on minority descriptive representation
}
\examples{
plan1 <- sim_redistrict(coethnic=1, crossover=0)
plan2 <- sim_redistrict(coethnic=1, crossover=0.3)
my_plans = cbind(plan1, plan2)
my_range = c(44,55) # Changing from 44\% to 55\%
plot_redistrict(plans=my_plans, range=my_range)
text(x=start, y=1.1, labels="Moderate white crossover",
     cex=1, col="maroon", font=2)
text(x=start+10, y=-0.09, labels="No white crossover",
     cex=1, col="seagreen", font=2)
title("Impact of Increasing \% Minority on Minority Success")
}
