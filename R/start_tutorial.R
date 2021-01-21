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
#' show_dependencies(tutorial = "first_tutorial")
#'
#' start_tutorial(tutorial = "first_tutorial")
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

  dir_rmd_file <- dir(tutorial_folders, pattern = paste0(tutorial, ".Rmd$"), recursive = FALSE,
                       full.names = TRUE)

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
    rmarkdown::run(file = dir_rmd_file, shiny_args = shiny_args)
  })
}


