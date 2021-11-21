
<!-- README.md is generated from README.Rmd. Please edit that file -->

# YuweiLuoAssignmentB2 Info

<!-- badges: start -->
<!-- badges: end -->

The goal of YuweiLuoAssignmentB2 package is to calculate the Tibble or
data frame column summary information(max, min, mean, median, standard
deviation).

## Description of package

package **YuweiLuoAssignmentB2** contains a function named
`summaryInfoCal()`.

function **summaryInfoCal()** returns tibble or data frame summary
information for col_name input based on category input.

## Installation

**YuweiLuoAssignmentB2** is not yet on CRAN. But, You can install the
development version from [GitHub](https://github.com/) with:

``` r
devtools::install_github("stat545ubc-2021/YuweiLuoAssignmentB2")
#> Skipping install of 'YuweiLuoAssignmentB2' from a github remote, the SHA1 (47185b44) has not changed since last install.
#>   Use `force = TRUE` to force installation
```

## Example

These are 5 basic examples which shows you how to use
**summaryInfoCal()** function.

``` r
library(YuweiLuoAssignmentB2)

#max info calculation example
summaryInfoCal(palmerpenguins::penguins, "max", "body_mass_g", "sex")
#> # A tibble: 2 x 2
#>   sex      max
#>   <fct>  <int>
#> 1 female  5200
#> 2 male    6300

#min info calculation example
summaryInfoCal(palmerpenguins::penguins, "min", "body_mass_g", "sex")
#> # A tibble: 2 x 2
#>   sex      min
#>   <fct>  <int>
#> 1 female  2700
#> 2 male    3250

#mean info calculation example
summaryInfoCal(palmerpenguins::penguins, "mean", "body_mass_g", "sex")
#> # A tibble: 2 x 2
#>   sex     mean
#>   <fct>  <dbl>
#> 1 female 3862.
#> 2 male   4546.

#median info calculation example
summaryInfoCal(palmerpenguins::penguins, "median", "body_mass_g", "sex")
#> # A tibble: 2 x 2
#>   sex    median
#>   <fct>   <dbl>
#> 1 female   3650
#> 2 male     4300

#sd info calculation example
summaryInfoCal(palmerpenguins::penguins, "sd", "body_mass_g", "sex")
#> # A tibble: 2 x 2
#>   sex       sd
#>   <fct>  <dbl>
#> 1 female  666.
#> 2 male    788.
```

For more information, please refer to the development documentation of
function by running `?summaryInfoCal` in the **Console** of **RStudio**.
