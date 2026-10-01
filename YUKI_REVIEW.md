# logical 0.1.0: Status for Yuki

**Updated:** September 15, 2026

## Where things stand

The package is close to a release candidate. The code, tests, documentation,
package description, citation, included paper data, and automated checks have
been cleaned up. Yuki's earlier review decisions are implemented. The remaining
release work is the vignette, the decisions below, and final checks on outside
systems.

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

## Proposed worked example: Florida congressional elections

Kolbe would like to add a concrete example showing how information from one
election can be used to evaluate representation in the next election. The
recommended first case is all 27 Florida congressional districts from 2018 to
2020.

Florida is proposed instead of Louisiana for the first congressional example
because it has a conventional election structure, unchanged congressional
boundaries across these two elections, official machine-readable results, and
candidate-demographics coverage for White, Black, Hispanic or Latino, and Asian
American or Pacific Islander candidates. Louisiana can follow as a useful
extension showing how the same workflow handles a blanket election and a
possible runoff.

This would be a retrospective demonstration using elections whose outcomes are
already known. It would show how to construct and evaluate the model. It would
not forecast a current election, estimate the causal effect of a district map,
or establish that a map was intentionally or unlawfully gerrymandered.

### Proposed package data

The proposal is to keep the two source layers separate so their meaning and
provenance remain clear:

1. `florida_congress_candidates`: candidate-election records for 2018 and 2020,
   including district, candidate, FEC identifier, party, votes, vote share,
   winner status, candidate racial or ethnic identity, and identity-source
   review fields.
2. `florida_congress_districts`: one record for each of the 27 districts,
   including White, Black, Hispanic or Latino, and Asian citizen voting-age
   population estimates, percentages, and margins of error.

The example would derive its transition table from these two documented source
objects instead of packaging a third copy of the same information.

### Proposed sources

- Candidate names, parties, votes, vote shares, winner status, and runoff fields:
  the Federal Election Commission's official, certified
  [2018](https://www.fec.gov/introduction-campaign-finance/election-results-and-voting-information/federal-elections-2018/)
  and
  [2020](https://www.fec.gov/introduction-campaign-finance/election-results-and-voting-information/federal-elections-2020/)
  Excel publications.
- District composition: the Census Bureau's
  [2014-2018 Citizen Voting Age Population special tabulation](https://www.census.gov/programs-surveys/decennial-census/about/voting-rights/cvap/2014-2018-CVAP.html),
  which uses the congressional geography in effect for these elections and was
  published before the 2020 election.
- Candidate identity: the Reflective Democracy candidate-demographics archive,
  followed by source-backed review of unresolved records. Candidate identity
  will not be inferred from a name or photograph. An unresolved candidate will
  remain `Unknown`.

Before any candidate-identity data are distributed with the package, Kolbe will
confirm that the source terms permit redistribution. If they do not, the package
will distribute only independently verified classifications with a source
ledger.

### Proposed worked example

The full calculation would use all 27 districts. A shorter display would show
six districts chosen by a rule fixed before the 2020 outcomes are compared. The
selection rule would prioritize variation in Black, Hispanic or Latino, and
Asian CVAP and include a district near the statewide demographic median. The
statewide simulation would still use every district.

For each racial or ethnic group, the example would:

1. Identify the highest vote share received by a candidate from that group in
   the 2018 election.
2. Identify the highest vote share received by a White candidate in the same
   district and election.
3. Construct the group's adjusted racial margin `M` from those two vote shares.
4. Use the group's district CVAP percentage as `C`.
5. Calculate the model output for the 2020 election.
6. Compare the historical model output with 2020 candidate emergence and final
   representation.
7. Use all 27 district outputs in `n_minorep()` to illustrate a statewide count
   distribution.

Black, Hispanic or Latino, and Asian comparisons would remain separate. The
example would not collapse them into one non-White category. The source identity
label would also be preserved for multiracial candidates rather than silently
forcing them into one group.

### Validation before inclusion

Kolbe would complete the following checks before asking Yuki to review the
finished example:

- Verify every district total against the FEC publication and a second official
  compilation from the Clerk of the U.S. House.
- Verify that candidate vote shares reproduce the official district totals.
- Reconcile candidate names with FEC identifiers rather than relying only on
  text matching.
- Preserve Census estimates and margins of error, and verify that all 27
  district percentages use the same CVAP vintage and geography.
- Record a source and review status for every candidate-identity classification.
- Keep unresolved classifications visible as `Unknown`.
- Add tests for dimensions, district coverage, vote-share totals, winners,
  identity-source completeness, and reproducible example outputs.
- Run the full package test and source-check sequence after documentation is
  rebuilt.

### Decisions requested from Yuki

Please respond under each item or check the preferred option.

#### 1. Release timing

- [ ] Include the Florida data and example in `0.1.0`.
- [ ] Keep `0.1.0` focused on the published paper and add this in `0.1.1`.

The recommendation is to include it in `0.1.0` only if the introductory
vignette will use it. Otherwise, it is safer to avoid expanding the release
candidate while the final CRAN checks are pending.

#### 2. Model outcome

Should the example evaluate candidate emergence, final electoral victory, or
both as separate outcomes? The proposed data can preserve both, but the prose
should not treat them as interchangeable.

#### 3. Districts without a candidate from a group

When no candidate from the focal group ran in 2018, what vote-share value should
enter the construction of `M`? Please confirm the rule that matches the published
model before the example is calculated.

#### 4. Candidate identity and multiracial candidates

The recommendation is to preserve the source identity as recorded, allow more
than one group indicator when supported, and require a separate author-approved
rule before using a multiracial candidate in a group-specific model comparison.
Please confirm or revise this approach.

#### 5. District composition

Please confirm that the Census CVAP percentage, rather than total population or
voting-age population, is the intended `C` measure for this example.

#### 6. Six displayed districts

Please confirm that the short display may use six districts selected by a
predeclared demographic-variation rule while the statewide calculation uses all
27 districts.

#### 7. Vignette ownership

Kolbe can prepare the documented data, tests, and a self-contained example for
review. Yuki would decide whether and how to incorporate that example into his
vignette source. No vignette file will be changed on the Kolbe/Codex branch.

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
