# Inputs: 
#          This script expects the following 7 files in "data" dir in
#          the working dir:
#          1. features.txt
#          2. train/{X_train.txt, y_train.txt, subject_train.txt}
#          3. test/{X_test.txt, y_test.txt, subject_test.txt}
# Output:
#          It outputs a final file called tidy.txt
#
# Read the Output:
#          tidydata <- read.table(tidy.txt, header = TRUE)
#
# Usage (Run this script):
#          To run this script, first ensure that the 7 input files are
#          in the same directory as the script and then just open R and
#          > source run_analysis.R
#          
# Performs all four steps of the assignment (in a slightly different order,
# for reasons of efficicency.

###############
# STEP 1: Read in all the data (we merge later)
###############
testX <- read.table("data/test/X_test.txt", header = FALSE)
test_sub <- read.table("data/test/subject_test.txt",
                        col.names = c("Subject"), header=FALSE)
test_act <- read.table("data/test/y_test.txt",
                        header=FALSE, col.names = c("Activity"))

trainX <- read.table("data/train/X_train.txt", header = FALSE)
train_sub <- read.table("data/train/subject_train.txt",
                         col.names = c("Subject"), header=FALSE)
train_act <- read.table("data/train/y_train.txt",
                         header=FALSE, col.names = c("Activity"))

###############
# STEPS 2 and 4: Trim data to have only mean and std deviation variables.
# and assign the meaningful names constructed above.
###############

# Construct final_features$Id to be the selected feature ids and
# final_features$Name to be the meaningful names
features_key <- read.table("data/features.txt", header = FALSE,
                            col.names = c("Id", "Name"))
select_pattern <- ("mean|Mean|std|Std")
selected_features <- subset(features_key,
                     grepl(select_pattern, features_key$Name) == TRUE)
selected_features$Name <- gsub("BodyBody", "Body", selected_features$Name)
selected_features$Name <- gsub("\\(\\)", "", selected_features$Name)
selected_features$Name <- gsub("Freq", "", selected_features$Name)
final_features <- selected_features[1:79,]

# Select only the mean/std features
testXfinal <- testX[, final_features$Id]
trainXfinal <- trainX[, final_features$Id]

# Assign them the meaningful names
colnames(testXfinal) <- final_features$Name
colnames(trainXfinal) <- final_features$Name


###############
# STEP 3: Get meaningful activity names.
###############
ActLabels = read.table("data/activity_labels.txt", header = FALSE)
conv <- function(x) { return(ActLabels[x,]$V2)}
test_act$Activity <- as.factor(conv(test_act$Activity))
train_act$Activity <- as.factor(conv(train_act$Activity))


###############
#STEP 5
###############
# get one test table, one train table and then combine them
testfinal <- cbind(testXfinal, test_act)
testfinal <- cbind(testfinal, test_sub)
trainfinal <- cbind(trainXfinal, train_act)
trainfinal <- cbind(trainfinal, train_sub)
start <- dim(trainfinal)[1] + 1
end <- dim(trainfinal)[1] + dim(testfinal)[1]
rownames(testfinal) <- start:end
alldata <- rbind(trainfinal, testfinal)

# Now, the real step 5.
# First, arrange the data so it has only 4 columns
# Variable_Name, Variable_Value, Activity, Subject
library(reshape)
library(data.table)
alldata_lean <- melt(alldata, id = c("Activity", "Subject"))
alldata_lean <- data.table(alldata_lean, key = c("Activity", "Subject"))
alldata_final <-
    alldata_lean[, list(mean(value)), by = c("Activity", "Subject", "variable")]
newnames <- c("Activity", "Subject", "Feature_Name", "Feature_Average_Value")
setnames(alldata_final, colnames(alldata_final), newnames)
write.table(alldata_final, "tidy.txt", row.name=FALSE)

