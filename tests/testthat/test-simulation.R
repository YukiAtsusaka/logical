test_that("sim_M reproduces documented values", {
  expect_equal(
    sim_M(c(40, 50, 60), coethnic = 1, crossover = 0.3),
    c(58, 65, 72)
  )
  expect_equal(sim_M(50, c(0.5, 1), 0), c(25, 50))
})

test_that("sim_M validates percentages and proportions", {
  expect_error(sim_M(c(40, 50), c(0.8, 0.9, 1), 0.2), "common length")
  expect_error(sim_M(101, 0.8, 0.2), "between 0 and 100")
  expect_error(sim_M(50, 1.1, 0.2), "between 0 and 1")
  expect_error(sim_M(50, 0.8, NA_real_), "finite, non-missing")
})

test_that("sim_redistrict returns a bounded prediction grid", {
  prediction <- sim_redistrict(coethnic = 0.9, crossover = 0.2)

  expect_length(prediction, 991)
  expect_true(all(is.finite(prediction)))
  expect_true(all(prediction >= 0 & prediction <= 1))
  expect_equal(prediction, sim_redistrict(0.9, 0.2))
  expect_false(identical(prediction, sim_redistrict(0.9, 0.2, gap = c(0.5, 0.6))))
})

test_that("sim_redistrict validates scenario inputs", {
  expect_error(sim_redistrict(c(0.8, 0.9), 0.2), "length 1")
  expect_error(sim_redistrict(0.8, -0.1), "between 0 and 1")
  expect_error(sim_redistrict(0.8, 0.2, gap = c(0, 0)), "must be positive")
})

test_that("n_minorep returns 1,000 bounded integer counts", {
  set.seed(20260909)
  draws <- n_minorep(c(0, 0.25, 0.75, 1))

  expect_type(draws, "integer")
  expect_length(draws, 1000)
  expect_true(all(draws >= 1 & draws <= 3))

  set.seed(20260909)
  expect_identical(draws, n_minorep(c(0, 0.25, 0.75, 1)))
})

test_that("n_minorep validates probabilities", {
  expect_error(n_minorep(c(-0.1, 0.5)), "between 0 and 1")
  expect_error(n_minorep(c(0.5, NA_real_)), "finite, non-missing")
  expect_error(n_minorep(numeric()), "non-empty numeric")
})
