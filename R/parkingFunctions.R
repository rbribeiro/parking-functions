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
  spots <- rep(0,n)
  for(car in 1:m) {
    fav_spot <- prefs[car]
    direction <- sample(c(1,-1),prob = c(p,1-p))

    while(fav_spot>0 && fav_spot <= n) {
      if(spots[fav_spot] == 0) {
        spots[fav_spot] <- car
        break;
      } else {
        fav_spot <- fav_spot + direction
      }
    }
  }
}
