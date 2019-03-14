library(dplyr)
## run_analysis.R can be run as long as the Samsung data is in the working directory
## dir_path - path to the unziped data in the working directory
dir_path <- "./data/UCI HAR Dataset/"
## Reads names of the variables in the data set
data_variables <- read.table(paste0(dir_path, "features.txt"),
                                col.names = c("Number","Name"))

## Reads training data set and sets variable names
training_data <- read.table(paste0(dir_path,"train/X_train.txt"),
                            col.names = data_variables$Name)
training_labels <- read.table(paste0(dir_path,"train/y_train.txt"),
                              col.names = "activity")
training_subjects <- read.table(paste0(dir_path,"train/subject_train.txt"),
                                col.names = "subject")

## Reads test data set and sets variable names
test_data <- read.table(paste0(dir_path,"test/X_test.txt"),
                        col.names = data_variables$Name)
test_labels <- read.table(paste0(dir_path,"test/y_test.txt"),
                          col.names = "activity")
test_subjects <- read.table(paste0(dir_path,"test/subject_test.txt"),
                            col.names = "subject")

## Merges the training and the test sets to create one data set (task 1)
data <- bind_rows(training_data,test_data)
labels <- bind_rows(training_labels,test_labels)
subjects <- bind_rows(training_subjects,test_subjects)

## Extracts only the measurements on the mean and standard deviation for
## each measurement (task 2). meanFreq is another measurment, it doesn't fit
mean_std_data <- data[,grepl("(mean|std)",colnames(data))]
mean_std_data <- mean_std_data[,!grepl("(meanFreq)",colnames(mean_std_data))]

## Uses descriptive activity names to name the activities in the data set (task 3)
activity_labels <-  read.table(paste0(dir_path,"activity_labels.txt"),
                               col.names = c("label","activity"))
labels$activity <- activity_labels$activity[labels$activity]

## Appropriately labels the data set with descriptive variable names (task 4)
data_names <- colnames(mean_std_data)
data_names <- gsub("\\.\\.","",data_names)
data_names <- gsub("^t","time",data_names)
data_names <- gsub("^f","frequency",data_names)
data_names <- gsub("Acc","Accelerometer",data_names)
data_names <- gsub("Gyro","Gyroscope",data_names)
data_names <- gsub("Mag","Magnitude",data_names)
data_names <- gsub("BodyBody","Body",data_names)
colnames(mean_std_data) <- data_names

## Creates a second, independent tidy data set with the average of each variable
## for each activity and each subject (task 5)
all_data <- bind_cols(mean_std_data,labels,subjects)
tidy_data <- all_data %>%
    group_by(subject,activity) %>%
    summarise_all(mean)

## tidy_data2 <- aggregate(.~activity+subject, data = all_data, mean)
## it's just an alternative, it works too
write.table(tidy_data, paste0(dir_path,"tidyData.txt"), row.name=FALSE)

