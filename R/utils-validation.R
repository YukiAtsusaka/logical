.logical_assert_numeric <- function(x, argument, length = NULL) {
  if (!is.numeric(x) || length(x) == 0L) {
    stop(sprintf("`%s` must be a non-empty numeric vector.", argument),
         call. = FALSE)
  }
  if (anyNA(x) || any(!is.finite(x))) {
    stop(sprintf("`%s` must contain only finite, non-missing values.", argument),
         call. = FALSE)
  }
  if (!is.null(length) && length(x) != length) {
    stop(sprintf("`%s` must have length %d.", argument, length), call. = FALSE)
  }
  invisible(x)
}

.logical_assert_range <- function(x, argument, lower, upper) {
  if (any(x < lower | x > upper)) {
    stop(sprintf("`%s` must be between %s and %s.",
                 argument, lower, upper), call. = FALSE)
  }
  invisible(x)
}

.logical_assert_whole_number <- function(x, argument, lower = 0L) {
  .logical_assert_numeric(x, argument, length = 1L)
  if (x < lower || x > .Machine$integer.max || x != floor(x)) {
    stop(sprintf(
      "`%s` must be a whole number between %d and %d.",
      argument, lower, .Machine$integer.max
    ), call. = FALSE)
  }
  invisible(x)
}

.logical_recycle_common <- function(values, arguments) {
  lengths <- lengths(values)
  target <- max(lengths)
  incompatible <- lengths != 1L & lengths != target

  if (any(incompatible)) {
    stop(sprintf(
      "Inputs %s must have a common length or length 1.",
      paste(sprintf("`%s`", arguments), collapse = ", ")
    ), call. = FALSE)
  }

  lapply(values, rep_len, length.out = target)
}

.logical_validate_gap <- function(gap) {
  if (is.null(gap)) {
    return(invisible(NULL))
  }
  .logical_assert_numeric(gap, "gap", length = 2L)
  .logical_assert_range(gap, "gap", 0, 1)
  if (all(gap == 0)) {
    stop("At least one turnout rate in `gap` must be positive.", call. = FALSE)
  }
  invisible(gap)
}

.logical_adjust_turnout <- function(C, gap) {
  if (is.null(gap)) {
    return(C)
  }

  .logical_validate_gap(gap)
  denominator <- C * gap[1] + (100 - C) * gap[2]
  if (any(denominator <= 0)) {
    stop("`gap` produces an undefined turnout-adjusted percentage.",
         call. = FALSE)
  }
  C * gap[1] / denominator * 100
}

.logical_validate_range <- function(range) {
  .logical_assert_numeric(range, "range", length = 2L)
  .logical_assert_range(range, "range", 1, 100)
  if (range[1] >= range[2]) {
    stop("`range` must list a lower value followed by a higher value.",
         call. = FALSE)
  }
  invisible(range)
}

.logical_grid_index <- function(grid, value) {
  which.min(abs(grid - value))
}
