#' Simulate a Probabilistic Parking Function
#'
#' This function attempts to park a series of cars in a row of parking spots based on their preferred spots.
#' Each car has a preference for a specific parking spot and a probability of driving to the right.
#' If a preferred spot is occupied, the car will try to move to the next spot in the direction dictated by the probability.
#' If the car cannot find an open spot in the allowed range, it is marked as not parked.
#'
#' @param prefs A vector representing the preferred parking spots for each car.
#' @param n The total number of parking spots available.
#' @param p The probability of the car deciding to move to the right if its preferred spot is occupied (0 ≤ p ≤ 1).
#' @return A vector representing the final parking configuration. If a car fails to park, its original preferred spot is marked with NA.
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
        spots[fav_spot] <- car # spot is free, park here
        break;
      } else {
        fav_spot <- fav_spot + direction # spot is occupied, move!
      }
    }
    # car didn't manage to park
    if(fav_spot < 0 || fav_spot > n) {
      spots[prefs[car]] <- NA
      break;
    }
    car <- car + 1
  }
  return(spots)
}

#' Check if All Cars Successfully Parked
#'
#' This function determines whether all cars successfully parked in a row of parking spots, based on their preferences.
#' It uses the `ppf.park` function to attempt to park the cars and then checks if any car failed to find a spot.
#'
#' @param prefs A vector representing the preferred parking spots for each car.
#' @param n The total number of parking spots available.
#' @param p The probability of a car deciding to move to the right if its preferred spot is occupied (0 ≤ p ≤ 1).
#' @return A boolean value: `TRUE` if all cars managed to park, `FALSE` if any car failed to park.
#' @export
ppf.parked <- function(prefs,n,p)  {
  return(!any(is.na(ppf.park(prefs,n,p))))
}

#' Retrieve Preferences of the j-th Car in a Probabilistic Parking Function
#'
#' This function simulates the parking process multiple times to collect the preferred parking spots of the j-th car, provided that the car successfully parks.
#' It attempts to park the cars in `N` independent repetitions and records the preference of the j-th car each time it successfully parks.
#'
#' @param N The number of repetitions for the simulation.
#' @param m The total number of cars.
#' @param n The total number of parking spots.
#' @param j The index of the car whose preference you want to retrieve (1 ≤ j ≤ m).
#' @param p The probability of a car deciding to move to the right if its preferred spot is occupied (0 ≤ p ≤ 1).
#' @return A list of parking preferences for the j-th car across successful parking attempts, or `NULL` if no successful parking occurred in `N` repetitions.
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

