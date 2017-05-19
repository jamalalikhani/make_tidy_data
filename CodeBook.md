This code book describes the variables, the data, transformations that I performed to clean up the data.   

### Source of data
The data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:   

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones   

Reference:
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

### Creating One Data Farme
The origional datasets were devided to two partiotions: train and test. Each partition was also devided to two parts. In the first step, all the 4 devided datasets uploaded to R by using `read.table`. The data cambined and merged by using `cbind` and `rbind`. 

Thereafter, dataframe were labled appropriately by using the name list provided in the data source. Some column names had duplication that is solved by adding a unique number to each column name. This numbers later on were rempved. 

At this point a large dataset of 10,299 rows and 562 columns. 

### Creating a smaller Data Farme by using select() operator 
The dplyr library is used to change the dataframes into a tibble. Thecolumns including the word "mean" and "std" is selected to create a new table with 10,299 rows and 87 coulumns. 

### Creating a tidy data set:
The tidyr library is used, and the mean of all the columns is calculated where the whole table was grouped by activity field. Activity field is a categorial column with 6 distinguished values. Therefore, a final table of 6 by 87 was the output. Each row indicates one of the activities and each column the mean of all the observations for each activity. 

### Activity Labels
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

### Variable names:
As speaked in the origional datasourec: "The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals)."

The table shows the mean of (with prefix 'mean_of_) all the variables for each activity. 

The complete list of variables of each feature vector is as follow:

 [1] "activity"                                  
 [2] "mean_of_tBodyAcc mean X"                   
 [3] "mean_of_tBodyAcc mean Y"                   
 [4] "mean_of_tBodyAcc mean Z"                   
 [5] "mean_of_tGravityAcc mean X"                
 [6] "mean_of_tGravityAcc mean Y"                
 [7] "mean_of_tGravityAcc mean Z"                
 [8] "mean_of_tBodyAccJerk mean X"               
 [9] "mean_of_tBodyAccJerk mean Y"               
[10] "mean_of_tBodyAccJerk mean Z"               
[11] "mean_of_tBodyGyro mean X"                  
[12] "mean_of_tBodyGyro mean Y"                  
[13] "mean_of_tBodyGyro mean Z"                  
[14] "mean_of_tBodyGyroJerk mean X"              
[15] "mean_of_tBodyGyroJerk mean Y"              
[16] "mean_of_tBodyGyroJerk mean Z"              
[17] "mean_of_tBodyAccMag mean"                  
[18] "mean_of_tGravityAccMag mean"               
[19] "mean_of_tBodyAccJerkMag mean"              
[20] "mean_of_tBodyGyroMag mean"                 
[21] "mean_of_tBodyGyroJerkMag mean"             
[22] "mean_of_fBodyAcc mean X"                   
[23] "mean_of_fBodyAcc mean Y"                   
[24] "mean_of_fBodyAcc mean Z"                   
[25] "mean_of_fBodyAcc meanFreq X"               
[26] "mean_of_fBodyAcc meanFreq Y"               
[27] "mean_of_fBodyAcc meanFreq Z"               
[28] "mean_of_fBodyAccJerk mean X"               
[29] "mean_of_fBodyAccJerk mean Y"               
[30] "mean_of_fBodyAccJerk mean Z"               
[31] "mean_of_fBodyAccJerk meanFreq X"           
[32] "mean_of_fBodyAccJerk meanFreq Y"           
[33] "mean_of_fBodyAccJerk meanFreq Z"           
[34] "mean_of_fBodyGyro mean X"                  
[35] "mean_of_fBodyGyro mean Y"                  
[36] "mean_of_fBodyGyro mean Z"                  
[37] "mean_of_fBodyGyro meanFreq X"              
[38] "mean_of_fBodyGyro meanFreq Y"              
[39] "mean_of_fBodyGyro meanFreq Z"              
[40] "mean_of_fBodyAccMag mean"                  
[41] "mean_of_fBodyAccMag meanFreq"              
[42] "mean_of_fBodyBodyAccJerkMag mean"          
[43] "mean_of_fBodyBodyAccJerkMag meanFreq"      
[44] "mean_of_fBodyBodyGyroMag mean"             
[45] "mean_of_fBodyBodyGyroMag meanFreq"         
[46] "mean_of_fBodyBodyGyroJerkMag mean"         
[47] "mean_of_fBodyBodyGyroJerkMag meanFreq"     
[48] "mean_of_angletBodyAccMean,gravity"         
[49] "mean_of_angletBodyAccJerkMean,gravityMean" 
[50] "mean_of_angletBodyGyroMean,gravityMean"    
[51] "mean_of_angletBodyGyroJerkMean,gravityMean"
[52] "mean_of_angleX,gravityMean"                
[53] "mean_of_angleY,gravityMean"                
[54] "mean_of_angleZ,gravityMean"                
[55] "mean_of_tBodyAcc std X"                    
[56] "mean_of_tBodyAcc std Y"                    
[57] "mean_of_tBodyAcc std Z"                    
[58] "mean_of_tGravityAcc std X"                 
[59] "mean_of_tGravityAcc std Y"                 
[60] "mean_of_tGravityAcc std Z"                 
[61] "mean_of_tBodyAccJerk std X"                
[62] "mean_of_tBodyAccJerk std Y"                
[63] "mean_of_tBodyAccJerk std Z"                
[64] "mean_of_tBodyGyro std X"                   
[65] "mean_of_tBodyGyro std Y"                   
[66] "mean_of_tBodyGyro std Z"                   
[67] "mean_of_tBodyGyroJerk std X"               
[68] "mean_of_tBodyGyroJerk std Y"               
[69] "mean_of_tBodyGyroJerk std Z"               
[70] "mean_of_tBodyAccMag std"                   
[71] "mean_of_tGravityAccMag std"                
[72] "mean_of_tBodyAccJerkMag std"               
[73] "mean_of_tBodyGyroMag std"                  
[74] "mean_of_tBodyGyroJerkMag std"              
[75] "mean_of_fBodyAcc std X"                    
[76] "mean_of_fBodyAcc std Y"                    
[77] "mean_of_fBodyAcc std Z"                    
[78] "mean_of_fBodyAccJerk std X"                
[79] "mean_of_fBodyAccJerk std Y"                
[80] "mean_of_fBodyAccJerk std Z"                
[81] "mean_of_fBodyGyro std X"                   
[82] "mean_of_fBodyGyro std Y"                   
[83] "mean_of_fBodyGyro std Z"                   
[84] "mean_of_fBodyAccMag std"                   
[85] "mean_of_fBodyBodyAccJerkMag std"           
[86] "mean_of_fBodyBodyGyroMag std"              
[87] "mean_of_fBodyBodyGyroJerkMag std"
