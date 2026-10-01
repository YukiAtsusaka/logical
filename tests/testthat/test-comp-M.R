test_that("comp_M computes documented adjusted margins", {
  expect_equal(
    comp_M(c(18, 40, 85, 20), c(60, 40, 10, 34)),
    c(29, 50, 87.5, 43)
  )
  expect_equal(comp_M(20, c(30, 40)), c(45, 40))
})

test_that("comp_M rejects invalid vote-share inputs", {
  expect_error(comp_M(c(20, 30), c(40, 50, 60)), "common length")
  expect_error(comp_M(c(70, 40), c(40, 20)), "sum to more than 100")
  expect_error(comp_M(-1, 20), "between 0 and 100")
  expect_error(comp_M(NA_real_, 20), "finite, non-missing")
  expect_error(comp_M("20", 30), "numeric")
})
