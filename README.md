# logical: Computing and Visualizing Quantitative Predictions of Logical Models


[![license](https://img.shields.io/badge/license-GPL--3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0.en.html) <img src="man/figures/pexels-mathias-pr-reding-4394233.jpg" align="right" height="200"/>

**logical** is open-source software for computing and visualizing the quantitative predictions of a logical model of minority representation. The logical model is a parsimonious mathematical model for explaining the emergence and electoral victory of minority candidates at the district level. Theoretically, it assumes that minority candidates strategically decide whether to run for office depending on the likely probability of winning in a given district. Empirically, the model predicts the probability that a district has minority candidacy as well as electoral victory just with two variables (predictors).

Practically, the logical model can be a useful tool for answering common questions regarding race and representation, redistricting, and voting rights. In contrast to other empirical models that require data to answer such questions, the logical model seeks to provide quantitative predictions based on theory.

For theory and existing applications, see

- Atsusaka (2021) ["A Logical Model for Predicting Minority Representation: Application to Redistricting and Voting Rights Cases"](https://doi.org/10.1017/S000305542100054X) *American Political Science Review* 115 (4), 1210-1225.
- Hankinson, Loffredo, & Magazinnik (2026). ["Assessing District Elections as a Remedy in State Voting Rights Acts"](https://papers.ssrn.com/sol3/Delivery.cfm?abstractid=7154498). Available at SSRN 7154498.

### What Are Logical Models?

Before introducing *this* logical model, let us briefly explain what logical models are in the first place. **Quantitatively predictive logical models** (or logical models in short) are mathematical models that are designed to explain and predict political outcomes. Logical models are constructed based on the logical bounds of target outcomes (e.g., minimum and maximum possible values) and generate quantitative predictions about them. This methodological approach was developed by Rein Taagepera and Matthew Shugart in the literature of electoral systems, though it can be applied to any outcomes in social science.

To learn more about this approach, see

- Taagepera (2007). [*Predicting Party Sizes: The Logic of Simple Electoral Systems*](https://books.google.com/books?id=T_YTDAAAQBAJ&printsec=frontcover&dq=rein+taagepera&hl=ja&sa=X&ved=2ahUKEwjslpOhndnwAhURac0KHdMWD0AQ6AEwBHoECAUQAg#v=onepage&q=rein%20taagepera&f=false).
- Taagepera (2008). [*Making Social Sciences More Scientific: The Need for Predictive Models*](https://books.google.com/books?id=l6tiJLcVZ8AC&printsec=frontcover&dq=rein+taagepera&hl=ja&sa=X&ved=2ahUKEwjslpOhndnwAhURac0KHdMWD0AQ6AEwBnoECAcQAg#v=onepage&q=rein%20taagepera&f=false).
- Shugart & Taagepera (2017). [*Votes from Seats: Logical Models of Electoral Systems*](https://books.google.com/books?id=0S42DwAAQBAJ&printsec=frontcover&dq=rein+taagepera&hl=ja&sa=X&ved=2ahUKEwjslpOhndnwAhURac0KHdMWD0AQ6AEwCHoECAsQAg#v=onepage&q=rein%20taagepera&f=false).

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
