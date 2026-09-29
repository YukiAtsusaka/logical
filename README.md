# logical: Predictions from a Logical Model of Minority Representation

`logical` computes and visualizes quantitative predictions from the logical
model of minority representation developed in Atsusaka (2021). The model links
minority candidate emergence and electoral success to the adjusted racial margin
of victory (`M`) and the minority share of the electorate (`C`).

## Key applications

- Estimate district-level probabilities of minority candidate emergence and
  electoral success.
- Compute or simulate the adjusted racial margin of victory from election data
  and substantive voting assumptions.
- Simulate jurisdiction-level counts of minority officeholders.
- Compare redistricting scenarios and identify a scenario's sweet spot.

The vignette series provides the model's conceptual and mathematical background,
followed by focused, runnable applications:

1. `vignette("overview", package = "logical")`
2. `vignette("theory", package = "logical")`
3. `vignette("application-1-district-predictions", package = "logical")`
4. `vignette("application-2-racial-margin", package = "logical")`
5. `vignette("application-3-jurisdiction-counts", package = "logical")`
6. `vignette("application-4-redistricting", package = "logical")`
7. `vignette("application-5-sweet-spot", package = "logical")`

Online documentation: <https://logical-model.github.io/>.

## Installation

Install the development version from GitHub:

```r
install.packages("remotes")
remotes::install_github("YukiAtsusaka/logical")
```

## Loading

```r
library(logical)
```

## How to cite

For the model and its empirical application, cite Atsusaka, Yuki. 2021. “A
Logical Model for Predicting Minority Representation: Application to
Redistricting and Voting Rights Cases.” *American Political Science Review*
115(4): 1210–1225. <https://doi.org/10.1017/S000305542100054X>.

For the package citation in R, run:

```r
citation("logical")
```
