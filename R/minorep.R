#' Predict Minority Candidate Emergence and Electoral Success
#'
#' Computes district-level probabilities of minority candidate emergence and
#' electoral success under the logical model.
#'
#' @param M Numeric vector of adjusted racial margins of victory, expressed from
#'   0 to 100.
#' @param C Numeric vector of minority electorate percentages, expressed from 0
#'   to 100.
#' @param sd Positive numeric scalar describing candidate uncertainty about the
#'   probability of winning.
#' @param gap Optional length-two numeric vector containing minority and White
#'   turnout rates, each expressed from 0 to 1.
#'
#' @return A numeric vector of predicted probabilities, rounded to four decimal
#'   places. Inputs of length 1 are expanded to the common input length.
#' @inherit comp_M references
#' @examples
#' M_vec <- c(20, 50, 30)
#' C_vec <- c(40, 70, 85)
#' minorep(M = M_vec, C = C_vec)
#'
#' minorep(
#'   M = M_vec,
#'   C = C_vec,
#'   gap = c(0.5, 0.6)
#' )
#' @export

minorep <- function(M, C, sd = 1, gap = NULL) {
  .logical_assert_numeric(M, "M")
  .logical_assert_numeric(C, "C")
  .logical_assert_numeric(sd, "sd", length = 1L)
  .logical_assert_range(M, "M", 0, 100)
  .logical_assert_range(C, "C", 0, 100)
  if (sd <= 0) {
    stop("`sd` must be greater than zero.", call. = FALSE)
  }
  .logical_validate_gap(gap)

  inputs <- .logical_recycle_common(list(M, C), c("M", "C"))
  M <- inputs[[1]]
  C <- .logical_adjust_turnout(inputs[[2]], gap)

  q <- sqrt(M * C) - 50
  probability <- stats::pnorm(q = q, mean = 0, sd = sd)

  round(probability, digits = 4)
}
