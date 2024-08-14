#' Probabilistic Parking Functions
#'
#' Try to park the cars given the preference vector
#'
#' @param m Number of cars.
#' @param n Number of spots.
#' @param p Probability of driving to the right.
#' @return A vector with the park configuration. If the result has NA, then some car didn't park.
#' @export
ppf.park <- function(prefs,n,p) {
  m <- length(prefs)
  # Initialize parking
  spots <- rep(0,n)
  car <- 1
  while(car <= m ) {
    fav_spot <- prefs[car]
    direction <- 2*rbinom(1,1,p)-1
    while(fav_spot>0 && fav_spot <= n) {
      if(spots[fav_spot] == 0) {
        spots[fav_spot] <- car
        break;
      } else {
        fav_spot <- fav_spot + direction
      }
    }
    if(fav_spot < 0 || fav_spot > n) {
      spots[prefs[car]] <- NA
      break;
    }
    car <- car + 1
  }
  return(spots)
}

#' Probabilistic Parking Functions
#'
#' Try to park all cars given their preferences, number of spots and direction probability
#'
#' @param prefs Vector of cars' preferences
#' @param n Number of spots.
#' @param p Probability of driving to the right.
#' @return TRUE if all cars have parked FALSE otherwise
#' @export
ppf.parked <- function(prefs,n,p)  {
  return(!any(is.na(ppf.park(prefs,n,p))))
}

#' Probabilistic Parking Functions
#'
#' Get the preferences of the j-th car of a parking function
#'
#' @param N number of repetitions
#' @param m Number of cars.
#' @param n Number of spots.
#' @param j j-th car.
#' @param p Probability of driving to the right.
#' @return A list of preferences or NULL if in N repetitions there were no successful in parking
#' @export
ppf.preferences <- function(N,m,n,j,p) {
  preferences <- c()
  for(i in 1:N) {
    prefs <- sample(1:n,size = m,replace = TRUE)
    hasParked <- ppf.parked(prefs,n,p)
    if(hasParked) {
      preferences <- c(preferences,prefs[j])
    }
  }
  return(preferences)
}

ppf.preferenceHistogram <- function(N,m,n,j,p) {
  preferences <- ppf.preferences(N,m,n,j,p)
  hist(preferences, probability = TRUE)
}



