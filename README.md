# Reversible Jump MCMC for Model Selection in Linear Regression

## Overview

This project explores the application of the Reversible Jump Markov Chain Monte Carlo (RJMCMC) algorithm in the context of model selection for linear regression. RJMCMC is an extension of the traditional Markov Chain Monte Carlo (MCMC) methods, allowing for the exploration of models with varying dimensionality. This makes it particularly suitable for problems where the number of predictors in the model is unknown or needs to be determined from the data.

## Key Features

- **Bayesian Model Selection**: Implementation of the RJMCMC algorithm for selecting the optimal subset of predictors in linear regression models.
- **Dynamic Model Exploration**: The algorithm allows for sampling across different model dimensions, providing a flexible approach to model selection.
- **Simulation Studies**: The project includes simulations to evaluate the performance of RJMCMC under various scenarios, including different feature space sizes and levels of noise.

## Project Structure

- **src/**: Contains the source code for the RJMCMC algorithm implementation.
- **data/**: Includes any datasets used in the project, particularly synthetic data generated for simulation studies.
- **results/**: Stores the output of the simulations, including plots and tables summarizing the findings.
- **docs/**: Documentation and reports related to the project, including the final project report in PDF format.
- **README.md**: This file, providing an overview of the project, setup instructions, and other relevant details.

## Installation

To run this project, you need the following dependencies:

- Python 3.x
- NumPy
- SciPy
- Matplotlib
