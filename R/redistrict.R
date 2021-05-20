#' @title redistrict
#'
#' @description  \code{redistrict} simulates the probability of minority candidate emergence when changing the district racial composition
#'
#' @param coethnic the level of minority co-ethnic voting
#' @param crossover the level of White crossover voting
#'
#' @return A vector of predicted probabilities that minority candidates run for office and win under varying % minority voters
#' @examples
#' sim1 <- redistrict(coethnic=0.9, crossover=0)
#' sim2 <- redistrict(coethnic=0.9, crossover=0.3)
#' 
#' start <- 45
#' end <- 55
#' plot(0, type="n", ylim=c(-0.1,1.1),xlim=c(start-5,end+5),
#'     ylab="Pr(Minority Candidate Emergence)",xlab="C (% of Minority Voters)",
#'     mgp=c(2,0.7,0))
#' lines(sim1, col="seagreen",lwd=2)
#' lines(sim2, col="maroon",lwd=2)
#' points(x=start, y=sim1[start], pch=16, cex=2, col=scales::alpha("seagreen",0.9))
#' points(x=end, y=sim1[end], pch=16, cex=2, col=scales::alpha("seagreen",0.9))
#' text(x=start, y=sim1[start]-0.09, labels=round(sim1[start],d=3), col="seagreen")
#' text(x=end, y=sim1[end]-0.09, labels=round(sim1[end],d=3), col="seagreen")
#' points(x=start, y=sim2[start], pch=16, cex=2, col=scales::alpha("maroon", 0.9))
#' points(x=end, y=sim2[end], pch=16, cex=2, col=scales::alpha("maroon", 0.9))
#' text(x=start, y=sim2[start]+0.09, labels=round(sim2[start],d=3), col="maroon")
#' text(x=end, y=sim2[end]+0.09, labels=round(sim2[end],d=3), col="maroon")
#' text(x=start+1, y=1.02, labels="Moderate minority co-ethnic voting \n + Moderate White crossover",
#'      cex=0.8, col="maroon", font=2)
#' text(x=start+8, y=0.2, labels="Moderate minority co-ethnic voting \n + No White crossover",
#'      cex=0.8, col="seagreen", font=2)
#' @export 

redistrict <- function(coethnic, crossover, gap=NULL){

# A vector of % minority voters
C = seq(from=1, to=100, by=0.1) 
    
# Turnout adjusted % of minority voters
if(is.null(gap)){
C = C
}else{
C = (C*gap[1])/(C*gap[1] + (100-C)*gap[2])*100
}
  
# Simulated Racial Margin of Victory
V_m = C*coethnic + ((100-C)*crossover)
V_w = C*(1-coethnic) + ((100-C)*(1-crossover))
M = 1/2*(V_m - V_w) + 50 

q = sqrt(C*M) - 50            # Geometric mean of the two bounds
out <- pnorm(q, mean=0, sd=1) # Model prediction

return(out)
}

