test_that("paper datasets load by their documented names", {
  data_env <- new.env(parent = emptyenv())

  utils::data("louisiana", package = "logical", envir = data_env)
  utils::data("state_legislative", package = "logical", envir = data_env)

  expect_true(exists("louisiana", envir = data_env, inherits = FALSE))
  expect_true(exists("state_legislative", envir = data_env, inherits = FALSE))
})

test_that("louisiana preserves the deposited data structure", {
  data_env <- new.env(parent = emptyenv())
  utils::data("louisiana", package = "logical", envir = data_env)
  louisiana <- data_env$louisiana

  expect_s3_class(louisiana, "data.frame")
  expect_equal(dim(louisiana), c(2037L, 21L))
  expect_named(
    louisiana,
    c(
      "NOLA", "year", "run", "win", "M_raw", "M", "C", "incumb_ran",
      "unopposed", "city_type", "city_council", "woman_run", "woman_win",
      "num_black_cand", "M_t2", "M_t3", "educ_baplus_black",
      "educ_baplus_white", "new_electiontime", "white_over65", "density"
    )
  )
  expect_equal(louisiana$M, louisiana$M_raw + 50)
})

test_that("state_legislative preserves the deposited data structure", {
  data_env <- new.env(parent = emptyenv())
  utils::data("state_legislative", package = "logical", envir = data_env)
  state_legislative <- data_env$state_legislative

  expect_s3_class(state_legislative, "data.frame")
  expect_equal(dim(state_legislative), c(1306L, 20L))
  expect_named(
    state_legislative,
    c(
      "M", "C", "minority_run", "minority_win", "white_run", "state",
      "state.lower", "year", "phase", "sl_chamber", "sl_district", "group",
      "white_pct", "unusual", "south", "deepsouth", "rimsouth", "section5",
      "litigated", "proper"
    )
  )
  expect_setequal(unique(state_legislative$group), c("Asian", "Black", "Hispanic"))
  expect_true(all(state_legislative$proper == 1L))
})
