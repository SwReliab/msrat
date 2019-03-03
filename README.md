
<!-- README.md is generated from README.Rmd. Please edit that file -->
msrat
=====

msrat provides the package to evalute the software reliability from the fault data collected in the testing phase. The data used in msrat are the fault data with d-metrics and s-metrics.

The examples of d-metrics are the number of test cases, coverages, etc. for each time period such as a day and a week. They are the metrics to represent the software testing environment for the testing period, and dynamically change with the progress of software testing.

S-metrics are the number of codes, complexity, etc. and are the metrics for the software products. They are assumed to be stable through whole the software testing.

Installation
------------

You can install Rsrat from github with:

``` r
# install.packages("devtools")
devtools::install_github("okamumu/msrat")
```

Example
-------

This is an example of the estimation of software reliability growth models from a fault data (tohma).

``` r
### load library
library(msrat)

### load example data for d-metrics
data(dmet)

### dmet.ds1 consists of the number of days (day), the number of faults (fault), the number of testcases (tc), the cumulative number of testcases (ctc), the insrease of C0 coverage (cov) and C0 coverage (ccov).
dmet.ds1
#>    day fault  tc ctc   cov  ccov
#> 1    1     3   5   5 0.018 0.018
#> 2    2    16 175 180 0.409 0.427
#> 3    3     9 186 366 0.066 0.493
#> 4    4     3  67 433 0.132 0.625
#> 5    5     2  14 447 0.013 0.638
#> 6    6     0  54 501 0.055 0.693
#> 7    7     2  28 529 0.021 0.714
#> 8    8     1  15 544 0.018 0.732
#> 9    9     1  23 567 0.024 0.756
#> 10  10     2  17 584 0.026 0.782
#> 11  11     9  74 658 0.051 0.833
#> 12  12     3  43 701 0.011 0.844
#> 13  13     2  20 721 0.002 0.846
#> 14  14     1  12 733 0.013 0.859
#> 15  15     2  18 751 0.018 0.877
#> 16  16     7  19 770 0.018 0.895
#> 17  17     3   9 779 0.000 0.895
#> 18  18     0   9 788 0.003 0.898
#> 19  19     0  32 820 0.014 0.912
#> 20  20     0   8 828 0.000 0.912

### Esimate the model for d-metrics
(result <- fit.srm.logit(formula=fault~., data=dmet.ds1))
#>    fault X.Intercept. day  tc ctc   cov  ccov
#> 1      3            1   1   5   5 0.018 0.018
#> 2     16            1   2 175 180 0.409 0.427
#> 3      9            1   3 186 366 0.066 0.493
#> 4      3            1   4  67 433 0.132 0.625
#> 5      2            1   5  14 447 0.013 0.638
#> 6      0            1   6  54 501 0.055 0.693
#> 7      2            1   7  28 529 0.021 0.714
#> 8      1            1   8  15 544 0.018 0.732
#> 9      1            1   9  23 567 0.024 0.756
#> 10     2            1  10  17 584 0.026 0.782
#> 11     9            1  11  74 658 0.051 0.833
#> 12     3            1  12  43 701 0.011 0.844
#> 13     2            1  13  20 721 0.002 0.846
#> 14     1            1  14  12 733 0.013 0.859
#> 15     2            1  15  18 751 0.018 0.877
#> 16     7            1  16  19 770 0.018 0.895
#> 17     3            1  17   9 779 0.000 0.895
#> 18     0            1  18   9 788 0.003 0.898
#> 19     0            1  19  32 820 0.014 0.912
#> 20     0            1  20   8 828 0.000 0.912
#> 
#> Link function: logit
#> 
#>       omega  (Intercept)          day           tc          ctc  
#>   66.033168    -3.671040     0.522465     0.017718    -0.006349  
#>         cov         ccov  
#>   -0.457267    -0.423316  
#> Maximum LLF: -34.44726 
#> AIC: 82.89452 
#> Convergence: TRUE

### Select metrics in terms of AIC
(result.aic <- step(result))
#> Start:  AIC=82.89
#> fault ~ day + tc + ctc + cov + ccov
#> 
#>        Df    AIC
#> - ccov  1 80.897
#> - cov   1 80.902
#> - ctc   1 81.103
#> <none>    82.895
#> - day   1 86.312
#> - tc    1 91.551
#> 
#> Step:  AIC=80.9
#> fault ~ day + tc + ctc + cov
#> 
#>        Df    AIC
#> - cov   1 79.074
#> <none>    80.897
#> - ctc   1 85.223
#> - day   1 91.844
#> - tc    1 99.140
#> 
#> Step:  AIC=79.07
#> fault ~ day + tc + ctc
#> 
#>        Df     AIC
#> <none>     79.074
#> - ctc   1  86.021
#> - day   1  91.907
#> - tc    1 115.963
#>    fault X.Intercept. day  tc ctc
#> 1      3            1   1   5   5
#> 2     16            1   2 175 180
#> 3      9            1   3 186 366
#> 4      3            1   4  67 433
#> 5      2            1   5  14 447
#> 6      0            1   6  54 501
#> 7      2            1   7  28 529
#> 8      1            1   8  15 544
#> 9      1            1   9  23 567
#> 10     2            1  10  17 584
#> 11     9            1  11  74 658
#> 12     3            1  12  43 701
#> 13     2            1  13  20 721
#> 14     1            1  14  12 733
#> 15     2            1  15  18 751
#> 16     7            1  16  19 770
#> 17     3            1  17   9 779
#> 18     0            1  18   9 788
#> 19     0            1  19  32 820
#> 20     0            1  20   8 828
#> 
#> Link function: logit
#> 
#>       omega  (Intercept)          day           tc          ctc  
#>   66.041755    -3.789003     0.503204     0.016795    -0.006317  
#> Maximum LLF: -34.53719 
#> AIC: 79.07438 
#> Convergence: TRUE

### load Rsrat for drawing the graph
library(Rsrat)

### Draw the number of faults for each day and the number of faults estimated by the model
dmvfplot(fault=dmet.ds1$fault, dmvf=list(result.aic$srm))
```

<img src="man/figures/README-example1-1.png" width="100%" />
