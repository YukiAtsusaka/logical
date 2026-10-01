# logical 0.1.0

## CRAN preparation

- Added input validation and informative errors across the public functions.
- Fixed vector handling in `comp_M()` and repaired all package examples.
- Added regression, validation, simulation, and plotting tests.
- Declared only the dependencies used by package code.
- Updated the package metadata and citation to the published article.
- Corrected README installation instructions, function names, and executable examples.
- Added automated package checks for Linux, macOS, and Windows.
- Lowered the minimum supported R version to 3.6.0 and removed the `scales`
  dependency.
- Added the paper's Louisiana mayoral and state legislative election data as
  `louisiana` and `state_legislative`, with Dataverse provenance and codebooks.

## Approved public interface changes

- `minorep()` now returns full-precision probabilities.
- `n_minorep()` now accepts `n_sim` and `seed`. A supplied seed is reproducible
  without changing the caller's random-number state.
- `plot_redistrict()` now displays and labels any positive number of supplied
  plans.
- `plot_sweetspot()` now describes values below the calculated sweet spot as a
  shortfall and requires the district value to fall within the displayed range.
