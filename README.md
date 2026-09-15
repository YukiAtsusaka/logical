# logical: Predictions from a Logical Model of Minority Representation

[![R-CMD-check](https://github.com/YukiAtsusaka/logical/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/YukiAtsusaka/logical/actions/workflows/R-CMD-check.yaml)
[![license](https://img.shields.io/badge/license-GPL--3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0.en.html)

`logical` computes and visualizes quantitative predictions from the logical model
of minority representation developed in Atsusaka (2021). The model links minority
candidate emergence and electoral success to two district-level quantities:

- `M`: the adjusted racial margin of victory based on the previous election.
- `C`: the minority share of the electorate, optionally adjusted for turnout.

The model prediction is

\[
\Pr(\text{minority candidate emerges and wins}) =
\Phi\left(\sqrt{MC} - 50\right),
\]

where \(\Phi\) is the standard normal cumulative distribution function. The
published article evaluates the model using Louisiana mayoral elections and state
legislative elections. Those reported validation results describe the evaluated
samples and should not be read as a guaranteed accuracy rate for every new
district or election.

Article: Atsusaka, Yuki. 2021. ["A Logical Model for Predicting Minority
Representation: Application to Redistricting and Voting Rights
Cases."](https://doi.org/10.1017/S000305542100054X) *American Political Science
Review* 115(4): 1210-1225.

Documentation: <https://logical-model.github.io/>

## Installation

Install the development version from GitHub:

```r
install.packages("remotes")
remotes::install_github("YukiAtsusaka/logical")
```

Load the package:

```r
library(logical)
```

## Main functions

| Function | Purpose |
|---|---|
| `comp_M()` | Compute the adjusted racial margin of victory from observed candidate vote shares. |
| `minorep()` | Predict district-level minority candidate emergence and electoral success. |
| `n_minorep()` | Simulate the jurisdiction-level number of minority candidates or officeholders. |
| `sim_M()` | Simulate the adjusted racial margin from coethnic and crossover voting assumptions. |
| `sim_redistrict()` | Predict outcomes across minority electorate shares from 1 to 100 percent. |
| `plot_redistrict()` | Compare two redistricting scenarios over a selected range. |
| `plot_sweetspot()` | Find and visualize the electorate share at which a scenario reaches a probability threshold. |

## Included paper data

The package includes the two datasets used to evaluate the model in Atsusaka
(2021). Load them by name:

```r
data(louisiana)
data(state_legislative)
```

`louisiana` contains 2,037 Louisiana municipality-election observations and 21
variables from the paper's online-appendix file. `state_legislative` contains
1,306 group-district-election observations and 20 variables from 36 states in
2012 and 2014. Use `?louisiana` and `?state_legislative` for the codebooks and
source notes.

The datasets are reproduced from the
[paper's Harvard Dataverse record](https://doi.org/10.7910/DVN/F2OX6O), version
1.0, under CC0 1.0.

## 1. District-level prediction

Suppose three districts have observed adjusted racial margins of victory
`M = c(20, 50, 30)` and minority electorate shares `C = c(40, 70, 85)`:

```r
M <- c(20, 50, 30)
C <- c(40, 70, 85)

prediction <- minorep(M = M, C = C)
round(prediction, digits = 4)
#> [1] 0.0000 1.0000 0.6906
```

`minorep()` returns full-precision probabilities. Round them only when a table,
label, or other presentation requires fewer digits.

The optional `gap` argument contains minority and White turnout rates in that
order. Each rate is expressed from 0 to 1:

```r
prediction_with_gap <- minorep(
  M = M,
  C = C,
  gap = c(0.5, 0.6)
)
round(prediction_with_gap, digits = 4)
#> [1] 0.0000 1.0000 0.4039
```

## 2. Jurisdiction-level counts

`n_minorep()` uses district-level probabilities to draw possible counts for the
jurisdiction. The default is 1,000 simulations. Use `n_sim` to change that number
and `seed` to reproduce a result without changing the caller's random-number
state:

```r
district_M <- c(50, 40, 40, 35, 70, 85)
district_C <- c(50, 40, 60, 30, 50, 80)
district_prediction <- minorep(M = district_M, C = district_C)

count_draws <- n_minorep(
  model_pred = district_prediction,
  n_sim = 1000,
  seed = 2026
)

summary(count_draws)
hist(
  count_draws,
  xlab = "Simulated number of minority officeholders",
  main = ""
)
```

## 3. Computing or simulating `M`

Compute `M` from observed vote shares for the top minority and White candidates:

```r
top_minority <- c(18, 40, 85, 20)
top_white <- c(60, 40, 10, 34)

observed_M <- comp_M(Vm = top_minority, Vw = top_white)
observed_M
#> [1] 29.0 50.0 87.5 43.0
```

Simulate `M` from the minority electorate share and assumed coethnic and
crossover voting rates:

```r
hypothetical_C <- c(40, 50, 60)
simulated_M <- sim_M(
  C = hypothetical_C,
  coethnic = 1,
  crossover = 0.3
)
simulated_M
#> [1] 58 65 72
```

## 4. Comparing redistricting scenarios

`sim_redistrict()` returns predictions on a grid from `C = 1` through `C = 100`
in 0.1-point increments. The plotting function aligns requested percentages to
that grid, so a vector position should not be interpreted as a percentage value.

```r
plan_1 <- sim_redistrict(coethnic = 0.9, crossover = 0)
plan_2 <- sim_redistrict(coethnic = 0.9, crossover = 0.3)
plan_3 <- sim_redistrict(coethnic = 0.9, crossover = 0.5)
plans <- cbind(
  "No crossover" = plan_1,
  "Moderate crossover" = plan_2,
  "High crossover" = plan_3
)

plot_redistrict(plans = plans, range = c(44, 55))
```

## 5. Finding a scenario's sweet spot

The sweet spot is the first minority electorate percentage at which a simulated
scenario reaches a prespecified probability threshold. `C.prime` marks the
minority electorate percentage in a district of interest. A value below the sweet
spot shows how far the district falls short of the threshold; a value above it
shows how far the district exceeds the threshold. The value must fall inside the
displayed plot range.

```r
plan <- sim_redistrict(coethnic = 0.9, crossover = 0.2)

plot_sweetspot(
  plan = plan,
  threshold = 0.8,
  range = c(30, 70),
  C.prime = 70
)
```

## Citation

```r
citation("logical")
```

## Development status

The package is being prepared for its first CRAN release. Please report problems
through the [GitHub issue tracker](https://github.com/YukiAtsusaka/logical/issues).
