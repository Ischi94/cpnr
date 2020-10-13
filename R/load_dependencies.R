load_dependencies <- function(packages) {
  suppressWarnings(
  for(p in packages){
    if(!require(p,character.only = TRUE)) install.packages(p)
    library(p,character.only = TRUE, quietly = TRUE, verbose = FALSE)
  })
}


