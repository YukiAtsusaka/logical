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

## Review needed: three dataset fields

The data files themselves match the Dataverse originals. These questions concern
how three deposited columns should be explained to users. Please answer the
questions below before the final CRAN candidate is assembled.

### 1. What does `phase` mean?

`phase` appears in `state_legislative` and takes values from 1 through 7. It is
not defined in the Dataverse README, does not appear in the upstream Fraga,
Juenke, and Shah data, and is not used in the replication scripts. Phase 7
contains the Asian observations, while phases 1 through 6 contain Black and
Hispanic observations from multiple states and both election years.

Please confirm:

- What does each value represent?
- Is this a meaningful variable for package users or an internal coding batch?
- Should the package retain it, rename it, or omit it from the user-facing data?

### 2. What does `proper` mean?

`proper` appears in `state_legislative`, but all 1,306 observations equal 1. It
is not defined in the Dataverse README, does not appear in the upstream data, and
is not used in the replication scripts. It may be an inclusion or cleaning flag
that became constant after the data were filtered, but that is not confirmed.

Please confirm:

- Was `proper` an inclusion or cleaning flag?
- Should it remain for fidelity to the deposited file, or should it be omitted
  because it contains no information in the released sample?

### 3. What is the unit of `white_over65`?

The Dataverse README calls `white_over65` a percentage, but the deposited values
range from 0 to 32,398.8. For example, the New Orleans value is 32,398.8 in 1994
and 14,787.0 in 2014. These values cannot be percentages. Their magnitude and
decimals suggest a count or interpolated population estimate, but the deposited
materials do not establish that construction.

This field is used as a control in the appendix regressions, so its unit matters
for interpreting the coefficient even though the original replication still runs
with the deposited values.

Please confirm:

- Is this a count, interpolated count, rate, or another measure?
- What population, source, and geographic unit does it describe?
- Should the Dataverse README's percentage description be corrected?

### Resolved field

No review is needed for `white_run`. A row-level comparison with the upstream
Fraga, Juenke, and Shah data confirms that it equals 1 exactly when the upstream
White-candidate count is greater than zero.

Until these questions are answered, the package preserves the deposited columns
and marks the documentation limits. It does not rescale, rename, or reinterpret
the values.

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
