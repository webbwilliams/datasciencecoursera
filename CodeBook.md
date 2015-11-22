# Codebook for Getting and Cleaning Data Course Project

## Describing the Data

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."

Each measurement is of the triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 

(Most information was copied from the Samsung Website, as it was the best way to word it.)

##Alterations to data

Datasets were combined to facilitate analysis

Some column names were changed. These were either altered from an unnamed header to a descriptive one, or duplicated column names were given a number as a prefix.

For analysis, only columns containing the words "mean" "Mean" and "std" were included, along with the Subject number, the Activity Number, and Activity Description.

The final solution contains the mean for each Subject and activity, with an average for any column containing the previously mentioned parameters. 
