#' Simulate Redistricting Predictions
#'
#' Simulates minority candidate emergence and electoral success as district
#' racial composition varies from 1 to 100 percent.
#'
#' @param coethnic Numeric value from 0 to 1 giving the proportion of minority
#'   voters expected to support the minority candidate.
#' @param crossover Numeric value from 0 to 1 giving the proportion of White
#'   voters expected to support the minority candidate.
#' @param gap Optional length-two numeric vector containing minority and White
#'   turnout rates, each expressed from 0 to 1.
#'
#' @return A numeric vector of 991 predicted probabilities corresponding to
#'   minority electorate percentages from 1 to 100 in increments of 0.1.
#' @inherit comp_M references
#' @examples
#' sim1 <- sim_redistrict(coethnic = 0.9, crossover = 0)
#' sim2 <- sim_redistrict(coethnic = 0.9, crossover = 0.3)
#' 
#' start <- 45
#' end <- 55
#' plot_redistrict(cbind(sim1, sim2), range = c(start, end))
#' @export 

sim_redistrict <- function(coethnic, crossover, gap = NULL) {
  .logical_assert_numeric(coethnic, "coethnic", length = 1L)
  .logical_assert_numeric(crossover, "crossover", length = 1L)
  .logical_assert_range(coethnic, "coethnic", 0, 1)
  .logical_assert_range(crossover, "crossover", 0, 1)
  .logical_validate_gap(gap)

  C <- seq(from = 1, to = 100, by = 0.1)
  C_adjusted <- .logical_adjust_turnout(C, gap)
  M <- sim_M(C_adjusted, coethnic, crossover)
  q <- sqrt(C_adjusted * M) - 50

  stats::pnorm(q, mean = 0, sd = 1)
}
