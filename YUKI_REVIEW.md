# logical 0.1.0: Status for Yuki

**Updated:** September 9, 2026

## Where things stand

The package is close to a release candidate. The code, tests, documentation,
package description, citation, and automated checks have been cleaned up. The
remaining work is the vignette, a short set of decisions about the public
interface, and final checks on outside systems.

All vignette files were left untouched for Yuki.

## What is finished

- Fixed the package errors that prevented examples from running.
- Added clearer messages when users supply invalid values.
- Added 51 tests covering all seven public functions. All tests pass.
- Confirmed that ordinary calculations still produce the same results as the
  original package.
- Updated the package to version 0.1.0 and corrected the article citation.
- Rewrote the README so installation instructions and examples match the package.
- Removed unused dependencies and two large decorative images. The source package
  is now about 59 KB.
- Added automated checks for Linux, macOS, Windows, and R development versions.
- Checked the current source package with CRAN's main checks, except for the PDF
  manual. The result was 0 errors, 0 warnings, and 3 notes tied to the new
  submission, the pending vignette, and the local clock check.

## What Yuki is handling

- Add the introductory vignette.
- Confirm that its explanation of the model and empirical claims matches the
  published article.
- Let Kolbe know when it is ready to merge so the full documentation and release
  checks can be rerun.

## Decisions for Yuki to review

### 1. Published examples

Please confirm that the package's example values and formulas match the article
or replication materials. The current tests preserve the original calculations,
but this substantive check still needs the model author's approval.

### 2. Prediction precision

`minorep()` currently returns probabilities rounded to four decimal places.

- [ ] Keep four-decimal results.
- [ ] Return full-precision results and round only when displaying them.

### 3. Number of simulations

`n_minorep()` currently runs 1,000 simulations. Users can reproduce results by
setting the random seed before calling it.

- [ ] Keep the current fixed 1,000 simulations.
- [ ] Let users choose the number of simulations and optionally provide a seed.

### 4. Plot behavior

`plot_redistrict()` currently compares the first two plans supplied by the user.

- [ ] Require exactly two plans and give an error otherwise.
- [ ] Expand the function to display more than two plans.

For `plot_sweetspot()`, please also confirm whether the function should reject a
district value below the calculated sweet spot.

### 5. Package credits and maintainer

Please confirm:

- [ ] Yuki remains the CRAN maintainer.
- [ ] `yuki.atsusaka@gmail.com` is the correct monitored maintainer address.
- [ ] Kolbe should be listed as an author (`aut`) or contributor (`ctb`).
- [ ] Any ORCID identifiers that should appear in the package record.

### 6. Minimum R version

The package still lists R 4.1.0 as its minimum version. Please confirm whether
there is a reason to keep that requirement. Otherwise, we can test and support an
older minimum version.

## What happens after this review

Once the vignette and decisions above are ready, Kolbe can integrate them and run
the final sequence:

1. Rebuild all documentation and the PDF manual.
2. Run the package on Windows, macOS, Linux, and R-hub.
3. Prepare the short CRAN submission note.
4. Review the final package contents together.
5. Submit through Yuki's maintainer account.

The PDF manual is currently blocked on the local Mac by a missing TeX font
package. That is a local setup issue and can be checked through continuous
integration or an external service after the vignette is merged.
