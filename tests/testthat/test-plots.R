test_that("redistrict plot data use the prediction grid", {
  plans <- cbind(sim_redistrict(0.9, 0), sim_redistrict(0.9, 0.3))
  data <- logical:::.logical_redistrict_plot_data(plans, c(44.04, 55.06))

  expect_equal(data$C[data$start_index], 44)
  expect_equal(data$C[data$end_index], 55.1)
  expect_equal(data$plans, plans)
  expect_equal(data$plan_names, c("Plan 1", "Plan 2"))
})

test_that("redistrict plotting validates its inputs", {
  plan <- sim_redistrict(0.9, 0.2)

  expect_error(plot_redistrict(plan, c(40, 60)), "matrix or data frame")
  expect_error(plot_redistrict(cbind(plan, plan)[-1, ], c(40, 60)), "991 rows")
  expect_error(plot_redistrict(cbind(plan, plan), c(60, 40)), "lower value")
})

test_that("redistrict plots render one or more named plans", {
  plans <- cbind(
    "No crossover" = sim_redistrict(0.9, 0),
    "Moderate crossover" = sim_redistrict(0.9, 0.3),
    "High crossover" = sim_redistrict(0.9, 0.5)
  )
  path <- tempfile(fileext = ".pdf")
  grDevices::pdf(path)
  on.exit(grDevices::dev.off(), add = TRUE)

  expect_invisible(plot_redistrict(plans, c(44, 55)))
})

test_that("sweet-spot calculations find the first qualifying grid point", {
  plan <- sim_redistrict(0.9, 0.2)
  data <- logical:::.logical_sweetspot_plot_data(plan, 0.8, c(30, 70), 70)

  expect_true(data$plan[data$C == data$sweet_spot] >= 0.8)
  expect_equal(data$C.prime, 70)
  expect_equal(data$relationship, "surplus")

  below <- logical:::.logical_sweetspot_plot_data(
    plan, 0.8, c(30, 70), C.prime = 40
  )
  expect_equal(below$relationship, "shortfall")
})

test_that("sweet-spot plotting rejects undefined scenarios", {
  plan <- sim_redistrict(0.9, 0.2)

  expect_error(plot_sweetspot(plan[-1], 0.8, c(30, 70)), "991 values")
  expect_error(plot_sweetspot(rep(0, 991), 0.8, c(30, 70)), "never reaches")
  expect_error(plot_sweetspot(plan, 1.1, c(30, 70)), "between 0 and 1")
  expect_error(plot_sweetspot(plan, 0.8, c(30, 60), 70), "displayed `range`")
})

test_that("sweet-spot plots render on a temporary device", {
  plan <- sim_redistrict(0.9, 0.2)
  path <- tempfile(fileext = ".pdf")
  grDevices::pdf(path)
  on.exit(grDevices::dev.off(), add = TRUE)

  expect_invisible(plot_sweetspot(plan, 0.8, c(30, 70), C.prime = 70))
})
