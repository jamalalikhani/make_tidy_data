# Data: represent data collected from the accelerometers from the Samsung Galaxy S smartphone
# Data Source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# Goal: make tidy dataset
# By: Jamal Alikhani, May 2017

library("dplyr")
library("tidyr")

# set wd:
directory <- "C:/Users/Jamal/Dropbox/ML-Data-CS materials/Data Science Specialization- Coursera/Getting and Cleaning the data/UCI HAR Dataset/"
setwd(directory)

# laoding data:
X_train <- read.table("./train/X_train.txt", header = FALSE, sep = "")
y_train <- read.table("./train/y_train.txt", header = FALSE, sep = "")
X_test <- read.table("./test/X_test.txt", header = FALSE, sep = "")
y_test <- read.table("./test/y_test.txt", header = FALSE, sep = "")

features <- read.table("features.txt", header = FALSE, sep = "")
colnames(X_train) <- features[,2]
colnames(X_test) <- features[,2]
colnames(y_train) <- "activity"
colnames(y_test) <- "activity"
rm(features)  # remove redundant data

# Meging and combining data
train <- cbind(X_train, y_train)
test <- cbind(X_test, y_test)
rm(X_train) # remove redundant data
rm(X_test)  # remove redundant data
rm(y_train) # remove redundant data
rm(y_test)  # remove redundant data

full_dataset <- rbind(train, test)

rm(train) # remove redundant data
rm(test)  # remove redundant data

# using dplyr to select data and modify it:
colNames <- names(full_dataset)
colNames_unique <- paste(colNames, seq(colNames))

colnames(full_dataset) <- colNames_unique

full_df <- tbl_df(full_dataset)
rm(full_dataset)

selected_df <- select(full_df, contains("mean"), contains("std"), contains("activity"))
rm(full_df)


# Uses descriptive activity names to name the activities in the data set
activity_label <- read.table("activity_labels.txt", header = FALSE, sep = "")
activity_label <- tolower(activity_label[,2])

selected_df <- selected_df %>% 
        mutate(activity = factor(`activity 562`, labels = activity_label)) %>% 
        select(-`activity 562`)

# Appropriately labels the data set with descriptive variable names.
selected_df_names <- names(selected_df)
selected_df_names <- gsub("[0-9]", "", selected_df_names) # removing the numbers and () at the end
selected_df_names <- gsub(" ", "", selected_df_names)
selected_df_names <- gsub("-", " ", selected_df_names)
selected_df_names <- gsub("[()]", "", selected_df_names)
colnames(selected_df) <- selected_df_names

# create a tidy dataset (NOTE: column "activity" contains 6 variables)
tidy_UCI_HAR <- selected_df %>% 
        group_by(activity) %>%
        summarise_each(funs(mean)) 

tidy_UCI_HAR_name <- paste("mean_of_", names(tidy_UCI_HAR), sep = "")
tidy_UCI_HAR_name[1] <- names(tidy_UCI_HAR)[1]
colnames(tidy_UCI_HAR) <- tidy_UCI_HAR_name

View(tidy_UCI_HAR)
write.table(tidy_UCI_HAR, file = "tidy_UCI_HAR.txt", row.name=FALSE) 

