.logical_redistrict_plot_data <- function(plans, range) {
  if (!is.matrix(plans) && !is.data.frame(plans)) {
    stop("`plans` must be a numeric matrix or data frame.", call. = FALSE)
  }
  plans <- as.matrix(plans)
  if (!is.numeric(plans) || anyNA(plans) || any(!is.finite(plans))) {
    stop("`plans` must contain only finite, non-missing numeric values.",
         call. = FALSE)
  }
  if (ncol(plans) < 1L) {
    stop("`plans` must contain at least one column.", call. = FALSE)
  }

  C <- seq(from = 1, to = 100, by = 0.1)
  if (nrow(plans) != length(C)) {
    stop(sprintf("`plans` must contain %d rows.", length(C)), call. = FALSE)
  }
  .logical_assert_range(plans, "plans", 0, 1)
  .logical_validate_range(range)

  plan_names <- colnames(plans)
  if (is.null(plan_names)) {
    plan_names <- paste("Plan", seq_len(ncol(plans)))
  } else {
    missing_names <- is.na(plan_names) | !nzchar(plan_names)
    plan_names[missing_names] <- paste("Plan", which(missing_names))
  }

  list(
    C = C,
    plans = plans,
    plan_names = plan_names,
    start = range[1],
    end = range[2],
    start_index = .logical_grid_index(C, range[1]),
    end_index = .logical_grid_index(C, range[2])
  )
}

#' Plot Redistricting Predictions
#'
#' Visualizes changes in minority candidate emergence and electoral success under
#' one or more redistricting scenarios.
#'
#' @param plans A numeric matrix or data frame whose columns contain outputs from
#'   [sim_redistrict()]. Column names are used to label plans in the legend.
#' @param range Length-two numeric vector giving the lower and upper minority
#'   electorate percentages shown in the plot.
#'
#' @return `NULL`, invisibly. The function is called for its plotting side effect.
#' @inherit comp_M references
#' @examples
#' plan1 <- sim_redistrict(coethnic = 1, crossover = 0)
#' plan2 <- sim_redistrict(coethnic = 1, crossover = 0.3)
#' my_plans <- cbind("No crossover" = plan1, "Moderate crossover" = plan2)
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
  number_of_plans <- ncol(data$plans)
  colors <- c("seagreen", "maroon")
  if (number_of_plans > length(colors)) {
    colors <- c(
      colors,
      grDevices::hcl.colors(number_of_plans - length(colors), "Dark 3")
    )
  }
  colors <- colors[seq_len(number_of_plans)]

  graphics::plot(
    0,
    type = "n",
    ylim = c(-0.1, 1.1),
    xlim = x_limits,
    ylab = "Pr(Minority Electoral Success)",
    xlab = "C (% of Minority Voters)",
    mgp = c(2, 0.7, 0)
  )
  for (plan_index in seq_len(number_of_plans)) {
    graphics::lines(
      data$C, data$plans[, plan_index],
      col = colors[plan_index], lwd = 4
    )
  }
  graphics::rect(
    x_limits[1], -0.2, data$start, 1.2,
    col = grDevices::adjustcolor("gray80", alpha.f = 0.3), border = NA
  )
  graphics::rect(
    data$end, -0.2, x_limits[2], 1.2,
    col = grDevices::adjustcolor("gray80", alpha.f = 0.3), border = NA
  )

  start_values <- data$plans[data$start_index, ]
  end_values <- data$plans[data$end_index, ]
  graphics::points(
    x = rep(data$start, number_of_plans), y = start_values,
    pch = 16, cex = 1.5,
    col = grDevices::adjustcolor(colors, alpha.f = 0.9)
  )
  graphics::points(
    x = rep(data$end, number_of_plans), y = end_values,
    pch = 16, cex = 1.5,
    col = grDevices::adjustcolor(colors, alpha.f = 0.9)
  )
  graphics::legend(
    "topleft", legend = data$plan_names, col = colors,
    lwd = 4, bty = "n", cex = 0.8
  )

  invisible(NULL)
}
