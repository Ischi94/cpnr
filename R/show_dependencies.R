#' Show tutorial dependencies
#'
#' Display the package dependencies of the specified tutorial in the cpnr package.
#'
#' @inheritParams show_description
#'
#'
#' @examples
#' show_dependencies(tutorial = "divdyn")
#' @family show functions
#'
#' @seealso \code{show_description} to see the tutorial description and
#' \code{show_tutorials} to see all available tutorials.
#'
#' @return \code{show_dependencies} will return a \code{character} string with all
#' package dependencies
#'
#' @rdname show_dependencies
#'
#' @export
show_dependencies <- function(tutorial, package = "cpnr") {
  tutorials_dir <- system.file("tutorials", package = package)

  tutorial_folders <- list.dirs(tutorials_dir,
    full.names = TRUE,
    recursive = FALSE
  )

  dir_rmd_files <- dir(tutorial_folders,
    pattern = "\\.Rmd$", recursive = FALSE,
    full.names = TRUE
  )

  dir_rmd_tutorial <- dir_rmd_files[grep(tutorial, dir_rmd_files)]

  if (length(dir_rmd_tutorial) == 0) {
    return(paste0("No tutorial found with name: ", tutorial))
  }

  deps <- renv::dependencies(dir_rmd_tutorial, quiet = TRUE)

  if (is.null(deps)) {
    return(paste("No dependencies in the tutorial", tutorial))
  }

  deps <- sort(unique(deps$Package))

  print(deps)
}
