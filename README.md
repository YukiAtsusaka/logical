# logical: Computing and Visualizing Quantitative Predictions of Logical Models

**This R package is for computing and visualizing the quantitative predictions
of a logical model of minority representation.** This quantitatively predictive
logical model was developed in Atsusaka (2021), [“A Logical Model for Predicting
Minority Representation: Application to Redistricting and Voting Rights
Cases”](https://doi.org/10.1017/S000305542100054X), *American Political Science
Review* 115(4): 1210–1225.

For quantitatively predictive logical models more generally, please refer to:

- Taagepera, Rein. 2007. [*Predicting Party Sizes: The Logic of Simple
  Electoral Systems*](https://books.google.com/books?id=T_YTDAAAQBAJ&printsec=frontcover&dq=rein+taagepera#v=onepage&q=rein%20taagepera&f=false).
  Oxford University Press.
- Taagepera, Rein. 2008. [*Making Social Sciences More Scientific: The Need for
  Predictive Models*](https://books.google.com/books?id=l6tiJLcVZ8AC&printsec=frontcover&dq=rein+taagepera#v=onepage&q=rein%20taagepera&f=false).
  Oxford University Press.
- Shugart, Matthew S., and Rein Taagepera. 2017. [*Votes from Seats: Logical
  Models of Electoral Systems*](https://books.google.com/books?id=0S42DwAAQBAJ&printsec=frontcover&dq=rein+taagepera#v=onepage&q=rein%20taagepera&f=false).
  Cambridge University Press.

## What is the Logical Model of Minority Representation?

The logical model of minority representation is a simple mathematical formula
introduced in Atsusaka (2021). Its purpose is to explain and predict when
minority candidates run for office and win electoral contests. In the Louisiana
mayoral and state legislative samples evaluated in the article, the model
correctly predicts over 90% of minority candidate emergence and over 95% of
minority electoral success; these results do not guarantee the same accuracy in
every new election or district plan.

The model states that the probability that a minority candidate runs for office
in a district is equal to the estimated probability that the candidate can win
the election. This probability is represented by the standard normal cumulative
distribution function of the square root of a product of two terms (`M` and
`C`), minus 50:

\[
\Pr(\text{Minority Runs}) = \Pr(\text{Minority Wins}) =
\Phi\left(\sqrt{MC} - 50\right).
\]

Here:

- `C` is the percentage of minority voters in the electorate. In the presence
  of extreme racial polarization, `C` represents the racial margin of victory.
- `M` is the adjusted racial margin of victory in the most recent election,
  calculated as `(Vt-1M - Vt-1W) / 2 + 50`, where `Vt-1M` and `Vt-1W` are the
  vote shares of the top minority and White candidates, respectively. `M`
  represents past minority-candidate performance relative to White candidates
  and how securely minority candidates obtain descriptive representation.

The core idea of the model is that future minority-candidate performance falls
between the two logical bounds defined by `M` and `C`. At one extreme, upcoming
election results match the most recent election (`M`). At the other, they match
what district racial composition implies under perfect racially polarized voting
(`C`). The geometric mean, \(\sqrt{MC}\), expresses this middle position.

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
