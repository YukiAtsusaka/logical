.logical_redistrict_plot_data <- function(plans, range) {
  if (!is.matrix(plans) && !is.data.frame(plans)) {
    stop("`plans` must be a numeric matrix or data frame.", call. = FALSE)
  }
  plans <- as.matrix(plans)
  if (!is.numeric(plans) || anyNA(plans) || any(!is.finite(plans))) {
    stop("`plans` must contain only finite, non-missing numeric values.",
         call. = FALSE)
  }
  if (ncol(plans) < 2L) {
    stop("`plans` must contain at least two columns.", call. = FALSE)
  }

  C <- seq(from = 1, to = 100, by = 0.1)
  if (nrow(plans) != length(C)) {
    stop(sprintf("`plans` must contain %d rows.", length(C)), call. = FALSE)
  }
  .logical_assert_range(plans, "plans", 0, 1)
  .logical_validate_range(range)

  list(
    C = C,
    plan1 = plans[, 1],
    plan2 = plans[, 2],
    start = range[1],
    end = range[2],
    start_index = .logical_grid_index(C, range[1]),
    end_index = .logical_grid_index(C, range[2])
  )
}

#' Plot Redistricting Predictions
#'
#' Visualizes changes in minority candidate emergence and electoral success under
#' two redistricting scenarios.
#'
#' @param plans A numeric matrix or data frame whose first two columns contain
#'   outputs from [sim_redistrict()].
#' @param range Length-two numeric vector giving the lower and upper minority
#'   electorate percentages shown in the plot.
#'
#' @return `NULL`, invisibly. The function is called for its plotting side effect.
#' @inherit comp_M references
#' @examples
#' plan1 <- sim_redistrict(coethnic = 1, crossover = 0)
#' plan2 <- sim_redistrict(coethnic = 1, crossover = 0.3)
#' my_plans <- cbind(plan1, plan2)
#' my_range <- c(44, 55)
#' start <- my_range[1]
#' end <- my_range[2]
#' plot_redistrict(plans = my_plans, range = my_range)
#' text(x = start, y = 1.1, labels = "Moderate white crossover",
#'      cex = 1, col = "maroon", font = 2)
#' text(x = start + 10, y = -0.09, labels = "No white crossover",
#'      cex = 1, col = "seagreen", font = 2)
#' title("Impact of Increasing % Minority on Minority Success")
#' @export
plot_redistrict <- function(plans, range) {
  data <- .logical_redistrict_plot_data(plans, range)
  x_limits <- c(data$start - 5, data$end + 5)

  graphics::plot(
    0,
    type = "n",
    ylim = c(-0.1, 1.1),
    xlim = x_limits,
    ylab = "Pr(Minority Electoral Success)",
    xlab = "C (% of Minority Voters)",
    mgp = c(2, 0.7, 0)
  )
  graphics::lines(data$plan1 ~ data$C, col = "seagreen", lwd = 4)
  graphics::lines(data$plan2 ~ data$C, col = "maroon", lwd = 4)
  graphics::rect(
    x_limits[1], -0.2, data$start, 1.2,
    col = scales::alpha("gray80", 0.3), border = NA
  )
  graphics::rect(
    data$end, -0.2, x_limits[2], 1.2,
    col = scales::alpha("gray80", 0.3), border = NA
  )

  start_values <- c(data$plan1[data$start_index], data$plan2[data$start_index])
  end_values <- c(data$plan1[data$end_index], data$plan2[data$end_index])

  graphics::points(
    x = data$start, y = start_values[1], pch = 16, cex = 2,
    col = scales::alpha("seagreen", 0.9)
  )
  graphics::points(
    x = data$end, y = end_values[1], pch = 16, cex = 2,
    col = scales::alpha("seagreen", 0.9)
  )
  graphics::text(
    x = data$start, y = start_values[1] - 0.09,
    labels = round(start_values[1], digits = 3), col = "seagreen"
  )
  graphics::text(
    x = data$end + 1, y = end_values[1] - 0.09,
    labels = round(end_values[1], digits = 3), col = "seagreen"
  )
  graphics::points(
    x = data$start, y = start_values[2], pch = 16, cex = 2,
    col = scales::alpha("maroon", 0.9)
  )
  graphics::points(
    x = data$end, y = end_values[2], pch = 16, cex = 2,
    col = scales::alpha("maroon", 0.9)
  )
  graphics::text(
    x = data$start - 1, y = start_values[2] + 0.09,
    labels = round(start_values[2], digits = 3), col = "maroon"
  )
  graphics::text(
    x = data$end, y = end_values[2] + 0.09,
    labels = round(end_values[2], digits = 3), col = "maroon"
  )

  invisible(NULL)
}
