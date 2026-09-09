.logical_sweetspot_plot_data <- function(plan, threshold, range, C.prime) {
  .logical_assert_numeric(plan, "plan")
  .logical_assert_range(plan, "plan", 0, 1)
  .logical_assert_numeric(threshold, "threshold", length = 1L)
  .logical_assert_range(threshold, "threshold", 0, 1)
  .logical_validate_range(range)

  C <- seq(from = 1, to = 100, by = 0.1)
  if (length(plan) != length(C)) {
    stop(sprintf("`plan` must contain %d values.", length(C)), call. = FALSE)
  }
  if (!any(plan >= threshold)) {
    stop("`plan` never reaches `threshold`.", call. = FALSE)
  }

  sweet_spot <- C[which(plan >= threshold)[1]]
  if (is.null(C.prime)) {
    C.prime <- sweet_spot
  } else {
    .logical_assert_numeric(C.prime, "C.prime", length = 1L)
    .logical_assert_range(C.prime, "C.prime", 1, 100)
  }
  if (sweet_spot < range[1] || sweet_spot > range[2]) {
    stop("`range` must include the calculated sweet spot.", call. = FALSE)
  }
  if (C.prime < range[1] || C.prime > range[2]) {
    stop("`C.prime` must fall within the displayed `range`.", call. = FALSE)
  }

  relationship <- if (C.prime < sweet_spot) {
    "shortfall"
  } else if (C.prime > sweet_spot) {
    "surplus"
  } else {
    "at sweet spot"
  }

  list(C = C, plan = plan, threshold = threshold, range = range,
       sweet_spot = sweet_spot, C.prime = C.prime,
       relationship = relationship)
}

#' Plot the Redistricting Sweet Spot
#'
#' Visualizes the minimum minority electorate percentage at which a redistricting
#' scenario reaches a specified probability threshold.
#'
#' @param plan Numeric vector returned by [sim_redistrict()].
#' @param threshold Numeric probability from 0 to 1.
#' @param range Length-two numeric vector giving the lower and upper minority
#'   electorate percentages shown in the plot.
#' @param C.prime Optional minority electorate percentage for a district of
#'   interest, expressed from 1 to 100 and contained within `range`. Values below
#'   the sweet spot represent a shortfall from the model threshold; values above
#'   it represent a surplus.
#'
#' @return `NULL`, invisibly. The function is called for its plotting side effect.
#' @inherit comp_M references
#' @examples
#' plan_1 <- sim_redistrict(coethnic = 0.9, crossover = 0.2)
#' plot_sweetspot(plan = plan_1, range = c(30, 70), threshold = 0.8, C.prime = 70)
#' text(x = 59, y = 0.6,
#'      labels = "Distance from \nthe Sweet Spot",
#'      cex = 1, col = "dimgray", font = 1)
#' text(x = 64, y = 0.2, labels = "C'\nDistrict Plan \nof Interest",
#'      cex = 1, col = "dimgray", font = 2)
#' arrows(x0 = 65.5, x1 = 69, y0 = 0.28, y1 = 0.28,
#'        col = "dimgray", lwd = 1, length = 0.1)
#' @export
plot_sweetspot <- function(plan, threshold, range, C.prime = NULL) {
  data <- .logical_sweetspot_plot_data(plan, threshold, range, C.prime)

  graphics::plot(
    0,
    type = "n",
    ylim = c(-0.1, 1.1),
    xlim = data$range,
    ylab = "Pr(Minority Electoral Success)",
    xlab = "C (% of Minority Voters)",
    mgp = c(2, 0.7, 0),
    cex.lab = 1.2
  )
  graphics::lines(data$plan ~ data$C, col = "maroon", lwd = 4)
  graphics::abline(h = data$threshold, lty = 2, col = "dimgray")
  graphics::rect(
    data$sweet_spot, -0.2, data$C.prime, 1.2,
    col = grDevices::adjustcolor("gray80", alpha.f = 0.5), border = NA
  )
  graphics::abline(v = data$C.prime, lwd = 2, col = "gray60", lty = 2)
  graphics::arrows(
    x0 = data$sweet_spot, x1 = data$sweet_spot,
    y0 = data$threshold, y1 = -0.05,
    col = "maroon", lwd = 1, length = 0.1, lty = 1
  )
  graphics::points(
    x = data$sweet_spot, y = data$threshold,
    cex = 1.5, pch = 16, col = "maroon"
  )
  graphics::text(
    x = data$sweet_spot, y = -0.1,
    labels = paste0(data$sweet_spot, "% (Sweet Spot)"),
    col = "maroon", font = 2
  )
  graphics::text(
    x = data$range[1] + 7, y = data$threshold - 0.1,
    labels = "Pre-specified \nThreshold", font = 2, col = "dimgray"
  )

  invisible(NULL)
}
