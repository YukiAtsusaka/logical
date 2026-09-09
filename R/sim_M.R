#' Simulate the Adjusted Racial Margin of Victory
#'
#' Computes adjusted racial margins of victory from minority electorate shares
#' and expected coethnic and crossover voting.
#'
#' @param C Numeric vector of minority electorate percentages, expressed from 0
#'   to 100.
#' @param coethnic Numeric vector containing the proportion of minority voters
#'   expected to support the minority candidate, expressed from 0 to 1.
#' @param crossover Numeric vector containing the proportion of White voters
#'   expected to support the minority candidate, expressed from 0 to 1.
#' @return A numeric vector of simulated adjusted racial margins of victory.
#'   Inputs of length 1 are expanded to the common input length.
#' @inherit comp_M references
#' @examples
#' # Simulate M from substantive assumptions
#' C_hypothetical <- c(40, 50, 60)
#' bloc <- 1        
#' cross <- 0.3     
#'
#' M_vec_sim <- sim_M(C = C_hypothetical, coethnic = bloc, crossover = cross)
#' M_vec_sim
#'
#' minorep(M = M_vec_sim, C = C_hypothetical)
#' @export

sim_M <- function(C, coethnic, crossover) {
  .logical_assert_numeric(C, "C")
  .logical_assert_numeric(coethnic, "coethnic")
  .logical_assert_numeric(crossover, "crossover")
  .logical_assert_range(C, "C", 0, 100)
  .logical_assert_range(coethnic, "coethnic", 0, 1)
  .logical_assert_range(crossover, "crossover", 0, 1)

  inputs <- .logical_recycle_common(
    list(C, coethnic, crossover),
    c("C", "coethnic", "crossover")
  )
  C <- inputs[[1]]
  coethnic <- inputs[[2]]
  crossover <- inputs[[3]]

  minority_vote <- C * coethnic + (100 - C) * crossover
  white_vote <- C * (1 - coethnic) + (100 - C) * (1 - crossover)

  (minority_vote - white_vote) / 2 + 50
}
