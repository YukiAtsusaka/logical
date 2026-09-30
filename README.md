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

Choose the question you want to answer. Each application links to a separate
vignette with runnable code and explanations of the inputs and output.

| Question | Functions | Worked guide |
|---|---|---|
| What is the predicted chance that a minority candidate runs or wins in a district, including an influence district? | `minorep()`; `gap` adjusts for turnout differences | [District-level predictions](https://logical-model.github.io/articles/application-1-district-predictions.html) |
| How do I calculate past minority-candidate performance or simulate it from voting assumptions? | `comp_M()`, `sim_M()` | [Racial margin of victory](https://logical-model.github.io/articles/application-2-racial-margin.html) |
| How many minority officeholders might be elected across a city, county, or state? | `minorep()`, `n_minorep()` | [Jurisdiction-level counts](https://logical-model.github.io/articles/application-3-jurisdiction-counts.html) |
| How does changing a district's minority share change its predicted probability of representation? | `sim_redistrict()`, `plot_redistrict()` | [Comparing redistricting scenarios](https://logical-model.github.io/articles/application-4-redistricting.html) |
| What minority share reaches a chosen probability, and how does a proposed district compare with that sweet spot? | `sim_redistrict()`, `plot_sweetspot()` | [Finding the sweet spot](https://logical-model.github.io/articles/application-5-sweet-spot.html) |

Start with the [overview](https://logical-model.github.io/articles/overview.html)
and [theory guide](https://logical-model.github.io/articles/theory.html) for the
model's conceptual and mathematical background. To open an installed vignette in
R, use its name, for example:

```r
vignette("application-1-district-predictions", package = "logical")
```

Online documentation: <https://logical-model.github.io/>.

## Motivating examples from Online Appendix C

The following examples summarize applications in
[Online Appendix C of Atsusaka (2021)](https://static.cambridge.org/content/id/urn:cambridge.org:id:article:S000305542100054X/resource/name/S000305542100054Xsup001.pdf#page=18).
They illustrate how the question, voting assumptions, and turnout rates shape a
model prediction. All probabilities are conditional on those assumptions;
comparisons of district plans do not by themselves establish legal vote dilution.

### Can an influence district elect a minority candidate? (C.1)

Louisiana redistricting disputes raised the question of whether districts with
about 20% minority voters could elect minority candidates under strongly
polarized voting. The appendix's model scenario predicts a probability close to
zero. A second example considers a district with 40% minority voters. Assuming
all minority voters support the minority candidate and 30% of White voters do
so, `sim_M()` gives `M = 58`. Holding that margin fixed, `minorep()` predicts
about a 3.3% chance with equal turnout, about 91.1% when minority turnout is 50%
and White turnout is 40%, and almost zero when those turnout rates are reversed.
The same district composition can therefore produce very different predictions.
See the [district-level guide](https://logical-model.github.io/articles/application-1-district-predictions.html)
for the `gap` argument and the [racial-margin guide](https://logical-model.github.io/articles/application-2-racial-margin.html)
for constructing `M`.

### Would increasing the minority share improve the prediction? (C.2)

The appendix compares two proposed Louisiana districts with minority shares of
59.2% and 63.2%. It assumes all minority voters support the minority candidate,
no White voters do so, and minority and White turnout rates are 50% and 60%,
respectively. Under these assumptions, both plans yield probabilities very close
to one, so the additional four percentage points make little difference to the
prediction. `sim_redistrict()` and `plot_redistrict()` let users examine the
composition range where a change would matter under their own assumptions.
See the [redistricting guide](https://logical-model.github.io/articles/application-4-redistricting.html).

### What counts as a sufficient minority share? (C.3)

A 50% chance of electing a minority candidate and near certainty are different
targets. The appendix assumes all minority voters support the minority candidate,
30% of White voters do so, and minority and White turnout rates are 40% and 50%,
respectively. On the package's 0.1-point grid, the prediction first reaches 50%
at a minority share of 47.6%; at 57%, it is approximately 100% at numerical
precision. This is conditional near certainty, rather than an electoral
guarantee. `plot_sweetspot()` identifies the share needed for a chosen
`threshold`; `C.prime` marks the district being compared with that threshold.
See the [sweet-spot guide](https://logical-model.github.io/articles/application-5-sweet-spot.html).

### How might electoral rules change the number of minority officeholders? (C.4)

The appendix considers a jurisdiction with six seats and a jurisdiction-wide
minority share of 47.5%. It compares an at-large arrangement with six single-member
districts whose minority shares are `c(50, 40, 60, 30, 50, 80)` and whose adjusted
racial margins are `c(30, 40, 50, 65, 70, 30)`. Under this hypothetical comparison,
the simulations concentrate on zero minority officeholders at large and two or
three under district elections. `minorep()` supplies the seat-level probabilities
and `n_minorep()` converts them into a distribution of counts, using independent
draws across seats. See the [jurisdiction-level guide](https://logical-model.github.io/articles/application-3-jurisdiction-counts.html)
for the simulation workflow.

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
