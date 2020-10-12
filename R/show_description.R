#' Show tutorial description
#'
#' Display the description of the specified tutorial in the cpnr package.
#'
#' @param package Name of package, currently only cpnr
#'
#' @examples
#' show_tutorials()
#'
#' @return \code{show_tutorials} will return a \code{data.frame} containing
#' "title" and "description".
#'
#' @rdname show_tutorials
#'
#' @export
show_description <- function(package = "cpnr"){
  tutorials_dir <- system.file("tutorials", package = "cpnr")

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

  yaml_front_matter <- dplyr::filter(yaml_front_matter, title == "My first tutorial")

  yaml_front_matter <- dplyr::select(yaml_front_matter, description)

  description <- dplyr::pull(yaml_front_matter)

  print(description)
}


