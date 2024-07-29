

spot_available <- function(parking_spots,spot) {
  if( spot > 0 && spot <=length(parking_spots)  && parking_spots[spot] == 0) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

look_for_spot <- function(parking_spots,car,spot,direction) {
  dir <- list(left = -1, right = 1) # Directions
  if(is.na(spot)) {
    return(FALSE)
  }

  isAvailable <- spot_available(parking_spots,spot)
  if(isAvailable == TRUE) {
    parking_spots[spot] <- car
    return(parking_spots)
  } else {
    while(spot > 0 && spot <=length(parking_spots) && isAvailable == FALSE) {
      spot <- spot + dir[[direction]]
      isAvailable <- spot_available(parking_spots,spot)
      if(isAvailable == TRUE) {
        parking_spots[spot] <- car
        return(parking_spots)
      }
    }
    return(FALSE)
  }
}

############
# Parking scheme with m cars and n spots
###############
parking_scheme <- function(m = 10 ,n = 10,p = 1) {
  pref <- sample(1:n,m,replace = TRUE) # Preferences vector
  spots <- rep(0,n)

  car <- 1
  while(!identical(spots,FALSE) && car <= m) {
    direc <- sample(c("right","left"), size = 1, prob = c(p,1-p))
    spots <- look_for_spot(spots,car,pref[car],direc)

    car <- car + 1
  }
  return(list(pref = pref, spots = spots))
}

results <- replicate(1000, parking_scheme(10,10,1))

c <- 0
for(r in results[2,]) {

  if(identical(r,FALSE)) {
    c <- c +1
  }
}


