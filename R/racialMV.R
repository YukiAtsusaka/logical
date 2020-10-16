#' @title margin
#'
#' @description  \code{margin} computes the racial margin of victory given the vote shares for the top minority and White candidates
#'
#' @param Vm a vector of the vote share (in %) for the top minority candidate
#' @param Vw a vector of the vote share (in %) for the top White candidate
#' @return A list containing the racial margin of victory
#' @examples
#' topBlack = c(18, 40, 85, 20)
#' topWhite = c(60, 40, 10, 34)
#' m <- margin(Vm=topBlack, Vw=topWhite)
#' hist(m)
#' @export

margin <- function(Vm, Vw){

# if( (Vm+Vw)>100 ){
# print("Some vote shares sum up to more than 100. \n Please check your input vectors.")
# }else{
  
out <- (1/2)*(Vm - Vw) + 50
# }  

return(out)
}
