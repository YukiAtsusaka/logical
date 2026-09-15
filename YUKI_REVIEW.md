# logical 0.1.0: Status for Yuki

**Updated:** September 15, 2026

## Where things stand

The package is close to a release candidate. The code, tests, documentation,
package description, citation, included paper data, and automated checks have
been cleaned up. Yuki's review decisions are now implemented. The remaining
release work is the vignette and final checks on outside systems.

All vignette files remain with Yuki.

## Decisions recorded

### Published examples

The model fixtures are approved. The tests now include hand-calculated checks for
the racial margin, simulated voting assumptions, turnout adjustment, predicted
probability, and jurisdiction total.

### Prediction precision

`minorep()` now returns full-precision results. Users can round values when
preparing a table, label, or other display.

### Number of simulations

`n_minorep()` now lets users choose the number of simulations and optionally
provide a seed. A supplied seed will reproduce the result without changing the
random-number state used elsewhere in the user's session.

### Plot behavior

`plot_redistrict()` now displays more than two plans and uses their column names as
labels.

`C.prime` is the minority electorate percentage in the district being evaluated.
The sweet spot is the minimum percentage at which the simulated plan reaches the
selected probability threshold. A `C.prime` below the sweet spot is valid because
it shows the district's shortfall from that threshold. A value above the sweet
spot shows a surplus. The supplied value must appear within the displayed plot
range so the comparison remains visible.

### Package credits and maintainer

- Yuki remains the primary author and CRAN maintainer.
- Yuki's maintainer email is `atsusaka@uh.edu`.
- Yuki's ORCID is `0000-0001-5365-1876`.
- Kolbe A. Dumas is listed as a second author.
- Kolbe's ORCID is `0009-0002-8777-5476`.

### Minimum R version

The minimum supported version is R 3.6.0. The package uses base R's
graphics tools instead of requiring the newer `scales` package solely for color
transparency.

### Included paper data

The two requested datasets are now included with the package:

- `data(louisiana)` loads the Louisiana mayoral data used in the online appendix.
- `data(state_legislative)` loads the state legislative election data.

Both objects reproduce the deposited rows and columns from Harvard Dataverse.
Their help pages cite the paper and dataset DOI, identify the CC0 license, and
explain each field covered by the deposited codebook. A reproducible import
script records the Dataverse file identifiers and checksums.

The deposited documentation does not define `phase` or `proper`, and it labels
`white_over65` as a percentage even though some values exceed 100. The package
preserves these fields but states those limitations instead of assigning new
meanings to them.

## What Yuki is handling

- Add the introductory vignette.
- Confirm that its explanation of the model and empirical claims matches the
  published article.
- Let Kolbe know when it is ready to merge so the full documentation and release
  checks can be rerun.

## What happens next

Once the vignette is ready, Kolbe can integrate it and run the final sequence:

1. Rebuild all documentation and the PDF manual.
2. Run the package on Windows, macOS, Linux, and R-hub.
3. Prepare the short CRAN submission note.
4. Review the final package contents together.
5. Submit through Yuki's maintainer account.

The PDF manual is currently blocked on the local Mac by a missing TeX font
package. That local setup issue can be checked through continuous integration or
an external service after the vignette is merged.
