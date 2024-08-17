# Reversible Jump MCMC for Model Selection in Linear Regression

## Overview

This project explores the application of the Reversible Jump Markov Chain Monte Carlo (RJMCMC) algorithm in the context of model selection for linear regression. RJMCMC is an extension of the traditional Markov Chain Monte Carlo (MCMC) methods, allowing for the exploration of models with varying dimensionality. This makes it particularly suitable for problems where the number of predictors in the model is unknown or needs to be determined from the data. For the full report, see the attached pdf.

## Key Features

- **Bayesian Model Selection**: Implementation of the RJMCMC algorithm for selecting the optimal subset of predictors in linear regression models.
- **Dynamic Model Exploration**: The algorithm allows for sampling across different model dimensions, providing a flexible approach to model selection.
- **Simulation Studies**: The project includes simulations to evaluate the performance of RJMCMC under various scenarios, including different feature space sizes and levels of noise.

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
```

## License
This work is licensed under the [MIT License](LICENSE). You are free to use, modify, and distribute the content in this repository, provided you give appropriate credit to the original author.

## Contributing
Contributions to this repository are welcome. If you have suggestions or improvements, feel free to open an issue or submit a pull request.

## Contact
For any questions or further information, please contact:
- **Younghwan Brian Cho** - [yhcho9270@gmail.com](mailto:yhcho9270@gmail.com)

## Citation
If you use this work in your research, please cite as follows:
```plaintext
Cho, Y. B. (2024). RJMCMC for Model selection in Linear Regression. [RJMCMC-algorithm], GitHub. [https://github.com/YounghwanC/RJMCMC-algorithm.git]
