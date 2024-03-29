% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sim_redistrict.R
\name{sim_redistrict}
\alias{sim_redistrict}
\title{sim_redistrict}
\usage{
sim_redistrict(coethnic, crossover, gap = NULL)
}
\arguments{
\item{coethnic}{the level of minority co-ethnic voting}

\item{crossover}{the level of White crossover voting}
}
\value{
A vector of predicted probabilities that minority candidates run for office and win under varying % minority voters
}
\description{
\code{sim_redistrict} simulates the probability of minority candidate emergence when changing the district racial composition
}
\examples{
sim1 <- sim_redistrict(coethnic=0.9, crossover=0)
sim2 <- sim_redistrict(coethnic=0.9, crossover=0.3)

start <- 45
end <- 55
plot(0, type="n", ylim=c(-0.1,1.1),xlim=c(start-5,end+5),
    ylab="Pr(Minority Candidate Emergence)",xlab="C (\% of Minority Voters)",
    mgp=c(2,0.7,0))
lines(sim1, col="seagreen",lwd=2)
lines(sim2, col="maroon",lwd=2)
points(x=start, y=sim1[start], pch=16, cex=2, col=scales::alpha("seagreen",0.9))
points(x=end, y=sim1[end], pch=16, cex=2, col=scales::alpha("seagreen",0.9))
text(x=start, y=sim1[start]-0.09, labels=round(sim1[start],d=3), col="seagreen")
text(x=end, y=sim1[end]-0.09, labels=round(sim1[end],d=3), col="seagreen")
points(x=start, y=sim2[start], pch=16, cex=2, col=scales::alpha("maroon", 0.9))
points(x=end, y=sim2[end], pch=16, cex=2, col=scales::alpha("maroon", 0.9))
text(x=start, y=sim2[start]+0.09, labels=round(sim2[start],d=3), col="maroon")
text(x=end, y=sim2[end]+0.09, labels=round(sim2[end],d=3), col="maroon")
text(x=start+1, y=1.02, labels="Moderate minority co-ethnic voting \n + Moderate White crossover",
     cex=0.8, col="maroon", font=2)
text(x=start+8, y=0.2, labels="Moderate minority co-ethnic voting \n + No White crossover",
     cex=0.8, col="seagreen", font=2)
}
