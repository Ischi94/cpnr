test_that("number of returned tutorials match available tutorials", {
  tutorials_dir <- system.file("tutorials", package = "cpnr")

  tutorial_folders <- list.dirs(tutorials_dir, full.names = TRUE,
                                recursive = FALSE)

  dir_rmd_files <- dir(tutorial_folders, pattern = "\\.Rmd$", recursive = FALSE,
                       full.names = TRUE)

  expect_equal(nrow(show_tutorials()), length(dir_rmd_files))
})

