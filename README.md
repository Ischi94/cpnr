
<!-- README.md is generated from README.Rmd. Please edit that file -->

# cpnr: Interactive tutorials for conservation paleobiology

The [Conservation Paleobiology
Network](https://conservationpaleorcn.org/) (CPN) aims to transform
conservation paleobiology into an applied science that informs
conservation and restoration efforts. The project is envisioned as a
grass-roots effort to develop strategies for communicating geohistorical
data to stakeholder groups.

To facilitate interdisciplinary conservation work, the CPN now offers
tutorials. These will cover various topics starting at an introductory
level and aim to show students and scientists how to process
geohistorical data. This document shows how to use the `cpnr` package
and how to start a tutorial.

Please view our [antiracism statement and call for
action](https://conservationpaleorcn.org/anti-racism-statement-and-call-for-action/)
before proceeding.

The `cpnr`package builds on the amazing `learnr`
[package](https://rstudio.github.io/learnr/).

## Requirements

All tutorials are deposited in a R package called `cpnr`, which is
currently hosted on [github](https://github.com/Ischi94/cpnr). To access
these tutorials, one needs to have R installed on their local device.
You can download and install R [here](https://cran.r-project.org/). Note
that we recommend the usage of Rstudio, which you can download
[here](https://rstudio.com/products/rstudio/download/). R and Rstudio is
free and open source, and the R community is welcoming and very
inclusive.

### New to R

Here are some additional useful links if you are new to the R
programming environment:

-   [Introduction to R
    (manual)](https://cran.r-project.org/doc/manuals/r-release/R-intro.pdf)  
-   [R for data science (book)](https://r4ds.had.co.nz/index.html)  
-   [Data visualisations with R (book)](https://ggplot2-book.org/)

### Why Github?

You might be familiar with installing packages from CRAN (the
Comprehensive R Archive Network) in R. To install this package, you need
to go a different route, as you will see below. Github allows us to
provide real time access to our tutorials, as you will access the
development version of the `cpnr` package.

## How to start

The `cpnr` package provides interactive tutorials that can be accessed
via R. For this, one needs to have the package installed and read into
memory. To install the package from github, we can use the `devtools`
package:

### Install devtools

The `devtools` package is a tool that can be used to access packages
from Github. It needs to be installed in order to access the `cpnr`
package. You can check whether `devtools` is already installed by
running the following command:

``` r
"devtools" %in% rownames(installed.packages())
```

If the previous command returned `TRUE`, you’re ready to go. If
`devtools` is not installed, it will return `FALSE` and we need to
install it from CRAN with the following command:

``` r
install.packages("devtools")
```

### Install cpnr

With `devtools` installed to your local device, we are now ready to
install the `cpnr` package from Github using
`devtools::install_github()` function:

``` r
devtools::install_github("Ischi94/cpnr")
```

To load the package into memory, use the `library` call.

``` r
library(cpnr)
```

Now you can access functions within the `cpnr` package.

## Functions

### See what is there

The training-series group of the CPN will add new tutorials to the
package from time to time. To see all interactive tutorial currently
available, you can use the `show_tutorials` function:

``` r
show_tutorials()
#> # A tibble: 2 x 2
#>   title           description    
#>   <chr>           <chr>          
#> 1 first_tutorial  Short statement
#> 2 second_tutorial Just for trial
```

There are currently two (dummy) tutorials in the package. The
`show_tutorials` call returns a dataframe with the title of the tutorial
and a short description. To get further information on the tutorial, and
to subsequently run it, the title of the tutorial is needed.

### Further details

If the short description returned from `show_tutorials` is not
sufficient for you to see what the tutorial contains, you can access a
more detailed description via `show_description`. As mentioned above, we
need the tutorial name as an argument for the function:

``` r
show_description(tutorial = "first_tutorial")
#> [1] "Short statement. This is just a trial to see how much of this description gets printed in the end. This document is aimed to introduce the possibilities of an interactive tutorial using `rmarkdown` and the `learnr` package. We can embed code chunks from both r and python, making this format extremely versatile. "
```

### What you need

Each tutorial relies on various packages that might not be installed on
your device. Running the tutorial without these packages will fail. It
is therefore necessary to check which packages are needed to run the
tutorial, and to install them if necessary.

``` r
show_dependencies(tutorial = "first_tutorial")
#> [1] "knitr"     "learnr"    "rmarkdown" "shiny"
```

To load all these dependencies needed to run a tutorial, and to install
the missing ones, you can run `load_depencies`:

``` r
# get dependencies
packages <- show_dependencies(tutorial = "first_tutorial")

# load or install them
load_dependencies(packages = packages)
```

### Access the tutorial

Now you should know the name of the tutorial you want to run and what it
does based on the description. Further, you have loaded and installed
all dependencies needed to run the tutorial. Now you are ready to run
it. The `start_tutorial` function will initiate the interactive tutorial
and open it in a browser:

``` r
start_tutorial(tutorial = "first_tutorial")
```

Make sure to end the tutorial with the stop button in the R console when
you are done.
