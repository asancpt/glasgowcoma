glasgowComaScale <- read.csv("data-raw/glasgowComaScale.csv", as.is = TRUE)
devtools::use_data(glasgowComaScale, overwrite = TRUE, internal = FALSE)
