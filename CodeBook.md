This code book describes the variables, the data, transformations that I performed to clean up the data.   

### Source of data
The data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:   

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones   

Reference:
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

### Creating One Data Farme
The origional datasets were devided to two partiotions: train and test. Each partition was also devided to three parts. In the first step, all the 6 devided datasets uploaded to R by using `read.table`. The data cambined and merged by using `cbind` and `rbind`. 

Thereafter, dataframe were labled appropriately by using the name list provided in the data source. Some column names had duplication that is solved by adding a unique number to each column name. This numbers later on were rempved. 

At this point a large dataset of 10,299 rows and 563 columns. 

### Creating a smaller Data Farme by using select() operator 
The dplyr library is used to change the dataframes into a tibble. Thecolumns including the word "mean" and "std" is selected to create a new table with 10,299 rows and 88 coulumns. 

### Creating a tidy data set:
The tidyr library is used, and the mean of all the columns is calculated where the whole table was grouped by activity field. Activity field is a categorial column with 6 distinguished values. Therefore, a final table of 6 by 87 was the output. Each row indicates one of the activities and each column the mean of all the observations for each activity. 

### Activity Labels
1. walking
2. walking_upstairs
3. walking_downstairs
4. sitting
5. standing
6. laying

### Subject Labels
Between number 1 to 30.

### Variable names:
As speaked in the origional datasourec: "The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals)."

The table shows the mean of (with prefix 'mean_of_) all the variables for each activity. 

The complete list of variables of each feature vector is as follow:

 [1] "activity"                                  
 [2] "subject"                                   
 [3] "mean_of_tBodyAcc_mean_X"                   
 [4] "mean_of_tBodyAcc_mean_Y"                   
 [5] "mean_of_tBodyAcc_mean_Z"                   
 [6] "mean_of_tGravityAcc_mean_X"                
 [7] "mean_of_tGravityAcc_mean_Y"                
 [8] "mean_of_tGravityAcc_mean_Z"                
 [9] "mean_of_tBodyAccJerk_mean_X"               
[10] "mean_of_tBodyAccJerk_mean_Y"               
[11] "mean_of_tBodyAccJerk_mean_Z"               
[12] "mean_of_tBodyGyro_mean_X"                  
[13] "mean_of_tBodyGyro_mean_Y"                  
[14] "mean_of_tBodyGyro_mean_Z"                  
[15] "mean_of_tBodyGyroJerk_mean_X"              
[16] "mean_of_tBodyGyroJerk_mean_Y"              
[17] "mean_of_tBodyGyroJerk_mean_Z"              
[18] "mean_of_tBodyAccMag_mean"                  
[19] "mean_of_tGravityAccMag_mean"               
[20] "mean_of_tBodyAccJerkMag_mean"              
[21] "mean_of_tBodyGyroMag_mean"                 
[22] "mean_of_tBodyGyroJerkMag_mean"             
[23] "mean_of_fBodyAcc_mean_X"                   
[24] "mean_of_fBodyAcc_mean_Y"                   
[25] "mean_of_fBodyAcc_mean_Z"                   
[26] "mean_of_fBodyAcc_meanFreq_X"               
[27] "mean_of_fBodyAcc_meanFreq_Y"               
[28] "mean_of_fBodyAcc_meanFreq_Z"               
[29] "mean_of_fBodyAccJerk_mean_X"               
[30] "mean_of_fBodyAccJerk_mean_Y"               
[31] "mean_of_fBodyAccJerk_mean_Z"               
[32] "mean_of_fBodyAccJerk_meanFreq_X"           
[33] "mean_of_fBodyAccJerk_meanFreq_Y"           
[34] "mean_of_fBodyAccJerk_meanFreq_Z"           
[35] "mean_of_fBodyGyro_mean_X"                  
[36] "mean_of_fBodyGyro_mean_Y"                  
[37] "mean_of_fBodyGyro_mean_Z"                  
[38] "mean_of_fBodyGyro_meanFreq_X"              
[39] "mean_of_fBodyGyro_meanFreq_Y"              
[40] "mean_of_fBodyGyro_meanFreq_Z"              
[41] "mean_of_fBodyAccMag_mean"                  
[42] "mean_of_fBodyAccMag_meanFreq"              
[43] "mean_of_fBodyBodyAccJerkMag_mean"          
[44] "mean_of_fBodyBodyAccJerkMag_meanFreq"      
[45] "mean_of_fBodyBodyGyroMag_mean"             
[46] "mean_of_fBodyBodyGyroMag_meanFreq"         
[47] "mean_of_fBodyBodyGyroJerkMag_mean"         
[48] "mean_of_fBodyBodyGyroJerkMag_meanFreq"     
[49] "mean_of_angletBodyAccMean,gravity"         
[50] "mean_of_angletBodyAccJerkMean,gravityMean"    
[51] "mean_of_angletBodyGyroMean,gravityMean"    
[52] "mean_of_angletBodyGyroJerkMean,gravityMean"   
[53] "mean_of_angleX,gravityMean"                
[54] "mean_of_angleY,gravityMean"                
[55] "mean_of_angleZ,gravityMean"                
[56] "mean_of_tBodyAcc_std_X"                    
[57] "mean_of_tBodyAcc_std_Y"                    
[58] "mean_of_tBodyAcc_std_Z"                    
[59] "mean_of_tGravityAcc_std_X"                 
[60] "mean_of_tGravityAcc_std_Y"                 
[61] "mean_of_tGravityAcc_std_Z"                 
[62] "mean_of_tBodyAccJerk_std_X"                
[63] "mean_of_tBodyAccJerk_std_Y"                
[64] "mean_of_tBodyAccJerk_std_Z"                
[65] "mean_of_tBodyGyro_std_X"                   
[66] "mean_of_tBodyGyro_std_Y"                   
[67] "mean_of_tBodyGyro_std_Z"                   
[68] "mean_of_tBodyGyroJerk_std_X"               
[69] "mean_of_tBodyGyroJerk_std_Y"               
[70] "mean_of_tBodyGyroJerk_std_Z"               
[71] "mean_of_tBodyAccMag_std"                   
[72] "mean_of_tGravityAccMag_std"                
[73] "mean_of_tBodyAccJerkMag_std"               
[74] "mean_of_tBodyGyroMag_std"                  
[75] "mean_of_tBodyGyroJerkMag_std"              
[76] "mean_of_fBodyAcc_std_X"                    
[77] "mean_of_fBodyAcc_std_Y"                    
[78] "mean_of_fBodyAcc_std_Z"                    
[79] "mean_of_fBodyAccJerk_std_X"                
[80] "mean_of_fBodyAccJerk_std_Y"                
[81] "mean_of_fBodyAccJerk_std_Z"                
[82] "mean_of_fBodyGyro_std_X"                   
[83] "mean_of_fBodyGyro_std_Y"                   
[84] "mean_of_fBodyGyro_std_Z"                   
[85] "mean_of_fBodyAccMag_std"                   
[86] "mean_of_fBodyBodyAccJerkMag_std"           
[87] "mean_of_fBodyBodyGyroMag_std"              
[88] "mean_of_fBodyBodyGyroJerkMag_std"
