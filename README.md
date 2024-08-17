# Reversible Jump MCMC for Model Selection in Linear Regression

## Overview

This project explores the application of the Reversible Jump Markov Chain Monte Carlo (RJMCMC) algorithm in the context of model selection for linear regression. RJMCMC is an extension of the traditional Markov Chain Monte Carlo (MCMC) methods, allowing for the exploration of models with varying dimensionality. This makes it particularly suitable for problems where the number of predictors in the model is unknown or needs to be determined from the data. For the full report, see the attached pdf.

## Key Features

- **Bayesian Model Selection**: Implementation of the RJMCMC algorithm for selecting the optimal subset of predictors in linear regression models.
- **Dynamic Model Exploration**: The algorithm allows for sampling across different model dimensions, providing a flexible approach to model selection.
- **Simulation Studies**: The project includes simulations to evaluate the performance of RJMCMC under various scenarios, including different feature space sizes and levels of noise.

## Project Structure

- **src/**: Contains the source code for the RJMCMC algorithm implementation.
- **results/**: Stores the output of the simulations, including plots and tables summarizing the findings.
- **docs/**: Documentation and reports related to the project, including the final project report in PDF format.
- **README.md**: This file, providing an overview of the project, setup instructions, and other relevant details.

## Requirements

To run this project, you need the following:

- MATLAB (version R2020a or later)

No additional toolboxes are required unless specified in the individual scripts.

## Usage

To run the RJMCMC algorithm on your own data:

1. Place your dataset in the `data/` directory.
2. Open the MATLAB scripts in the `src/` directory and modify the script to point to your dataset and configure any necessary parameters (e.g., number of iterations, prior distributions).
3. Run the script from within MATLAB:

```matlab
run('src/rjmcmc_script.m')

## License

This project is licensed under the MIT License - see the LICENSE file for details.
