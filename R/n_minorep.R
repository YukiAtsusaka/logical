#' Simulate the Number of Minority Officeholders
#'
#' Draws the number of minority candidates who emerge and win across a set of
#' districts using district-level probabilities from [minorep()].
#'
#' @param model_pred Numeric vector of probabilities from 0 to 1, typically
#'   obtained from [minorep()].
#' @param n_sim Positive whole number giving the number of simulated
#'   jurisdiction-level counts to return.
#' @param seed Optional whole number used to reproduce the simulation. When
#'   supplied, the function restores the caller's random-number state before
#'   returning.
#'
#' @return An integer vector containing `n_sim` simulated jurisdiction-level
#'   counts.
#' @inherit comp_M references
#' @examples
#' M_vec <- c(20, 50, 30)
#' C_vec <- c(40, 70, 85)
#' p_vec <- minorep(M = M_vec, C = C_vec, gap = c(0.5, 0.6))
#' n_minorep(model_pred = p_vec, n_sim = 1000, seed = 2026)
#' @export

n_minorep <- function(model_pred, n_sim = 1000L, seed = NULL) {
  .logical_assert_numeric(model_pred, "model_pred")
  .logical_assert_range(model_pred, "model_pred", 0, 1)
  .logical_assert_whole_number(n_sim, "n_sim", lower = 1L)

  if (!is.null(seed)) {
    .logical_assert_whole_number(seed, "seed", lower = 0L)
    had_random_seed <- exists(".Random.seed", envir = .GlobalEnv,
                              inherits = FALSE)
    if (had_random_seed) {
      caller_random_seed <- get(".Random.seed", envir = .GlobalEnv,
                                inherits = FALSE)
    }
    on.exit({
      if (had_random_seed) {
        assign(".Random.seed", caller_random_seed, envir = .GlobalEnv)
      } else if (exists(".Random.seed", envir = .GlobalEnv, inherits = FALSE)) {
        rm(".Random.seed", envir = .GlobalEnv)
      }
    }, add = TRUE)
    set.seed(as.integer(seed))
  }

  vapply(
    seq_len(as.integer(n_sim)),
    function(i) sum(stats::rbinom(length(model_pred), size = 1, prob = model_pred)),
    integer(1)
  )
}
