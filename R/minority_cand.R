#' @title minority_cand
#'
#' @description  \code{minority_cand} computes a vector of probabilities that minority candidate emerges given M and C
#'
#' @param M a vector of raw margin of victories
#' @param C a vector of the percentages of minority voters in districts
#' @param sd the pre-specified value of the standard deviation in F
#'
#' @return A list containing main results ($Results) and related statistics ($Stats).
#' @examples
#' rmargin = c(20, 50, 30)
#' percent = c(40, 70, 85)
#' emerge_prob(M=rmargin, C=percent)
#' emerge_prob(M=rmargin, C=percent, sd=5)
#' @export

emerge_prob <- function(M, C, sd=1){

sd=sd
q = sqrt((M+50)*C) - 50 # GEOMETRIC MEAN
p = pnorm(q=q,  mean=0, sd=sd)
  
return(p)
}
