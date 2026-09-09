# logical 0.1.0

## CRAN preparation

- Added input validation and informative errors across the public functions.
- Fixed vector handling in `comp_M()` and repaired all package examples.
- Added regression, validation, simulation, and plotting tests.
- Declared only the dependencies used by package code.
- Updated the package metadata and citation to the published article.
- Corrected README installation instructions, function names, and executable examples.
- Added automated package checks for Linux, macOS, and Windows.

## Behavior retained pending collaborator review

- `minorep()` continues to return probabilities rounded to four decimal places.
- `n_minorep()` continues to return 1,000 simulation draws and uses the caller's
  current random-number state.
- `plot_redistrict()` continues to display the first two supplied plans.
