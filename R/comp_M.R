#' @title comp_M
#'
#' @description  \code{comp_M} computes the racial margin of victory given the vote shares for the top minority and White candidates
#'
#' @param Vm a vector of the vote share (in %) for the top minority candidate
#' @param Vw a vector of the vote share (in %) for the top White candidate
#' @return A vector of the (adjusted) racial margin of victories
#' @examples
#' top_minority = c(18, 40, 85, 20) # Vote share (in %)of the top minority candidates in four districts
#' top_white = c(60, 40, 10, 34)    # Vote share (in %)of the top White candidates in the same districts
#' m <- comp_M(Vm=top_minority, Vw=top_white)
#' hist(m)
#' @export

comp_M <- function(Vm, Vw){

if( (Vm+Vw)>100 ){
print("Some vote shares sum up to more than 100. \n Please check your input vectors.")
}else{
out <- (1/2)*(Vm - Vw) + 50 # (Adjusted) Racial Margin of Victory
}  

return(out)
}
