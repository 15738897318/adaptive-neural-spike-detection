# Computationally Efficient Adaptive Neural Spike Detection

This repository contains various MATLAB scripts used in my thesis at Imperial College London for a Bachelors degree in Electrical and Electronic Engineering.

## Repository Structure

The repo is split into 3 main folders.  They are described below:

- `static`: Contains all the scripts used in the static algorithm implementation and evaluation process.
- `adaptive`: Contains all the scripts used in adaptive algorithm implementation.
- `datasets`: Inside this folder is a TXT file detailing where to download the relevant datasets from.  They should be stored in this folder.

A few general purpose scripts are included in the root directory.

## Usage

Before any scripts can be run, the appropriate datasets should be downloaded from the URLs detailed in the `datasets` folder.

### Root Directory

- #### detectionStats
  Called from other functions and should not be executed directly.

- #### plotDatasets
  Simply run this script directly and the output will be a plot of all 4 datasets.

- #### plotSpikeLocations
  Can be run directly and will plot the raw spike locations of dataset 1 in red stars.


### Static
The only script in this directory that should be run directly is `staticEvaluationScript`.  Open the other files for comments describing their functionality.

- #### staticEvaluationScript
  This is the only file in this directory that should be executed directly.  To run a particular test, uncomment the desired line and run the file.  It will make calls to the other files in this directory and return a plot showing the tuning process as well as overall performance metrics in the console.


### Adaptive

The directory contains numerous scripts that can be executed, however the usage is extremely simple and is utilised across the directory.

- #### adaptiveEntrypoint
  Can be run directly and will plot histograms showing the result of gradient based preprocessing.  It also returns performance results in the console when running across dataset 1 at a threshold gradient of 35.

- #### Adaptive algorithms
  Most of the scripts in the adaptive folder correspond directly to algorithms detailed in the thesis.  The algorithms and their corresponding scripts are detailed below.  Each script has one input argument that is the path to a dataset to test on - e.g. `"../datasets/simulation_1"`
    * Max amplitude segments = `maxAmpSegments.m`
    * Spike length algorithm = `spikeLength.m`
    * Variable window algorithm = `variableWindow.m`
    * Variable window algorithm with early spike classification = `variableWindowSpikes.m`
    * Static threshold emulation = `staticEmulation.m`
    * Quantile algorithm = `quantileAlgo.m`
