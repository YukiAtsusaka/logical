#' @title plot_redistrict
#'
#' @description  \code{plot_redistrict} visualizes the impact of redistricting on minority descriptive representation
#'
#' @param plans a set of outputs from \code{sim_redistrict}
#' @param range the starting and ending points of C over which the model predictions are demonstrated
#'
#' @return A plot representing the substantive change in the probability of minority candidate emergence and electoral success 
#' @examples
#' plan1 <- sim_redistrict(coethnic=1, crossover=0)
#' plan2 <- sim_redistrict(coethnic=1, crossover=0.3)
#' my_plans = cbind(plan1, plan2)
#' my_range = c(44,55) # Changing from 44% to 55%
#' plot_redistrict(plans=my_plans, range=my_range)
#' text(x=start, y=1.1, labels="Moderate white crossover",
#'      cex=1, col="maroon", font=2)
#' text(x=start+10, y=-0.09, labels="No white crossover",
#'      cex=1, col="seagreen", font=2)
#' title("Impact of Increasing % Minority on Minority Success")
#' @export
#' @importFrom scales "alpha"

plot_redistrict <- function(plans, range){

plan1 <- plans[,1] # FIRST PLAN from "redistrict"
plan2 <- plans[,2] # SECOND PLAN from "redistrict"

C = seq(from=1, to=100, by=0.1) # RANGE OF MINORITY PERCENRAGES
start <- range[1] # Starting Point
end <- range[2]   # Ending Point

plot(0, type="n", ylim=c(-0.1,1.1),xlim=c(start-5,end+5),
       ylab="Pr(Minority Electoral Success)",xlab="C (% of Minority Voters)",
       mgp=c(2,0.7,0))
lines(plan1 ~ C, col="seagreen",lwd=4)
lines(plan2 ~ C, col="maroon",lwd=4)
rect(35, -0.2, start, 1.2, col=scales::alpha("gray80", 0.3), lty=0)
rect(end, -0.2, 65, 1.2, col=scales::alpha("gray80", 0.3), lty=0)
 points(x=start, y=plan1[C==start], pch=16, cex=2, col=scales::alpha("seagreen",0.9))
 points(x=end, y=plan1[C==end], pch=16, cex=2, col=scales::alpha("seagreen",0.9))
 text(x=start, y=plan1[C==start]-0.09, labels=round(plan1[C==start],d=3), col="seagreen")
 text(x=end+1, y=plan1[C==end]-0.09, labels=round(plan1[C==end],d=3), col="seagreen")
 points(x=start, y=plan2[C==start], pch=16, cex=2, col=scales::alpha("maroon", 0.9))
 points(x=end, y=plan2[C==end], pch=16, cex=2, col=scales::alpha("maroon", 0.9))
 text(x=start-1, y=plan2[C==start]+0.09, labels=round(plan2[C==start],d=3), col="maroon")
 text(x=end, y=plan2[C==end]+0.09, labels=round(plan2[C==end],d=3), col="maroon")

return()
}
