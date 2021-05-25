#' @title sim_M
#'
#' @description  \code{sim_M} simulates the values of the (adjusted) racial margin of victory based on the expected level of coethnic and crossover voting
#'
#' @param C a scalar denoting the (turnout adjusted) percentages of minority voters in a district of interest
#' @param coethnic a scaler denoting the proportion of minority voters who would vote for the minority candidate in biracial elections with a single minority and White candidates.
#' @param crossover a scaler denoting the proportion of White voters who would vote for the minority candidate in biracial elections with a single minority and White candidates.
#' @return A vector of the racial margin of victories based on substantive knowledge on the levels of minority bloc and crossover voting
#' @examples
#' Simulating M from substantive knowledge
#' C_hypothetical <- c(40,50,60)  # Hypothetical percentages of % minority voters
#' bloc <- 1        # Proportion of minority voters who vote for a single (hypothetical) minority candidate
#' cross <- 0.3     # Proportion of white voters who vote for a single (hypothetical) minority candidate
#'
#' M_vec_sim <- sim_M(C = C_hypothetical, coethnic = bloc, crossover = cross)
#' M_vec_sim
#'
#'minorep(M = M_vec_sim, C = C_hypothetical)
#' @export


sim_M <- function(C, coethnic, crossover){
   
V_m = C*coethnic + ((100-C)*crossover)         # Simulated vote share for the top minority candidate
V_w = C*(1-coethnic) + ((100-C)*(1-crossover)) # Simulated vote share for the top White candidate
M = 1/2*(V_m - V_w) + 50                       # Simulated racial margin of victory

return(M)   
}
