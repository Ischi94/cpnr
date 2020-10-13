#' Load tutorial dependencies
#'
#' Load the package dependencies of the specified tutorial in the cpnr package.
#' If the package dependency is not installed, this function will install and
#' subsequently load it.
#'
#' @param packages Packages needed to run a tutorial
#'
#'
#' @examples
#' \dontrun{
#' packages <- show_dependencies(tutorial = "first_tutorial")
#' load_dependencies(packages = packages)
#' }
#'
#' @seealso \code{show_dependencies} to get the tutorial dependencies.
#'
#'
#' @rdname load_dependencies
#'
#' @export
load_dependencies <- function(packages) {
  suppressWarnings(
  for(p in packages){
    if(!require(p,character.only = TRUE)) utils::install.packages(p)
    library(p,character.only = TRUE, quietly = TRUE, verbose = FALSE)
  })
}


