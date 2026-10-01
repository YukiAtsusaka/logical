# logical: Computing and Visualizing Quantitative Predictions of Logical Models

[![license](https://img.shields.io/badge/license-GPL--3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0.en.html) <img src="man/figures/pexels-mathias-pr-reding-4394233.jpg" align="right" height="200"/>

**logical** is open-source software for computing and visualizing the quantitative predictions of a logical model of minority representation. The logical model is a parsimonious mathematical model for explaining the emergence and electoral victory of minority candidates at the district level. Theoretically, it assumes that minority candidates strategically decide whether to run for office depending on the likely probability of winning in a given district. Empirically, the model predicts the probability that a district has minority candidacy as well as electoral victory just with two variables (predictors).

Practically, the logical model can be a useful tool for answering common questions regarding race and representation, redistricting, and voting rights. In contrast to other empirical models that require data to answer such questions, the logical model seeks to provide quantitative predictions based on theory.

For theory and existing applications, see

- Atsusaka (2021) ["A Logical Model for Predicting Minority Representation: Application to Redistricting and Voting Rights Cases"](https://doi.org/10.1017/S000305542100054X) *American Political Science Review* 115 (4), 1210-1225.
- Hankinson, Loffredo, & Magazinnik (2026). ["Assessing District Elections as a Remedy in State Voting Rights Acts"](https://papers.ssrn.com/sol3/Delivery.cfm?abstractid=7154498). Available at SSRN 7154498.

## Installation

Install the development version from GitHub:

``` r
install.packages("remotes")
remotes::install_github("YukiAtsusaka/logical")
```

## Loading

``` r
library(logical)
```

## How to cite

For the model and its empirical application, cite Atsusaka, Yuki. 2021. “A Logical Model for Predicting Minority Representation: Application to Redistricting and Voting Rights Cases.” *American Political Science Review* 115(4): 1210–1225. <https://doi.org/10.1017/S000305542100054X>.

For the package citation in R, run:

``` r
citation("logical")
```

## Key applications

Choose the question you want to answer. Each application links to a separate vignette with runnable code and explanations of the inputs and output.

| Question | Functions | Worked guide |
|----|----|----|
| What is the predicted chance that a minority candidate runs or wins in a district, including an influence district? | `minorep()`; `gap` adjusts for turnout differences | [District-level predictions](https://logical-model.github.io/articles/application-1-district-predictions.html) |
| How do I calculate past minority-candidate performance or simulate it from voting assumptions? | `comp_M()`, `sim_M()` | [Racial margin of victory](https://logical-model.github.io/articles/application-2-racial-margin.html) |
| How many minority officeholders might be elected across a city, county, or state? | `minorep()`, `n_minorep()` | [Jurisdiction-level counts](https://logical-model.github.io/articles/application-3-jurisdiction-counts.html) |
| How does changing a district's minority share change its predicted probability of representation? | `sim_redistrict()`, `plot_redistrict()` | [Comparing redistricting scenarios](https://logical-model.github.io/articles/application-4-redistricting.html) |
| What minority share reaches a chosen probability, and how does a proposed district compare with that sweet spot? | `sim_redistrict()`, `plot_sweetspot()` | [Finding the sweet spot](https://logical-model.github.io/articles/application-5-sweet-spot.html) |

Start with the [overview](https://logical-model.github.io/articles/overview.html) and [theory guide](https://logical-model.github.io/articles/theory.html) for the model's conceptual and mathematical background. To open an installed vignette in R, use its name, for example:

``` r
vignette("application-1-district-predictions", package = "logical")
```

Online documentation: <https://logical-model.github.io/>.

## Examples from Online Appendix C

The motivating examples from [Online Appendix C of Atsusaka (2021)](https://static.cambridge.org/content/id/urn:cambridge.org:id:article:S000305542100054X/resource/name/S000305542100054Xsup001.pdf#page=18) are discussed alongside runnable code in the application guides:

- C.1, influence districts and turnout: [Application 1](https://logical-model.github.io/articles/application-1-district-predictions.html).
- C.2, comparing proposed district compositions: [Application 4](https://logical-model.github.io/articles/application-4-redistricting.html).
- C.3, a sufficient minority share: [Application 5](https://logical-model.github.io/articles/application-5-sweet-spot.html).
- C.4, at-large versus district elections: [Application 3](https://logical-model.github.io/articles/application-3-jurisdiction-counts.html).
