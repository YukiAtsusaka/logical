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


```r
out <- redistrict(coethnic=0.9, crossover=0.3, sd=5)
out2 <- redistrict(coethnic=0.9, crossover=0.6, sd=5)
plot(0, type="n", ylim=c(0,1.1),xlim=c(45,65),
    ylab="Pr(Minority Candidate Emergence)",xlab="C (% of Minority Voters)",
     mgp=c(2,0.7,0))
lines(out, col="seagreen",lwd=2)
lines(out2, col="maroon",lwd=2)
points(x=50, y=out[50], pch=16, cex=2, col=scales::alpha("seagreen",0.9))
points(x=60, y=out[60], pch=16, cex=2, col=scales::alpha("seagreen",0.9))
text(x=50, y=out[50]-0.09, labels=round(out[50],d=3), col="seagreen")
text(x=60, y=out[60]-0.09, labels=round(out[60],d=3), col="seagreen")
points(x=50, y=out2[50], pch=16, cex=2, col=scales::alpha("maroon", 0.9))
points(x=60, y=out2[60], pch=16, cex=2, col=scales::alpha("maroon", 0.9))
text(x=50, y=out2[50]+0.09, labels=round(out2[50],d=3), col="maroon")
text(x=60, y=out2[60]+0.09, labels=round(out2[60],d=3), col="maroon")
```

<img src="man/figures/redistrict.png" width="50%" style="display: block; margin: auto;" />

<br/>


