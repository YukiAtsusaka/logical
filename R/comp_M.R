#' Compute the Adjusted Racial Margin of Victory
#'
#' Computes the adjusted racial margin of victory from the vote shares of the
#' top minority and White candidates.
#'
#' @param Vm Numeric vector containing the top minority candidate's vote share,
#'   expressed from 0 to 100.
#' @param Vw Numeric vector containing the top White candidate's vote share,
#'   expressed from 0 to 100.
#' 
#' @return A numeric vector of adjusted racial margins of victory. Inputs of
#'   length 1 are expanded to the length of the other input.
#' @references Atsusaka, Y. (2021). A Logical Model for Predicting Minority
#'   Representation: Application to Redistricting and Voting Rights Cases.
#'   \emph{American Political Science Review}, 115(4), 1210-1225.
#'   \doi{10.1017/S000305542100054X}
#' @examples
#' top_minority <- c(18, 40, 85, 20)
#' top_white <- c(60, 40, 10, 34)
#' 
#' M_vec_obs <- comp_M(
#'   Vm = top_minority,
#'   Vw = top_white
#' )
#' minorep(M = M_vec_obs, C = c(50, 45, 65, 35))
#' @export

comp_M <- function(Vm, Vw) {
  .logical_assert_numeric(Vm, "Vm")
  .logical_assert_numeric(Vw, "Vw")
  .logical_assert_range(Vm, "Vm", 0, 100)
  .logical_assert_range(Vw, "Vw", 0, 100)

  inputs <- .logical_recycle_common(list(Vm, Vw), c("Vm", "Vw"))
  Vm <- inputs[[1]]
  Vw <- inputs[[2]]

  if (any(Vm + Vw > 100)) {
    stop("Paired values in `Vm` and `Vw` must not sum to more than 100.",
         call. = FALSE)
  }

  (Vm - Vw) / 2 + 50
}
