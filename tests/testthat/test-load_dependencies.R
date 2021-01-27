# test_that("a package is loaded", {
#   package <- "ggplot2"
#   load_dependencies(packages = package)
#   all_packages <- .packages()
#   loaded_package <- all_packages[grep(package, all_packages)]
#   expect_equal(package, loaded_package)
# })
#
#
# test_that("all dependencies are loaded", {
#   dependencies <- show_dependencies("divdyn")
#   load_dependencies(packages = dependencies)
#   all_packages <- .packages()
#   loaded_packages <- all_packages[grepl(paste(dependencies, collapse="|"), all_packages)]
#   dependencies <- sort(dependencies)
#   loaded_packages <- sort(loaded_packages)
#   expect_equal(dependencies, loaded_packages)
# })
#

