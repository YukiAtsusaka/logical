#' @title plot_sweetspot
#'
#' @description  \code{plot_sweetspot} visualizes the impact of redistricting on minority descriptive representation
#'
#' @param plan a set of outputs from \code{sim_redistrict}
#' @param threshold a pre-specified threshold for the probability of minority electoral success
#' @param range the starting and ending points of C over which the model predictions are demonstrated
#' @param C.prime a percentage of minority voters in a district of interest
#'
#' @return A plot showing the sweet spot of redistricting under a given district plan and a pre-specified threshold as well as the potential level of minority vote dilution via packing
#' @examples
#' plan_1 <- sim_redistrict(coethnic=0.9, crossover=0.2) 
#' plot_sweetspot(plan=plan_1, range=c(30,70),threshold=0.8, C.prime=70)
#' text(x=59, y=0.6, labels="Degree of \nPotential Vote Dilution \n(C'-Sweet Spot)",
#'      cex=1, col="dimgray", font=1)
#' text(x=64, y=0.2, labels="C'\n(District Plan \nof Interest)",
#'      cex=1, col="dimgray", font=2)
#' arrows(x0=65.5, x1=69,
#'        y0=0.28, y1=0.28, col="dimgray", lwd=1, length=0.1)      
#' @export


plot_sweetspot <- function(plan, threshold, range, C.prime=NULL){
  
# Neccesary entries
C <- seq(from=1, to=100, by=0.1) # % minority voters over which we draw the plot


# Making a plot
plot(0, type="n",                         # Empty plot
     ylim=c(-0.1,1.1),
     xlim=range,
     ylab="Pr(Minority Electoral Success)", 
     xlab="C (% of Minority Voters)",
     mgp=c(2,0.7,0), cex.lab=1.2)
lines(plan ~ C, col="maroon",lwd=4)       # Model predictions over C
abline(h=threshold, lty=2, col="dimgray") # Horizontal line for threshold

sweet_spot = min(C[plan>=threshold])      # Sweet Spot under plan


# Computing C.prime if not provided: C under a given distrcit plan
if(is.null(C.prime)){
C.prime = sweet_spot
}else{
C.prime = C.prime
}


rect(sweet_spot, -0.2, C.prime, 1.2,          # Visualizing the potential vote dilution
     col=alpha("gray80", 0.5), lty=0)
abline(v=C.prime, lwd=2, col="gray60", lty=2) # C under a given district plan
arrows(x0=sweet_spot, x1=sweet_spot,          # Vertical line for the sweet spot
       y0=threshold, y1=-0.05, 
       col="maroon", lwd=1, length=0.1, lty=1)
points(x=sweet_spot, y=threshold,             # Add a point for the sweet spot
       cex=1.5, pch=16, col="maroon")    
text(x=sweet_spot, y=-0.1,                    # Add a percentage for the sweet spot
     labels=paste0(sweet_spot, "% (Sweet Spot)"), 
     col="maroon", font=2)
text(x=range[1]+7,y=threshold-0.1, 
     labels="Pre-specified \nThreshold", font=2, col="dimgray")

return()
}
