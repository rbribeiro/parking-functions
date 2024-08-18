
# Probabilistic Parking Function Simulation in R

This R package provides a set of functions to simulate and analyze parking behavior based on probabilistic preferences. The package allows users to model scenarios where cars attempt to park in a row of spots according to their preferences, with a given probability of moving in a specific direction when their preferred spot is occupied.

## Installation

You can install the package directly from the source:

```r
# Install the devtools package if it's not already installed
# devtools provides tools to make package development easier, including the ability to install packages from GitHub
if (!requireNamespace("devtools", quietly = TRUE)) {
    install.packages("devtools")
}

# Load the devtools package
library(devtools)

# Install the package from GitHub
install_github("rbribeiro/parking-functions")

# Load the installed package 
library(PPF)

# The package is now installed and loaded. You can start using the functions in the package.
```

## Functions

### `ppf.park()`

Simulates the parking process for a series of cars based on their preferred spots.

- **Usage**: `ppf.park(prefs, n, p)`
- **Arguments**:
  - `prefs`: A vector of preferred parking spots for each car.
  - `n`: The total number of parking spots.
  - `p`: The probability of a car moving to the right if its preferred spot is occupied (0 ≤ p ≤ 1).
- **Returns**: A vector representing the final parking configuration. If a car fails to park, its original preferred spot is marked with `NA`.

### `ppf.parked()`

Checks if all cars successfully parked in their preferred spots.

- **Usage**: `ppf.parked(prefs, n, p)`
- **Arguments**:
  - `prefs`: A vector of preferred parking spots for each car.
  - `n`: The total number of parking spots.
  - `p`: The probability of a car moving to the right if its preferred spot is occupied (0 ≤ p ≤ 1).
- **Returns**: `TRUE` if all cars managed to park, `FALSE` otherwise.

### `ppf.preferences()`

Retrieves the preferences of a specific car across multiple simulation runs.

- **Usage**: `ppf.preferences(N, m, n, j, p)`
- **Arguments**:
  - `N`: The number of simulation repetitions.
  - `m`: The total number of cars.
  - `n`: The total number of parking spots.
  - `j`: The index of the car whose preference you want to retrieve (1 ≤ j ≤ m).
  - `p`: The probability of a car moving to the right if its preferred spot is occupied (0 ≤ p ≤ 1).
- **Returns**: A list of parking preferences for the `j`-th car across successful parking attempts, or `NULL` if no successful parking occurred in `N` repetitions.

## Examples

### Example 1: Basic Parking Simulation

```r
prefs <- c(1, 2, 3, 4)
n <- 5
p <- 0.5
final_parking <- ppf.park(prefs, n, p)
print(final_parking)
```

### Example 2: Check if All Cars Parked

```r
prefs <- c(1, 2, 3, 4)
n <- 4
p <- 0.8
all_parked <- ppf.parked(prefs, n, p)
print(all_parked)
```

### Example 3: Retrieving Preferences for a Specific Car

```r
N <- 100
m <- 5
n <- 5
j <- 2
p <- 0.7
preferences <- ppf.preferences(N, m, n, j, p)
print(preferences)
```

## License

This package is open-source and licensed under the MIT License.
