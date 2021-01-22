#' cpnr: Interactive tutorials for conservation paleobiology
#'
#' The Conservation Paleobiology Network (CPN)
#' \url{https://conservationpaleorcn.org/}  aims to transform conservation
#' paleobiology into an applied science that informs conservation and
#' restoration efforts. The project is envisioned as a grass-roots effort to
#' develop strategies for communicating geohistorical data to stakeholder
#' groups. To facilitate interdisciplinary conservation work, the CPN now offers
#' tutorials. These will cover various topics starting at an introductory level
#' and aim to show students and scientists how to process geohistorical data.
#' This document shows how to use the cpnr package and how to start a tutorial.
#' We have additionally set up a guide to the cpnr package on github
#' \url{https://github.com/Ischi94/cpnr}. Please view our antiracism statement
#' and call for action before proceeding
#' \url{https://conservationpaleorcn.org/anti-racism-statement-and-call-for-action/}.
#'
#' @section Functions:
#' The training-series group of the CPN will add new tutorials to the package
#' from time to time. To see all interactive tutorials currently available, you
#' can use the show_tutorials function: \cr
#' \code{show_tutorials()}
#'
#'  If the short description returned from show_tutorials is not sufficient for
#'  you to see what the tutorial contains, you can access a more detailed
#'  description via show_description. We need the tutorial
#'  name as an argument for the function: \cr
#'  \code{show_description(tutorial = "divdyn")}
#'
#'  Each tutorial relies on various packages that might not be installed on your
#'  device. Running the tutorial without these packages will fail. It is
#'  therefore necessary to check which packages are needed to run the tutorial: \cr
#'  \code{show_dependencies(tutorial = "divdyn")}
#'
#'  To load all dependencies that are needed to run a tutorial, and to install
#'  the missing ones, you can run load_depencies: \cr
#'  \code{packages <- show_dependencies(tutorial = "divdyn")} \cr
#'  \code{load_dependencies(packages = packages)}
#'
#'  Once you know the name of the desired tutorial and loaded all dependencies,
#'  you are ready to run it. The start_tutorial function will initiate the
#'  interactive tutorial and open it in a browser: \cr
#'  \code{start_tutorial(tutorial = "divdyn")}
#'
#' @section Stop tutorial:
#' To stop a tutorial, simply close the browser window and return to Rstudio.
#' Here you can either press 'escape' or press the red stop button in the
#' console window to end the tutorial.
#'
#' @author Gregor Mathes (gregor.mathes@uni-bayreuth.de)
#' @docType package
#' @name cpnr
NULL
#> NULL
