% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/load_dependencies.R
\name{load_dependencies}
\alias{load_dependencies}
\title{Load tutorial dependencies}
\usage{
load_dependencies(packages)
}
\arguments{
\item{packages}{Packages needed to run a tutorial}
}
\description{
Load the package dependencies of the specified tutorial in the cpnr package.
If the package dependency is not installed, this function will install and
subsequently load it.
}
\examples{
\dontrun{
packages <- show_dependencies(tutorial = "divdyn")
load_dependencies(packages = packages)
}

}
\seealso{
\code{show_dependencies} to get the tutorial dependencies.
}
