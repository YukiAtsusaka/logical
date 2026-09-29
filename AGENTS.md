# logical: CRAN Submission Plan

**Created**: 2026-09-08
**Last Updated**: 2026-09-15

## Project Overview

Working document for **Yuki Atsusaka** and **Kolbe Dumas**. Update the status
boxes as work is completed. This plan is based on the public repository at commit
`dcb71d1dedcba40bcf124edd9a296e5e212b5313`, inspected on 2026-09-08.

**Target:** `logical 0.1.0` on CRAN with a tested public API, one focused
introductory vignette, current article metadata, and automated checks on Linux,
macOS, and Windows.

## Current Status

The approved pre-vignette implementation is complete on branch
`codex/cran-readiness`. The package has validation, 79 passing tests, approved
authorship and public-interface decisions, current metadata and citation, a
rebuilt README and help files, two documented paper datasets, about 135 KB of
source-package output, and GitHub Actions definitions. No vignette file was
created, edited, rendered, or regenerated because Yuki owns that lane.

The current source tarball passes `R CMD check --as-cran --no-manual` with
0 ERRORs, 0 WARNINGs, and three expected or temporary NOTEs: new submission,
declared vignette support without a vignette, and inability to verify the current
time. The PDF manual is blocked locally by a missing `inconsolata.sty` TeX
component, not an observed Rd defect. Cross-platform services and final
submission artifacts should wait until Yuki's vignette is integrated.

A Florida 2018-to-2020 congressional worked example is now proposed for Yuki's
review. No Florida data, code, generated documentation, or vignette changes have
been added. The proposal, source plan, validation gates, and author decisions are
recorded in `YUKI_REVIEW.md`.

**Owner labels:** `YA` = Yuki, `KD` = Kolbe, `Both` = joint decision or review,
`?` = unassigned. **Status labels:** `☒` = complete, `◐` = partially complete,
`☐` = open.

## To-Do List

- [x] Audit the current repository and record a reproducible CRAN baseline.
- [x] Agree on the release contract and collaborator roles.
- [x] Add safe correctness fixes and regression tests.
- [x] Obtain approval of published-model fixtures and deferred API choices.
- [x] Complete final authorship and maintainer metadata review.
- [x] Complete dependency and package-size cleanup.
- [x] Add and document the two paper datasets from Harvard Dataverse.
- [ ] Obtain Yuki's definitions and retention decisions for `phase`, `proper`,
  and `white_over65`.
- [ ] Obtain Yuki's scope and model-construction decisions for the proposed
  Florida congressional example.
- [ ] Rebuild user documentation and the introductory vignette.
- [x] Rebuild README and Rd documentation without touching the vignette lane.
- [ ] Integrate Yuki's vignette and rerun the full documentation gate.
- [ ] Pass the PDF-manual and cross-platform release checks.
- [ ] Review and submit the `0.1.0` release candidate.

## Remaining Release Gates

1. **Vignette:** Yuki is preparing it. The two vignette-related NOTEs will remain
   until the source and prebuilt index are integrated.
2. **Manual environment:** The local TeX Live 2025 installation lacks
   `inconsolata.sty` and cannot install it directly from the 2026 repository.
   Verify the PDF manual on CI, a current TeX installation, or an external builder.
3. **External release checks:** Windows, macOS builder, R-hub, and final
   `cran-comments.md` work should run after the vignette and review decisions are
   merged, so the evidence describes the actual release candidate.
4. **Dataset codebook:** The deposited data are integrated and verified. Yuki
   still needs to define `phase`, explain whether constant `proper` should remain,
   and correct or clarify the unit of `white_over65`.
5. **Proposed worked example:** Yuki needs to decide whether the Florida
   congressional example belongs in `0.1.0` and confirm the model outcome,
   no-candidate rule, candidate-identity treatment, `C` measure, and display
   scope before implementation begins.

## Ground rules

1. Correctness comes before CRAN mechanics. A clean check does not compensate for
   an incorrect function or an undocumented interface.
2. Preserve current numerical behavior only after tests show that the behavior is
   intentional and consistent with the published model.
3. Treat generated files as generated. Edit roxygen source in `R/`, then run
   `devtools::document()` to update `man/` and `NAMESPACE`.
4. Do not have both collaborators regenerate documentation on overlapping branches.
   This avoids unnecessary conflicts in `man/` and `NAMESPACE`.
5. Review the exact staged file set before every merge. Do not commit check
   directories, source tarballs, `Rplots.pdf`, local project files, or unrelated
   roxygen side effects.
6. Every phase ends with a reproducible check or a documented decision. A task is
   not complete because the code parses or an example runs once.

## How to run the core checks

Run these commands from the package root after each coherent change:

```r
devtools::document()
devtools::load_all()
devtools::test()
devtools::check(args = "--as-cran")
```

Before submission, build the source tarball and check the tarball itself with the
manual and vignette enabled. The final gate is 0 ERRORs, 0 WARNINGs, and only NOTEs
that can be explained in `cran-comments.md`.

Additional release checks:

```r
devtools::check_win_release()
devtools::check_win_devel()
devtools::check_mac_release()

# R-hub v2 requires its workflow to be configured and pushed first.
rhub::rhub_setup()
rhub::rhub_check()
```

R-hub reads the pushed GitHub branch, not uncommitted local changes. Run it only
after the release candidate branch is current on GitHub.

---

## Phase 0: Verified baseline

### Repository snapshot

- Default branch: `master`
- Audited commit: `dcb71d1dedcba40bcf124edd9a296e5e212b5313`
- Package version: `0.0.0.9000`
- Exported functions: `comp_M()`, `minorep()`, `n_minorep()`,
  `plot_redistrict()`, `plot_sweetspot()`, `sim_M()`, and `sim_redistrict()`
- Tests: none
- Continuous integration: none
- Vignette source: none, although `DESCRIPTION` declares `VignetteBuilder: knitr`
- Open GitHub issues at the audit date: none
- Current CRAN package index at the audit date: no exact package named `logical`

Package-name availability is time-sensitive. Recheck it immediately before
submission.

### Baseline `R CMD check --as-cran`

The source package was built and checked on R 4.4.2 for macOS. The fast baseline
used `--no-manual`, so the PDF manual remains a required later gate.

**Observed result:** 1 ERROR, 1 WARNING, 7 NOTEs.

**ERROR**

- The examples cannot be parsed because the `sim_M()` roxygen example contains
  bare prose: `Simulating M from substantive knowledge`.

**WARNING**

- `sim_redistrict()` has a public `gap` argument that is missing from its Rd
  documentation.

**Repository-related NOTEs**

- Version `0.0.0.9000` has a large version component.
- `VignetteBuilder` and `knitr` are declared without a vignette.
- The installed package is 7.1 MB, almost entirely because two decorative JPEGs
  under `man/figures/` are about 3.6 MB and 3.3 MB.
- `logical.Rproj` is a non-standard top-level file in the source package.
- Ten declared Imports are unused. The code currently uses `scales`; base
  `graphics` and `stats` functions need explicit namespace declarations.
- Several calls use partial argument matching, such as `round(..., d = 4)`.
- Base functions including `pnorm()`, `rbinom()`, `lines()`, `rect()`, `points()`,
  `text()`, `abline()`, and `arrows()` are not imported in `NAMESPACE`.

**Environment-related NOTE**

- The check host could not verify the current time or reach external URLs. Rerun
  incoming and URL checks on a networked host before treating any URL as valid or
  invalid.

### Hidden failures exposed after the first blocker

The first ERROR prevents later examples from running. Temporary changes in a
disposable copy, not in this repository, exposed two additional example failures:

1. `comp_M()` uses a vector inside `if`, so its documented vector example fails
   with `the condition has length > 1`.
2. The `plot_redistrict()` example refers to `start` and `end` after the function
   call even though those objects are local to the function. R resolves `start`
   to a function, then fails when `text()` expects a number.

After temporarily fixing only the malformed `sim_M()` example, the `comp_M()`
condition, the missing `gap` documentation, and the `plot_redistrict()` example,
all examples completed. The remaining result was 0 ERRORs, 0 WARNINGs, and 7
NOTEs. This diagnostic result is useful for sequencing, but it is not release
evidence because the repairs were not made in the repository and the package has
no tests.

---

## Phase 1: Lock the release contract

Resolve these decisions before substantive code changes. Record each decision in
this file and in `NEWS.md` when it affects users.

| # | Decision | Recommendation | Who | Done |
|---|---|---|---|---|
| 1.1 | CRAN release version | Use `0.1.0` for the first public release. | Both | ☒ |
| 1.2 | Maintainer | Yuki remains `cre`; use the monitored `atsusaka@uh.edu` address and his ORCID. | YA | ☒ |
| 1.3 | Kolbe's author role | List Kolbe A. Dumas as the second `aut`; Yuki remains the first and primary author. | Both | ☒ |
| 1.4 | Vignette | Keep `knitr` and integrate Yuki's short introductory vignette when ready. | Both | ☒ |
| 1.5 | Numerical precision | Return full-precision predictions from computational functions. Round only when printing or labeling plots. | YA | ☒ |
| 1.6 | Vector recycling | Require compatible input lengths. Permit scalar expansion only when it is explicit and tested; reject accidental recycling. | YA | ☒ |
| 1.7 | Simulation interface | Add `n_sim` and optional `seed` to `n_minorep()`. Preserve the caller's random-number state when a seed is supplied. | YA | ☒ |
| 1.8 | Plot scope | Support one or more plans with column-name labels. Treat `C.prime` below the sweet spot as a valid shortfall. | YA | ☒ |
| 1.9 | Minimum R version | Use R 3.6.0 and remove the `scales` dependency that otherwise requires R 4.1.0. | Both | ☒ |

**Exit criterion:** Every public behavior change has an agreed contract before code
and documentation branches diverge.

---

## Phase 2: Correctness and regression tests

This is the main release phase. KD can build the test harness and fixtures while
Yuki confirms which behaviors match the model and intended use.

| # | Task | Files | Who | Done |
|---|---|---|---|---|
| 2.1 | Create `tests/testthat.R` and `tests/testthat/`. Use testthat edition 3 and add the edition to `DESCRIPTION`. | `DESCRIPTION`, `tests/` | KD | ☒ |
| 2.2 | Add approved hand-calculated model fixtures for `M`, `C`, turnout adjustment, predicted probabilities, and jurisdiction totals. | `tests/testthat/test-model-values.R` | Both | ☒ |
| 2.3 | Fix `comp_M()` vector handling. Validate equal or explicitly compatible lengths, finite numeric inputs, vote-share bounds, and pairwise sums. Use informative errors rather than printing and returning an undefined object. | `R/comp_M.R`, tests, Rd | KD | ☒ |
| 2.4 | Harden `minorep()`. Validate `M`, `C`, `sd`, and `gap`; reject impossible values and zero denominators; return full-precision probabilities. | `R/minorep.R`, tests, Rd | Both | ☒ |
| 2.5 | Harden `sim_M()`. Validate `C`, `coethnic`, and `crossover`; document supported vectorization; test boundary values 0 and 1. | `R/sim_M.R`, tests, Rd | KD | ☒ |
| 2.6 | Harden `sim_redistrict()`. Document and validate `gap`; test the grid, turnout transformation, output length, monotonic cases, and extreme voting patterns. | `R/sim_redistrict.R`, tests, Rd | Both | ☒ |
| 2.7 | Make `n_minorep()` reproducible and configurable with `n_sim` and optional `seed`, including preservation of the caller's random-number state. | `R/n_minorep.R`, tests, Rd | KD | ☒ |
| 2.8 | Separate plot-data preparation from rendering so numerical plot inputs can be tested without image comparison. Keep user-facing plotting functions small. | `R/plot_*.R`, helper file, tests | KD | ☒ |
| 2.9 | Replace exact floating-point lookup such as `C == start` with a validated grid match or interpolation rule. Test ranges that do and do not fall exactly on the grid. | `R/plot_redistrict.R`, tests | KD | ☒ |
| 2.10 | Define failures for unreachable thresholds, reversed ranges, out-of-range `C.prime`, wrong plan dimensions, and missing values. `plot_sweetspot()` should not silently produce `Inf` when the threshold is unreachable. | `R/plot_*.R`, tests, Rd | Both | ☒ |
| 2.11 | Resolve README/API inconsistencies: `plot_minorep` is described but does not exist, and `model_predict` is shown although the argument is `model_pred`. The README now documents the actual functions and argument. | `README.md` | KD | ☒ |
| 2.12 | Run test coverage and inspect uncovered branches. Use coverage as a diagnostic, not a release score. Every validation branch and all seven exports need direct tests. Coverage is 97.44 percent. | tests | KD | ☒ |

### Required test families

- Published reference values and ordinary examples
- Scalars, vectors, and explicitly supported recycling
- Zero, one, and boundary values
- Missing, infinite, nonnumeric, and out-of-range values
- Mismatched lengths
- Reproducibility and caller RNG preservation
- Plot-data values and rendering smoke tests on a temporary device
- Error classes and readable user-facing messages
- Backward-compatibility tests for any interface intentionally retained

**Exit criterion:** `devtools::test()` passes from a clean session, every export has
positive and negative tests, and Yuki signs off that the numerical fixtures reflect
the published model.

---

## Phase 3: Mechanical CRAN compliance and package hygiene

| # | Task | Files | Who | Done |
|---|---|---|---|---|
| 3.1 | Rewrite `Title` and `Description` in CRAN style. The description should explain what the package computes and cite Atsusaka (2021) with `<doi:10.1017/S000305542100054X>`. | `DESCRIPTION` | KD | ☒ |
| 3.2 | Bump to `0.1.0`; add a concise `NEWS.md` that records the first release and any user-facing behavior changes. | `DESCRIPTION`, `NEWS.md` | KD | ☒ |
| 3.3 | Finalize `Authors@R`: Yuki first as `aut` and `cre`, Kolbe second as `aut`, with confirmed emails and ORCIDs. | `DESCRIPTION` | Both | ☒ |
| 3.4 | Remove unused Imports. Keep only base packages called by package code and qualify `graphics`, `grDevices`, and `stats` calls explicitly. | `DESCRIPTION`, `R/`, `NAMESPACE` | KD | ☒ |
| 3.5 | Replace every partial argument match such as `d =` with the full argument name `digits =`. | `R/`, examples | KD | ☒ |
| 3.6 | Add `.Rbuildignore` rules for `logical.Rproj`, this plan, local development files, check output, and any repository-only configuration. Add generated artifacts such as `Rplots.pdf` to `.gitignore`. | `.Rbuildignore`, `.gitignore` | KD | ☒ |
| 3.7 | Remove the unused 3.3 MB photo and decide whether the 3.6 MB decorative README photo should be removed or replaced with a small optimized asset. Both unused photos were removed; they remain recoverable from Git history. | `man/figures/`, `README.md` | KD | ☒ |
| 3.8 | Update `inst/CITATION` from the conditionally accepted SSRN record to the published *American Political Science Review* article, volume 115(4), pages 1210-1225, DOI `10.1017/S000305542100054X`. | `inst/CITATION` | KD | ☒ |
| 3.9 | Confirm `License: GPL-3`. Do not add a separate `LICENSE` file unless the declaration is changed to refer to one. | `DESCRIPTION` | KD | ☒ |
| 3.10 | Add package-level documentation and a stable package alias if needed. Regenerate all Rd files with roxygen 7.3.3. | `R/logical-package.R`, `man/`, `NAMESPACE` | KD | ☒ |
| 3.11 | Run a spelling pass over `R/`, Rd files, and README. Correct visible errors such as “Instllation,” “distrcit,” “misestiamte,” “scaler,” and “plot_sweetpot.” | documentation | KD | ☒ |
| 3.12 | Add the Louisiana mayoral and state legislative data used in the paper as documented package data. Preserve deposited values and names, record the CC0 Dataverse source, verify source checksums, and test `data()` loading. | `data/`, `data-raw/`, `R/data.R`, tests | KD | ☒ |

**Exit criterion:** A source-package check reaches and completes tests, examples,
vignette, and manual generation with 0 ERRORs and 0 WARNINGs. Repository-generated
NOTEs are resolved rather than merely described.

---

## Phase 4: User-facing documentation

| # | Task | Files | Who | Done |
|---|---|---|---|---|
| 4.1 | Rewrite the README installation block with `remotes::install_github()`. Remove badges and links that still point to `cWise`. | `README.md` | KD | ☒ |
| 4.2 | Make README examples executable in a fresh R session. Define every object before use and ensure argument names match the API. | `README.md` | KD | ☒ |
| 4.3 | Replace indexed-grid examples that confuse a vector position with a percentage value. A value such as `sim1[45]` is not the prediction at `C = 45` on a 0.1-point grid. | `README.md`, examples | KD | ☒ |
| 4.4 | Yuki is adding the vignette. Do not create, edit, render, or regenerate vignette files in the KD/Codex branch. | `vignettes/`, `DESCRIPTION` | YA | ☐ |
| 4.5 | Explain the model's quantities and units before code: `M`, `C`, `gap`, `coethnic`, `crossover`, prediction probability, and the jurisdiction-level simulation output. README and Rd work is complete; vignette work remains with Yuki. | README, vignette, Rd | Both | ◐ |
| 4.6 | Calibrate empirical claims to the published article. Distinguish the model's evaluated predictive performance from a general guarantee for new elections or district plans. README work is complete; vignette work remains with Yuki. | README, vignette | Both | ◐ |
| 4.7 | Add `@references` and complete `@return` text where it helps users interpret outputs. | `R/`, generated Rd | KD | ☒ |
| 4.8 | Execute every README example and visually inspect both package-generated plot pages. Vignette rendering remains pending. | rendered docs | Both | ◐ |
| 4.9 | Review and, if approved, implement the Florida 2018-to-2020 congressional example described in `YUKI_REVIEW.md`. Keep candidate and district source layers separate, preserve identity provenance, use all 27 districts for statewide calculations, and leave vignette integration to Yuki. | data, data-raw, tests, documentation | Both | ☐ |

**Exit criterion:** A new user can install the package, reproduce each README and
vignette example, understand every input's scale, and interpret every returned
object without consulting the source code.

---

## Phase 5: Automation and cross-platform checks

| # | Task | Files | Who | Done |
|---|---|---|---|---|
| 5.1 | Add GitHub Actions `R-CMD-check` across Linux, macOS, and Windows, including R-devel, old release, and the declared R 3.6.0 minimum. | `.github/workflows/` | KD | ☒ |
| 5.2 | Add automated test coverage as a separate informational workflow. Do not make a coverage percentage the definition of correctness. | `.github/workflows/` | KD | ☒ |
| 5.3 | Run `devtools::check_win_release()` and `devtools::check_win_devel()`. Archive the returned logs long enough for the release review. | external checks | YA | ☐ |
| 5.4 | Configure R-hub v2, push its workflow, and run the recommended CRAN platforms from the release-candidate branch. | R-hub workflow | KD | ☐ |
| 5.5 | Run the macOS builder and inspect any differences in examples, graphics devices, locales, or PDF-manual generation. | external checks | KD | ☐ |
| 5.6 | Recheck all URLs from a networked environment. Replace long tracking URLs with stable DOI or canonical links. All five package URLs passed. | package-wide | KD | ☒ |

**Exit criterion:** All required platforms pass with 0 ERRORs and 0 WARNINGs.
Every remaining NOTE is understood, reproducible, and described in
`cran-comments.md`.

---

## Phase 6: Release candidate and CRAN submission

| # | Task | Who | Done |
|---|---|---|---|
| 6.1 | Freeze the API and merge only reviewed Phase 1-5 work into a release-candidate branch. | Both | ☐ |
| 6.2 | Documentation, tests, no-manual CRAN check, URL check, spelling check, source-tarball inspection, and clean-library installation passed. Manual and vignette gates remain open. | KD | ◐ |
| 6.3 | Rechecked on 2026-09-09: the current CRAN package index contains no exact package named `logical`. Recheck at submission. | KD | ☒ |
| 6.4 | Create `cran-comments.md` with exact test environments and an explanation for every accepted NOTE. Do not describe unresolved repository defects as expected notes. | KD | ☐ |
| 6.5 | Review the built tarball contents. Confirm that it excludes this plan, `.Rproj`, check output, temporary graphics, and oversized unused assets. | Both | ☐ |
| 6.6 | Review package authorship, maintainer address, title, description, citation, license, URLs, `NEWS.md`, and version one final time. | Both | ☐ |
| 6.7 | Yuki submits as maintainer and completes CRAN's email confirmation. | YA | ☐ |
| 6.8 | Respond to CRAN requests on a dedicated branch, rerun the full release gates, and record each change here. | Both | ☐ |
| 6.9 | After acceptance, add the CRAN badge and CRAN installation instructions, tag `v0.1.0`, and create the GitHub release from the accepted commit. | KD | ☐ |

---

## Suggested sequencing for two people

To reduce merge conflicts, use four small pull requests in this order:

1. **PR 1: tests and verified behavior**
   - YA confirms the public contracts and reference values.
   - KD builds the tests and implements agreed validation.
   - Both review every numerical behavior change.
2. **PR 2: metadata and package hygiene**
   - KD cleans `DESCRIPTION`, imports, build exclusions, citation, assets, and
     generated documentation.
   - YA confirms maintainer and authorship metadata.
3. **PR 3: README, vignette, and automation**
   - KD makes examples executable and adds checks.
   - YA reviews the model explanation and claims.
4. **PR 4: release candidate**
   - KD assembles check evidence and `cran-comments.md`.
   - Both inspect the tarball and cross-platform results.
   - YA submits.

Avoid long-lived parallel branches that both edit roxygen comments or
`DESCRIPTION`. Merge each pull request before starting the next one unless the
files are fully disjoint.

## Definition of CRAN-ready

The package is ready to submit only when all of the following are true:

- [x] Yuki has approved the numerical reference fixtures and public API.
- [x] All seven exported functions have ordinary, boundary, and failure tests.
- [x] `devtools::test()` passes from a clean session.
- [ ] A built source tarball passes `R CMD check --as-cran` with 0 ERRORs,
  0 WARNINGs, and only justified NOTEs.
- [ ] The PDF manual and vignette build without warnings.
- [ ] Linux, macOS, Windows release, Windows devel, and R-hub results are reviewed.
- [ ] README, Rd, vignette, citation, and `DESCRIPTION` agree with the code and
  the published article.
- [x] Package size is reasonable and unused decorative assets are absent from the
  source tarball.
- [ ] The exact release commit, tarball contents, and staged changes have been
  reviewed by both collaborators.
- [x] Yuki's maintainer address is current and ready for CRAN confirmation.

## Session History

### 2026-09-08

- Cloned the public repository and confirmed that local `master` matched
  `origin/master` at commit `dcb71d1`.
- Inspected all 27 tracked files, all seven exported functions, generated help,
  README, `DESCRIPTION`, `NAMESPACE`, and `inst/CITATION`.
- Ran a real source-package baseline check: 1 ERROR, 1 WARNING, and 7 NOTEs.
- Used a disposable copy to expose failures hidden behind the first example parse
  error. No diagnostic code changes were copied into the repository.
- Verified the published article metadata and DOI against the publisher record.
- Downloaded the current CRAN package index and found no exact package named
  `logical`; this must be rechecked at submission.
- Created this CRAN-readiness plan. No commit, push, issue, or pull request was
  created.

### 2026-09-09

- Synced local `master` to `origin/master` at commit `722a1e9` and created local
  branch `codex/cran-readiness`.
- Updated package metadata to version 0.1.0, reduced runtime dependencies, added
  package-level documentation, and updated the published-article citation.
- Added centralized input validation and hardened all seven exported functions.
  Preserved valid-input numerical behavior, four-decimal `minorep()` output,
  the fixed 1,000-draw simulation interface, and existing plot scope pending
  collaborator decisions.
- Added 51 tests covering ordinary use, vectorization, boundaries, failures,
  externally seeded reproducibility, plot data, and rendering. The suite passes
  with 97.44 percent coverage.
- Rebuilt Rd files and `NAMESPACE`, corrected the README against the public API,
  executed all README examples against a clean installation, and visually
  inspected both generated plot pages.
- Removed two unused decorative JPEGs, reducing the built source package to
  59 KB. Both files remain recoverable from Git history.
- Added Linux, macOS, and Windows R CMD check automation plus an informational
  coverage workflow based on the current r-lib/actions v2 templates.
- Passed URL and spelling checks, source-tarball inspection, clean-library
  installation, and `R CMD check --as-cran --no-manual` with 0 ERRORs,
  0 WARNINGs, and three NOTEs documented above.
- Left all vignette files untouched for Yuki. Deferred the PDF-manual environment,
  external builders, R-hub, `cran-comments.md`, and release submission until the
  vignette and collaborator decisions are integrated.
- Added `YUKI_REVIEW.md`, a plain-language status and decision sheet for Yuki.
- Committed and pushed the implementation branch for collaborator review. No
  issue, pull request, or external submission was created.
- Reviewed Yuki's response at commit `8e55240` and implemented the approved
  interface, authorship, maintainer, and minimum-version decisions.
- Added approved hand-calculated fixtures, full-precision predictions,
  configurable seeded simulations, multi-plan plotting, and explicit shortfall
  handling for districts below the sweet spot.
- Removed three accidental top-level HTML renders totaling about 7 MB and added
  repository exclusions to prevent them from returning.
- Rebuilt documentation and the source package. The updated suite passes 68 tests
  with 96.99 percent coverage; the no-manual CRAN check remains at 0 ERRORs,
  0 WARNINGs, and three pending-vignette or environment NOTEs.

### 2026-09-15

- Added the paper's Louisiana mayoral and state legislative election data as
  `louisiana` and `state_legislative`.
- Rebuilt both objects from the original Dataverse CSV files after verifying the
  published MD5 checksums. The import script also validates dimensions and column
  order before writing the package data.
- Added complete package help, README examples, source and CC0 attribution, and
  tests for `data()` loading, dimensions, names, and key deposited properties.
- Recorded three incompletely defined deposited fields without inventing labels:
  `phase`, `proper`, and the scale of `white_over65`.
- The suite now passes 79 tests. The exact 134,848-byte source tarball passes
  `R CMD check --as-cran --no-manual` with 0 ERRORs, 0 WARNINGs, and the same
  three vignette or clock NOTEs. The tarball includes both `.rda` objects and
  their Rd codebooks, and excludes `data-raw/`.
- Confirmed that Yuki's website update at commit `bf94c1c` changes the published
  theme but does not add vignette source. Added the live documentation site to
  the package metadata and README.
- Expanded `YUKI_REVIEW.md` into a direct decision sheet for `phase`, `proper`,
  and `white_over65`. Confirmed separately that `white_run` exactly represents
  the presence of at least one White candidate in the upstream data.
- Added a review-only plan for a Florida 2018-to-2020 congressional worked
  example. The plan records the official election and Census sources, proposed
  package objects, candidate-identity safeguards, validation checks, vignette
  boundary, and seven decisions for Yuki. No example data or code were added.
