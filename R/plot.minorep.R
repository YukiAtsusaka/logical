#' @title plot.minorep
#'
#' @description  \code{plot.minorep} visualizes the probability of minority candidate emergence and electoral success with given M and C
#'
#' @param M a vector of raw margin of victories
#' @param C a vector of the percentages of minority voters in districts
#'
#' @return A list containing main results ($Results) and related statistics ($Stats).
#' @examples
#' rmargin = c(20, 50, 30)
#' VAP = c(40, 70, 85)
#' plot.minorep(M=rmargin, C=VAP)
#' @export

plot.minorep <- function(M, C, pch=NULL){

point.M <- M
point.C <- C
pch <- ifelse(is.na(pch),1,pch)
  
# MODEL PREDICTION MATRIX
M_vec <- seq(from=0, to=100, by=1)    # Racial Margin of Victory
C_vec <- seq(from=0, to=100, by=1)    # % Minority Voters
Mt <- matrix(NA, ncol=101, nrow=101)  # MATRIX FOR PREDICTED PROBABILITY
                                      # row=C, col=M
for(j in seq_along(M_vec)){  # LOOP OVER M
 M <- M_vec[j]
for(i in seq_along(C_vec)){  # LOOP OVER C
 C <- C_vec[i]   
 q <- sqrt(M*C) - 50
Mt[i,j] <- pnorm(q=q, mean=0, sd=1)   # Prob(minority candidate emergence/electoral success)
}
}


filled.contour(x=M_vec,y=C_vec,z=Mt, 
               xlim=c(-2,102), ylim=c(0,100),
               plot.axes =
                 {points(point.M,point.C, pch=pch)
                  axis(1, seq(0, 100, by = 25))
                  axis(2, seq(0, 100, by = 20))},
               col=rev(scales::alpha(brewer.pal(n=10, name="Spectral"),0.75)), nlevels=10,
               plot.title = title(xlab="M (Racial Margin of Victory)",
                                  ylab="C (% Black Voters)"))
return()
}
