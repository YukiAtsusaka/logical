#' @title sim_M
#'
#' @description  \code{sim_M} simulates the values of the (adjusted) racial margin of victory based on the expected level of coethnic and crossover voting
#'
#' @param C a scalar denoting the (turnout adjusted) percentages of minority voters in a district of interest
#' @param coethnic a scaler denoting the proportion of minority voters who would vote for the minority candidate in biracial elections with a single minority and White candidates.
#' @param crossover a scaler denoting the proportion of White voters who would vote for the minority candidate in biracial elections with a single minority and White candidates.#' @return A vector of predicted probabilities that minority candidates run for office and win in given districts (defined by M and C)
#' @examples
#' sim_M(C=40, coethnic=1, crossover=0.3) 
#' @export


sim_M <- function(C, coethnic, crossover){
   
V_m = C*coethnic + ((100-C)*crossover)         # Simulated vote share for the top minority candidate
V_w = C*(1-coethnic) + ((100-C)*(1-crossover)) # Simulated vote share for the top White candidate
M = 1/2*(V_m - V_w) + 50                       # Simulated racial margin of victory

return(M)   
}
