README for the tidy data project
========================================================

This project has one script called **run_analysis.R**. This script works on the [Samsung Galaxy AcceleroMeter and Gyroscope Data](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The script cleans it up and creates a tidy data set that performs many transformations over the data, including clarifying of feature names, selecting a subset of features, and averaging feature values. The file **codebook.md** has detailed information on these transformations.


USAGE
------

- > setwd("DIRECTORY WHERE YOU HAVE THE SCRIPT AND THE INPUT DATA")
- > source("run_analysis.R")

**ASSUMES** that the INPUT DATA, as descibed below is present in the working directory.

OUTPUT
------

This will create a file called *tidy.txt* in the working directory. This file can be perused in R as follows:

READING THE OUTPUT
------------------

- > setwd("SAME AS ABOVE")
- > tidyData <- read.table("tidy.txt", header = TRUE)
- > head(t)

INPUT DATA: Must be present in the working directory
---------------------------------------------------

- A directory called **data** withinin the *R* working directory.
- Files *data/features_info.txt* and *data/activity_labels.txt*
- Files *data/test/subject_test.txt*, *data/test/y_test.txt*, and *data/test/X_test.txt*
- Files *data/train/subject_train.txt*, *data/train/y_train.txt* and *data/train/X_train.txt*

All of this input data is what you will get if you unzip the zip file of the data provided at [this link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
