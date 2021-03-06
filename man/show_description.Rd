% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/show_description.R
\name{show_description}
\alias{show_description}
\title{Show tutorial description}
\usage{
show_description(tutorial, package = "cpnr")
}
\arguments{
\item{tutorial}{Name of tutorial}

\item{package}{Name of package, currently only cpnr}
}
\value{
\code{show_description} will return a \code{character} string with a
detailed description of the focal tutorial.
}
\description{
Display the description of the specified tutorial in the cpnr package.
}
\examples{
show_description(tutorial = "divdyn")
}
\seealso{
\code{show_tutorials} to see all available tutorials and
\code{show_dependencies} to see all dependencies needed to run a tutorial.

Other show functions: 
\code{\link{show_dependencies}()},
\code{\link{show_tutorials}()}
}
\concept{show functions}
