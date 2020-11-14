#' @title redistrict
#'
#' @description  \code{redistrict} simulates the probability of minority candidate emergence when changing the district racial composition
#'
#' @param coethnic the level of minority co-ethnic voting
#' @param crossover the level of White crossover voting
#'
#' @return A list containing main results ($Results) and related statistics ($Stats).
#' @examples
#' out <- redistrict(coethnic=0.9, crossover=0.3, sd=5)
#' out2 <- redistrict(coethnic=0.9, crossover=0.6, sd=5)
#' plot(0, type="n", ylim=c(0,1.1),xlim=c(45,65),
#'     ylab="Pr(Minority Candidate Emergence)",xlab="C (% of Minority Voters)",
#'     mgp=c(2,0.7,0))
#' lines(out, col="seagreen",lwd=2)
#' lines(out2, col="maroon",lwd=2)
#' points(x=50, y=out[50], pch=16, cex=2, col=scales::alpha("seagreen",0.9))
#' points(x=60, y=out[60], pch=16, cex=2, col=scales::alpha("seagreen",0.9))
#' text(x=50, y=out[50]-0.09, labels=round(out[50],d=3), col="seagreen")
#' text(x=60, y=out[60]-0.09, labels=round(out[60],d=3), col="seagreen")
#' points(x=50, y=out2[50], pch=16, cex=2, col=scales::alpha("maroon", 0.9))
#' points(x=60, y=out2[60], pch=16, cex=2, col=scales::alpha("maroon", 0.9))
#' text(x=50, y=out2[50]+0.09, labels=round(out2[50],d=3), col="maroon")
#' text(x=60, y=out2[60]+0.09, labels=round(out2[60],d=3), col="maroon")
#' @export 

redistrict <- function(coethnic, crossover, sd){

C.tilde = seq(from=1, to=100, by=1) 
V_m = C.tilde*coethnic + ((100-C.tilde)*crossover)
V_w = C.tilde*(1-coethnic) + ((100-C.tilde)*(1-crossover))
M.tilde = 1/2*(V_m - V_w) + 50 

MC.sqrt.min50 = sqrt(C.tilde*M.tilde) - 50  # GEOMETRIC MEAN  
P  <- pnorm(MC.sqrt.min50, mean=0, sd=sd)   # Probability of Candidate Emergence

return(P)
}
