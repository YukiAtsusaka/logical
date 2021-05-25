#' @title comp_M
#'
#' @description  \code{comp_M} computes the racial margin of victory given the vote shares for the top minority and White candidates
#'
#' @param Vm a vector of the vote share in percent for the top minority candidate
#' @param Vw a vector of the vote share in percent for the top White candidate
#' 
#' @return A vector of the racial margin of victories based on observed vote shares
#' @examples
#' top_minority <- c(18, 40, 85, 20) # Top minority candidate's vote share in four districts
#' top_white <- c(60, 40, 10, 34)    # Top white candidate's vote share in four districts
#' 
#' M_vec_obs <- comp_M(Vm = top_minority, Vw = top_white) # Compute the (adjusted) racial margin of victor
#' minorep(M = M_vec_obs, C = c(50, 45, 65, 35))
#' @export

comp_M <- function(Vm, Vw){

if( (Vm+Vw)>100 ){
print("Some vote shares sum up to more than 100. \n Please check your input vectors.")
}else{
out <- (1/2)*(Vm - Vw) + 50 # (Adjusted) Racial Margin of Victory
}  

return(out)
}
