#' Show tutorial dependencies
#'
#' Display the package dependencies of the specified tutorial in the cpnr package.
#'
#' @inheritParams show_description
#'
#'
#' @examples
#' show_dependencies(tutorial = "first_tutorial")
#'
#' @return \code{show_dependencies} will return a \code{character} string with all
#' package dependencies
#'
#' @rdname show_dependencies
#'
#' @export
show_dependencies <- function(package = "cpnr", tutorial){
  tutorials_dir <- system.file("tutorials", package = package)

  tutorial_folders <- list.dirs(tutorials_dir, full.names = TRUE,
                                recursive = FALSE)

  dir_rmd_files <- dir(tutorial_folders, pattern = "\\.Rmd$", recursive = FALSE,
                       full.names = TRUE)

  dir_rmd_tutorial <- dir_rmd_files[grep("second_tutorial", dir_rmd_files)]

  deps <- renv::dependencies(dir_rmd_tutorial, quiet = TRUE)

  if (is.null(deps)) {
      return(paste("No dependancies in the tutorial", tutorial))
  }

  deps <- sort(unique(deps$Package))

  print(deps)
}


