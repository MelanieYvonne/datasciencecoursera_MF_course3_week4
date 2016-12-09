#Tidied Data from the Human Activity Recognition Using Smartphones Dataset

A few steps were taken to transform the initial data set. The test and train sets have were merged and the subject identifiers and activity labels were pulled in to create a single data set. The activity identifiers were translated from identifiers into human-readable names. Only the mean and standard deviation variables were kept. Those variables were further summarized by taking their mean for each subject/activity pair. There is a single row for each subject/activity pair.

The final data set can be found in the *tidyaveragesdata.txt* file, which can be read into R with read.table("tidyaveragesdata.txt"). A detailed description of the variables can be found in *CodeBook.md*.

*run_analysis.R* contains all the code to perform the analyses described in the 5 steps. 

*Finally: soory for my bad English.*
