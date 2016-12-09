#Introduction

The script run_analysis.R execute the 5 steps like in the course project's definition.

- At first is all the data merged with the rbind() function, because the data structure is related. Related mean this files have the same number of colums and have the same entities.
- Second the mean and standard deviation measures are creat from the colums. The correct name from this extracted are taken from the *features.txt* file.
- Third the activity data is addressed with values 1:6. The names and IDs of activity is in the file *activity_labels.txt* and they are replaced in the dataset.
- Fourth the whole dataset and his colums with inaccurate column names are corrected.
- Finally, we generate a new dataset with all the average measures for each subject and activity type. The output file is called *tidyaveragesdata.txt*.

###Variables

   *X_train, y_train, x_test, y_test, subject_train and subject_test* is the data from the downloaded files.
   
*x_data, y_data and subject_data* merge the previous datasets to later analysis.
   
*Zusatz* contains the correct names for the x_data dataset, which are applied to the column names which is in *meanstd_Zusatz*.
    Similar with the activity names because of the activities variable.

  *alle merges x_data, y_data and subject_data* in a big dataset.

   Finally *newalle* contains the relevant averages which will be later stored in a .txt file. 
