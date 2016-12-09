## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

###At first get an download the data

setwd("M:/03_Plan_net_media/13_Insights/02_Intelligence/04_Interne_Projekte/Melanie/Coursera/Kurs 3/Woche 4/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")


### 1. Merges den Trainings und Testdatensatz zusammen, so dass es nur ein Datensatz ist.

X_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# create a whole "x, y,subject" Datensatz
x_data <- rbind(X_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

###2. Extrahieren den Mittelwert und die Standardabweichung der Messung

#extrahieren von mean und SD im Namen
Zusatz <- read.table("features.txt")
meanstd_Zusatz <- grep("-(mean|std)\\(\\)", Zusatz[, 2])

# bilden einer Teilmenge der Dtaen und korrektur des Spaltennamens
x_data <- x_data[, meanstd_Zusatz]
names(x_data) <- Zusatz[meanstd_Zusatz, 2]

###3. Uses descriptive activity names to name the activities in the data set

activits <- read.table("activity_labels.txt")

# Updaten mit korrekten Aktivity (Spalten)Namen
y_data[, 1] <- activits[y_data[, 1], 2]
names(y_data) <- "activity"

###4. Belabeln des Datensatzes mit deskriptiven Namen

names(subject_data) <- "subject"
alle <- cbind(x_data, y_data, subject_data)

###5. Create a second, independent tidy data set with the average of each variable
### for each activity and each subject


newalle<-aggregate(. ~subject + activity, alle, mean)
newalle<-newalle[order(newalle$subject,newalle$activity),]
write.table(newalle, file = "tidyaveragesdata.txt",row.name=FALSE,quote = FALSE, sep = '\t')

###read and test the data

test <- read.table("tidyaveragesdata.txt")
