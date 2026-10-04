# Data Analysis Project

MATLAB code for the Data Analysis course at Aristotle University of Thessaloniki. The project analyses the [Seoul Bike Sharing](https://archive.ics.uci.edu/dataset/560/seoul+bike+sharing+demand) dataset (`SeoulBike.xlsx`): hourly counts of rented bikes together with weather variables (temperature, humidity, wind speed, visibility, dew point, solar radiation, rainfall, snowfall), the season and a holiday flag.

## Exercises

| Exercise | Topic |
|---|---|
| 1 | Fitting 24 candidate distributions to the bike counts of each hour and season, with histograms and chi-square goodness-of-fit tests |
| 2 | Goodness-of-fit tests on samples drawn from each season |
| 3 | Pairwise t-tests comparing the mean rentals between hours of the day |
| 4 | Bootstrap confidence intervals for the difference in rentals between seasons |
| 5 | Correlation between rentals and temperature per hour and season, shown as colormaps |
| 6 | Mutual information (MIC and GMIC) compared with linear correlation |
| 7 | Linear regression of rentals on temperature, with variable transformations chosen by adjusted R² |
| 8 | Checking whether the same linear model fits two seasons, using random train/test splits |
| 9 | Multiple regression with stepwise variable selection, excluding holidays |

Each exercise has a main script (`Group18ExeNProg1.m`) and helper functions (`Group18ExeNFunM.m`). `MutualInformationXY.m` computes the mutual information between two variables. `Data Analysis notes.txt` collects notes on the MATLAB functions and the theory used.

## Run

Open MATLAB, set the repository folder as the current folder and run an exercise script, for example `Group18Exe1Prog1`. The scripts read `SeoulBike.xlsx` from the same folder.

Requires the Statistics and Machine Learning Toolbox.
