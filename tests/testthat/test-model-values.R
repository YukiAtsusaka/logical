test_that("approved model fixtures reproduce hand-calculated values", {
  expect_equal(comp_M(Vm = 18, Vw = 60), 29)
  expect_equal(sim_M(C = 40, coethnic = 1, crossover = 0.25), 55)

  # Equal turnout leaves C unchanged, so M = C = 50 gives q = 0 and p = 0.5.
  expect_equal(minorep(M = 50, C = 50, gap = c(0.6, 0.6)), 0.5)

  # With C = 50 and turnout rates 0.5 and 0.75, adjusted C is 40.
  # M = 62.5 then gives sqrt(M * C) - 50 = 0 and p = 0.5.
  expect_equal(minorep(M = 62.5, C = 50, gap = c(0.5, 0.75)), 0.5)

  # Boundary probabilities make the jurisdiction total deterministic.
  expect_identical(
    n_minorep(c(0, 1, 1), n_sim = 10, seed = 2026),
    rep.int(2L, 10)
  )
})
