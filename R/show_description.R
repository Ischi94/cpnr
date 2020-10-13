#' Show tutorial description
#'
#' Display the description of the specified tutorial in the cpnr package.
#'
#' @param tutorial Name of tutorial
#' @inheritParams show_tutorials
#'
#' @examples
#' show_description(tutorial = "first_tutorial")
#'
#' @family show functions
#'
#' @seealso \code{show_tutorials} to see all available tutorials and
#' \code{show_dependencies} to see all dependencies needed to run a tutorial.
#'
#' @return \code{show_description} will return a \code{character} string with a
#' detailed description of the focal tutorial.
#'
#' @rdname show_description
#'
#' @export
show_description <- function(tutorial, package = "cpnr"){
  tutorials_dir <- system.file("tutorials", package = package)

  tutorial_folders <- list.dirs(tutorials_dir, full.names = TRUE,
                                recursive = FALSE)

  dir_rmd_files <- dir(tutorial_folders, pattern = "\\.Rmd$", recursive = FALSE,
                       full.names = TRUE)

  yaml_front_matter <- data.frame(title = character(length(dir_rmd_files)),
                                  description = character(length(dir_rmd_files)))

  for (i in 1:length(dir_rmd_files)) {
    yaml_dummy <- rmarkdown::yaml_front_matter(dir_rmd_files[i])
    yaml_front_matter[i, 1] <- yaml_dummy$title
    yaml_front_matter[i, 2] <- yaml_dummy$description
  }

  yaml_front_matter <- tibble::as_tibble(yaml_front_matter)

  if (tutorial %in% yaml_front_matter$title == FALSE) {
    return(paste0("No tutorial found with name: ", tutorial))
  }

  yaml_front_matter <- dplyr::filter(yaml_front_matter, title == tutorial)

  yaml_front_matter <- dplyr::select(yaml_front_matter, description)

  description <- dplyr::pull(yaml_front_matter)

  print(description)
}


