#' Run a tutorial
#'
#' Run a specified tutorial in the cpnr package.
#' A web browser will be started automatically to view the document.
#'
#' @inheritParams show_description
#' @param shiny_args Additional arguments to forward to
#'   \href{https://shiny.rstudio.com/reference/shiny/latest/runApp.html}{shiny::runApp}
#'
#'
#' @section Warning:
#' Before running \code{start_tutorial}, make sure to have all package
#' dependencies installed. You can see all dependencies using
#' \code{show_dependencies}
#'
#' @examples
#' \dontrun{
#' show_dependencies(tutorial = "divdyn")
#'
#' start_tutorial(tutorial = "divdyn")
#' }
#'
#'
#' @rdname start_tutorial
#'
#' @details Note that, when finished, the running tutorial needs to be stopped
#' by clicking on the stop symbol in the R console.
#'
#' @export
start_tutorial <- function(tutorial, package = "cpnr", shiny_args = NULL){

  tutorials_dir <- system.file("tutorials", package = package)

  tutorial_folders <- list.dirs(tutorials_dir, full.names = TRUE,
                                recursive = FALSE)

  selected_folder <- tutorial_folders[grepl(tutorial, tutorial_folders)]


  if (is.null(shiny_args)) {
    shiny_args <- list()
  }

  if (is.null(shiny_args$launch.browser)) {
    shiny_args$launch.browser <-
      (interactive() || identical(Sys.getenv("LEARNR_INTERACTIVE", "0"), "1"))
  }

  withr::with_dir(tutorials_dir, {
    if (!identical(Sys.getenv("SHINY_PORT", ""), "")) {
      withr::local_envvar(c(RMARKDOWN_RUN_PRERENDER = "0"))
    }
    rmarkdown::run(file = NULL, dir = selected_folder, shiny_args = shiny_args,
                   default_file = paste0(tutorial, ".Rmd"))
  })
}


