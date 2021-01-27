test_that("a string is returned", {
  expect_true(is.character(show_dependencies("divdyn")))
})

test_that("a vector is returned", {
  expect_true(is.vector(show_dependencies("divdyn")))
})

test_that("no matching tutorial warning is returned", {
  expect_match(show_dependencies("empty"), "No tutorial found with name: empty")
})



