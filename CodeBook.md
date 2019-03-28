# Code book for "Getting and Cleaning Data" course project
This code book describes the dataset located in the tidy_data.txt file of this repository.

The Data part contains the structure of dataset, the Variables part contains the variables, and the Transformations part contains the transformations carried out to obtain the dataset.

## Data
The tidy_data.txt file contains space-separated values.

The first row contains the names of the variables, and the following rows contain the values of these variables.

## Variables
Each row contains, 79 averaged signal measurements.

### Identifiers
Subject
Subject identifier, integer, from 1 to 30.

* activity

Activity identifier, string, with 6 possible values:

WALKING: subject was walking
WALKING_UPSTAIRS: subject was walking upstairs
WALKING_DOWNSTAIRS: subject was walking downstairs
SITTING: subject was sitting
STANDING: subject was standing
LAYING: subject was laying

### Average of measurements
All measurements are floating-point values.

The measurements are divided into two domains:

* Time-domain signals, obtained from the accelerometer and gyroscope raw signals.

	* timeDomainBodyAccelerometerMeanX
	* timeDomainBodyAccelerometerMeanY
	* timeDomainBodyAccelerometerMeanZ
	* timeDomainBodyAccelerometerStandardDeviationX
	* timeDomainBodyAccelerometerStandardDeviationY
	* timeDomainBodyAccelerometerStandardDeviationZ
	* timeDomainGravityAccelerometerMeanX
	* timeDomainGravityAccelerometerMeanY
	* timeDomainGravityAccelerometerMeanZ
	* timeDomainGravityAccelerometerStandardDeviationX
	* timeDomainGravityAccelerometerStandardDeviationY
	* timeDomainGravityAccelerometerStandardDeviationZ
	* timeDomainBodyAccelerometerJerkMeanX
	* timeDomainBodyAccelerometerJerkMeanY
	* timeDomainBodyAccelerometerJerkMeanZ
	* timeDomainBodyAccelerometerJerkStandardDeviationX
	* timeDomainBodyAccelerometerJerkStandardDeviationY
	* timeDomainBodyAccelerometerJerkStandardDeviationZ
	* timeDomainBodyGyroscopeMeanX
	* timeDomainBodyGyroscopeMeanY
	* timeDomainBodyGyroscopeMeanZ
	* timeDomainBodyGyroscopeStandardDeviationX
	* timeDomainBodyGyroscopeStandardDeviationY
	* timeDomainBodyGyroscopeStandardDeviationZ
	* timeDomainBodyGyroscopeJerkMeanX
	* timeDomainBodyGyroscopeJerkMeanY
	* timeDomainBodyGyroscopeJerkMeanZ
	* timeDomainBodyGyroscopeJerkStandardDeviationX
	* timeDomainBodyGyroscopeJerkStandardDeviationY
	* timeDomainBodyGyroscopeJerkStandardDeviationZ
	* timeDomainBodyAccelerometerMagnitudeMean
	* timeDomainBodyAccelerometerMagnitudeStandardDeviation
	* timeDomainGravityAccelerometerMagnitudeMean
	* timeDomainGravityAccelerometerMagnitudeStandardDeviation
	* timeDomainBodyAccelerometerJerkMagnitudeMean
	* timeDomainBodyAccelerometerJerkMagnitudeStandardDeviation
	* timeDomainBodyGyroscopeMagnitudeMean
	* timeDomainBodyGyroscopeMagnitudeStandardDeviation
	* timeDomainBodyGyroscopeJerkMagnitudeMean
	* timeDomainBodyGyroscopeJerkMagnitudeStandardDeviation

* Frequency-domain signals, obtained by applying Fast Fourier Transform (FFT) to the time-domain signals.
	* frequencyDomainBodyAccelerometerMeanX
	* frequencyDomainBodyAccelerometerMeanY
	* frequencyDomainBodyAccelerometerMeanZ
	* frequencyDomainBodyAccelerometerStandardDeviationX
	* frequencyDomainBodyAccelerometerStandardDeviationY
	* frequencyDomainBodyAccelerometerStandardDeviationZ
	* frequencyDomainBodyAccelerometerMeanFrequencyX
	* frequencyDomainBodyAccelerometerMeanFrequencyY
	* frequencyDomainBodyAccelerometerMeanFrequencyZ
	* frequencyDomainBodyAccelerometerJerkMeanX
	* frequencyDomainBodyAccelerometerJerkMeanY
	* frequencyDomainBodyAccelerometerJerkMeanZ
	* frequencyDomainBodyAccelerometerJerkStandardDeviationX
	* frequencyDomainBodyAccelerometerJerkStandardDeviationY
	* frequencyDomainBodyAccelerometerJerkStandardDeviationZ
	* frequencyDomainBodyAccelerometerJerkMeanFrequencyX
	* frequencyDomainBodyAccelerometerJerkMeanFrequencyY
	* frequencyDomainBodyAccelerometerJerkMeanFrequencyZ
	* frequencyDomainBodyGyroscopeMeanX
	* frequencyDomainBodyGyroscopeMeanY
	* frequencyDomainBodyGyroscopeMeanZ
	* frequencyDomainBodyGyroscopeStandardDeviationX
	* frequencyDomainBodyGyroscopeStandardDeviationY
	* frequencyDomainBodyGyroscopeStandardDeviationZ
	* frequencyDomainBodyGyroscopeMeanFrequencyX
	* frequencyDomainBodyGyroscopeMeanFrequencyY
	* frequencyDomainBodyGyroscopeMeanFrequencyZ
	* frequencyDomainBodyAccelerometerMagnitudeMean
	* frequencyDomainBodyAccelerometerMagnitudeStandardDeviation
	* frequencyDomainBodyAccelerometerMagnitudeMeanFrequency
	* frequencyDomainBodyAccelerometerJerkMagnitudeMean
	* frequencyDomainBodyAccelerometerJerkMagnitudeStandardDeviation
	* frequencyDomainBodyAccelerometerJerkMagnitudeMeanFrequency
	* frequencyDomainBodyGyroscopeMagnitudeMean
	* frequencyDomainBodyGyroscopeMagnitudeStandardDeviation
	* frequencyDomainBodyGyroscopeMagnitudeMeanFrequency
	* frequencyDomainBodyGyroscopeJerkMagnitudeMean
	* frequencyDomainBodyGyroscopeJerkMagnitudeStandardDeviation
	* frequencyDomainBodyGyroscopeJerkMagnitudeMeanFrequency

## Transformations
The following transformations were applied to the source data:

1. The training and test sets were merged to create one data set.
2. The measurements on the mean and standard deviation were extracted for each measurement.
3. The activity identifiers were replaced with descriptive activity names.
4. The variable names were replaced with descriptive variable names.
5. From the data set in step 4, the final data set was created with the average of each variable for each activity and each subject.
