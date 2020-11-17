# logical: A Software to Compute and Visualize Quantitative Predictions of Logical Models

This R package computes and visualizes the quantitative predictions of the logical model of minority candidate emergence introduced by Atsusaka (2020) ["Unifying Demand and Supply-Side Theories of Minority Representation: A Logical Model"](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3637699).

<details>
<summary>Cite this software✒️</summary>

@Manual{,
    title = {logical: A Software to Compute and Visualize Quantitative Predictions of Logical Models},
    author = {Yuki Atsusaka},
    year = {2020},
    note = {R package version 0.0.0},
    url = {https://CRAN.R-project.org/package=logical},
  }
</details>

This R package is still under development. Please let me know ([atsusaka@rice.edu](atsusaka@rice.edu)) if you find any issue installing and using the software..!


## Instllation
To install the latest development version of `logical` directly from
[GitHub](https://github.com/YukiAtsusaka/logical) use:

``` r
library(devtools)
devtools::install_github("YukiAtsusaka/logical")
```
<br>


## Example

First, load the package.

``` r
library(logical)
```

<br/>

## `emerge`: Simulated the Probability of Minority Candidate Emergence with Specified Values of *M* and *C*
Generate a probability of minority candidate emergence with specified values of *M* and *C* as follows:

```r
rmargin = c(20, 50, 30)
percent = c(40, 70, 85)
emerge(M=rmargin, C=percent)
emerge
# [1] 0.9982217 1.0000000 1.0000000

emerge(M=rmargin, C=percent, sd=5)
emerge
# [1] 0.7200551 1.0000000 1.0000000
```

<br/>

## `redistrict`: Simulated the Probability of Minority Candidate Emergence in Varying District Racial Compositions
Generate a probability of minority candidate emergence with specified levels of minority co-ethnic voting and White crossover voting as follows:

```r
# sim1: Strong Minority Co-ethnic Voting and No White Crossover
# sim2: Strong Minority Co-ethnic Voting and Moderate White Crossover
sim1 <- redistrict(coethnic=0.9, crossover=0, sd=5)  
sim2 <- redistrict(coethnic=0.9, crossover=0.3, sd=5) 

# PLOT THE SIMULATED PROBABILITIES
start <- 45 # Starting Point
end <- 55   # Ending Point

plot(0, type="n", ylim=c(-0.1,1.1),xlim=c(start-5,end+5),
   ylab="Pr(Minority Candidate Emergence)",xlab="C (% of Minority Voters)",
   mgp=c(2,0.7,0))
lines(sim1, col="seagreen",lwd=2.5)
lines(sim2, col="maroon",lwd=2.5)
 points(x=start, y=sim1[start], pch=16, cex=2, col=scales::alpha("seagreen",0.9))
 points(x=end, y=sim1[end], pch=16, cex=2, col=scales::alpha("seagreen",0.9))
 text(x=start, y=sim1[start]-0.09, labels=round(sim1[start],d=3), col="seagreen")
 text(x=end, y=sim1[end]-0.09, labels=round(sim1[end],d=3), col="seagreen")
 points(x=start, y=sim2[start], pch=16, cex=2, col=scales::alpha("maroon", 0.9))
 points(x=end, y=sim2[end], pch=16, cex=2, col=scales::alpha("maroon", 0.9))
 text(x=start, y=sim2[start]+0.09, labels=round(sim2[start],d=3), col="maroon")
 text(x=end, y=sim2[end]+0.09, labels=round(sim2[end],d=3), col="maroon")
 text(x=start+1, y=1.08, labels="Strong minority co-ethnic voting \n + Moderate White crossover",
      cex=0.8, col="maroon", font=2)
 text(x=start+6, y=0.2, labels="Strong minority co-ethnic voting \n + No White crossover",
      cex=0.8, col="seagreen", font=2)
```

<img src="man/figures/redistrict.png" width="55%" style="display: block; margin: auto;" />

<br/>


