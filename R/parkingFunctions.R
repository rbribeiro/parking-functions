#' Probabilistic Parking Functions
#'
#' Run a uniformly distributed (m,n)-PPF
#'
#' @param m Number of cars.
#' @param n Number of spots.
#' @param p Probability of driving to the right.
#' @return A list pref = preference vectors spots either the parked scheme or FALSE is some car didn't park
#' @export

ppf <- function(m,n,p) {
  # Initialize car preferences
  prefs <- sample(1:n,m,TRUE)
  # Initialize parking
  spots <- rep(NA,n)
  car <- 1
  while(car <= m ) {
    fav_spot <- prefs[car]
    direction <- sample(c(1,-1),prob = c(p,1-p))

    while(fav_spot>0 && fav_spot <= n) {
      if(!is.na(spots[fav_spot])) {
        spots[fav_spot] <- car
        break;
      } else {
        fav_spot <- fav_spot + direction
      }
    }
    if(fav_spot < 0 || fav_spot > n) {
      break;
    }
    car <- car + 1
  }

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
ppf.park <- function(prefs,n,p)  {
  m <- length(prefs)
  # Initialize parking
  spots <- rep(NA,n)
  car <- 1
  while(car <= m ) {
    fav_spot <- prefs[car]
    direction <- sample(c(1,-1),1, prob = c(p,1-p))

    while(fav_spot>0 && fav_spot <= n) {
      if(is.na(spots[fav_spot])) {
        spots[fav_spot] <- car
        break;
      } else {
        fav_spot <- fav_spot + direction
      }
    }
    if(fav_spot < 0 || fav_spot > n) {
      return(FALSE)
    }
    car <- car + 1
  }
  return(TRUE)
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
    prefs <- sample(1:n,m,TRUE)
    if(ppf.park(prefs,n,p)) {
      preferences <- c(preferences,prefs[j])
    }
  }
  return(preferences)
}

