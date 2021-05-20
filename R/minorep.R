#' @title minorep
#'
#' @description  \code{minorep} computes a vector of probabilities that minority candidate emerges given M and C
#'
#' @param M a vector of raw margin of victories
#' @param C a vector of the percentages of minority voters in districts
#' @param gap a vector of the turnout rates of minority and White voters
#'
#' @return A list containing main results ($Results) and related statistics ($Stats).
#' @examples
#' M_vec = c(20, 50, 30)
#' C_vec = c(40, 70, 85)
#' minorep(M=M_vec, C=C_vec) # Assuming no turnout gap
#' minorep(M=M_vec, C=C_vec, gap=c(0.5, 0.6)) # Assuming that minority turnout is 0.5 and White turnout is 0.6 
#' @export

minorep <- function(M, C, gap=NULL){

# Computing Turnout Adjusted Percentage of Minority Voters
if(is.null(gap)){
C = C
}else{
C = (C*gap[1])/(C*gap[1] + (100-C)*gap[2])*100
}

q = sqrt(M*C) - 50             # Geometric mean of the two bounds
p = pnorm(q=q,  mean=0, sd=1)  # Model prediction
  
return(p)
}
