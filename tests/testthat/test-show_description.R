test_that("a string is returned", {
  expect_true(is.character(show_description("divdyn")))
})


test_that("no matching tutorial warning is returned", {
  expect_match(show_description("empty"), "No tutorial found with name: empty")
})


test_that("the correct tutorial description is returned", {
  tutorials_dir <- system.file("tutorials", package = "cpnr")

  tutorial_folders <- list.dirs(tutorials_dir,
    full.names = TRUE,
    recursive = FALSE
  )

  dir_rmd_files <- dir(tutorial_folders,
    pattern = "\\.Rmd$", recursive = FALSE,
    full.names = TRUE
  )

  yaml_front_matter <- data.frame(
    title = character(length(dir_rmd_files)),
    description = character(length(dir_rmd_files))
  )

  divdyn_yaml <- dir_rmd_files[grep("divdyn", dir_rmd_files)]

  yaml_all <- rmarkdown::yaml_front_matter(divdyn_yaml)

  yaml_description <- yaml_all$description

  expect_match(show_description("divdyn"), yaml_description)
})
