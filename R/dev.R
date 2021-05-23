# dev: A temporary code to develop this R package

library(roxygen2) # In-Line Documentation for R 
library(devtools) # Tools to Make Developing R Packages Easier
library(testthat) # Unit Testing for R
library(usethis)  # Automate Package and Project Setup
library(tidyverse)
library(stringi)
devtools::load_all()
devtools::document()
