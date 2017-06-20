#' Report GCS
#'
#' This function reports Glasgow Coma Scale (GCS). Individual elements as well as the sum of the score are important. Hence, the score is expressed in the form "GCS 9 = E2 V4 M3 at 2017-06-20 17:57:50".
#'
#' @param eye Eye
#' @param verbal Verbal
#' @param motor Motor
#' @param now Time
#' @param simplify simplifying results or reporting full description
#'
#' @export
#'
#' @examples
#'
#' reportgcs()
#' reportgcs(simplify = FALSE)
#' reportgcs(4, 5, 6, now = "2017-01-01 11:25") # custom time
#' reportgcs(verbal = 2.5) # Error
#' reportgcs(verbal = "erlk") # Error

reportgcs <- function(eye = 4, verbal = 5, motor = 6, now = as.character(Sys.time()), simplify = TRUE){
  # eye = 4; verbal = 5; motor = 6
  if (is.character(eye) | is.character(verbal) | is.character(motor)) stop ("Only integer is acceptable.")
  if (!all(eye%%1 == 0, verbal%%1 == 0, motor%%1 == 0)) stop ("Only integer is acceptable.")

  Eye <- paste0("E", eye)
  Verbal <- paste0("V", verbal)
  Motor <- paste0("M", motor)
  grepEVM <- paste(Eye, Verbal, Motor, sep="|")
  totalgcs = eye + verbal + motor
  severity <- ifelse(totalgcs < 9,
                     yes = "Severe brain injury suspected",
                     no = ifelse(totalgcs < 13,
                                 yes = "Moderate brain injury suspected",
                                 no = "Normal or Minor brain injury suspected"))

  report <- list()
  report$summary <- paste0("GCS ", totalgcs, " = ", paste(Eye, Verbal, Motor), " at ", now)
  report$analysis <- severity
  report$description <- glasgowComaScale[grep(grepEVM, glasgowComaScale$ID), ]

  return(if (simplify == FALSE) report else paste(report$summary, report$analysis))
}

#' Glasgow Coma Scale (GCS)
#'
#' Glasgow Coma Scale (GCS) is a neurological scale which aims to give a reliable and objective way of recording the conscious state of a person for initial as well as subsequent assessment. A patient is assessed against the criteria of the scale, and the resulting points give a patient score between 3 (indicating deep unconsciousness) and either 14 (original scale) or 15 (the more widely used modified or revised scale).
#'
#' \itemize{
#'   \item Class Name of GCS
#' }
#'
#' @usage data(glasgowComaScale)
#' @docType data
#'
#' @references https://en.wikipedia.org/wiki/Glasgow_Coma_Scale
#' @format A data frame

"glasgowComaScale"
