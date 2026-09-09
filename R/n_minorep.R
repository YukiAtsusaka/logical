#' Simulate the Number of Minority Officeholders
#'
#' Draws the number of minority candidates who emerge and win across a set of
#' districts using district-level probabilities from [minorep()].
#'
#' @param model_pred Numeric vector of probabilities from 0 to 1, typically
#'   obtained from [minorep()].
#'
#' @return An integer vector containing 1,000 simulated jurisdiction-level counts.
#' @inherit comp_M references
#' @examples
#' M_vec <- c(20, 50, 30)
#' C_vec <- c(40, 70, 85)
#' p_vec <- minorep(M = M_vec, C = C_vec, gap = c(0.5, 0.6))
#' n_minorep(model_pred = p_vec)
#' @export

n_minorep <- function(model_pred) {
  .logical_assert_numeric(model_pred, "model_pred")
  .logical_assert_range(model_pred, "model_pred", 0, 1)

  vapply(
    seq_len(1000L),
    function(i) sum(stats::rbinom(length(model_pred), size = 1, prob = model_pred)),
    integer(1)
  )
}
