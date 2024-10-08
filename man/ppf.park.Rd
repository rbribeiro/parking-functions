% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/parkingFunctions.R
\name{ppf.park}
\alias{ppf.park}
\title{Simulate a Probabilistic Parking Function}
\usage{
ppf.park(prefs, n, p)
}
\arguments{
\item{prefs}{A vector representing the preferred parking spots for each car.}

\item{n}{The total number of parking spots available.}

\item{p}{The probability of the car deciding to move to the right if its preferred spot is occupied (0 ≤ p ≤ 1).}
}
\value{
A vector representing the final parking configuration. If a car fails to park, its original preferred spot is marked with NA.
}
\description{
This function attempts to park a series of cars in a row of parking spots based on their preferred spots.
Each car has a preference for a specific parking spot and a probability of driving to the right.
If a preferred spot is occupied, the car will try to move to the next spot in the direction dictated by the probability.
If the car cannot find an open spot in the allowed range, it is marked as not parked.
}
