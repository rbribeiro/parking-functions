# Probabilistic Parking Functions (PPF)

This R package provides functions to simulate and analyze probabilistic parking functions, which are useful for studying parking strategies and behaviors in probabilistic scenarios.

## Installation

To install the package, clone this repository and use the `devtools` package to install it from the local directory.

```R
# Install devtools if you haven't already
install.packages("devtools")

# Clone the repository
# git clone https://github.com/rbribeiro/ppf-package.git

# Install the package
devtools::install_local("path/to/your/package")
```


## Usage

```R
# Run a probabilistic parking function
result <- ppf(m = 10, n = 15, p = 0.5)
print(result)

# Try to park all cars
preferences <- sample(1:15, 10, TRUE)
is_parked <- ppf.park(prefs = preferences, n = 15, p = 0.5)
print(is_parked)

# Get the preferences of the j-th car
preferences_j <- ppf.preferences(N = 100, m = 10, n = 15, j = 3, p = 0.5)
print(preferences_j)
