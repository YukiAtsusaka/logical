test_that("minorep reproduces documented predictions", {
  M <- c(20, 50, 30)
  C <- c(40, 70, 85)

  expect_equal(minorep(M, C), c(0, 1, 0.6906))
  expect_equal(minorep(M, C, gap = c(0.5, 0.6)), c(0, 1, 0.4039))
  expect_equal(minorep(50, c(50, 60)), c(0.5, 1))
})

test_that("minorep validates model inputs", {
  expect_error(minorep(c(20, 30), c(40, 50, 60)), "common length")
  expect_error(minorep(-1, 40), "between 0 and 100")
  expect_error(minorep(20, 101), "between 0 and 100")
  expect_error(minorep(20, 40, sd = 0), "greater than zero")
  expect_error(minorep(20, 40, gap = 0.5), "length 2")
  expect_error(minorep(20, 40, gap = c(0, 0)), "must be positive")
})
