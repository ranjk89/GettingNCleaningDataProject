*Dataset Used:* https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
*Original Dataset:* http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
*Names on original dataset:* http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.names


Steps invloved:

* X (sensor input) contains only coloumn names has mean or SD suffix

* Y contains activity codes

* All of these data are combined using data.table package

* Tidy data gets saved in "tiday_data.txt" in the working directory

* You can find the tidy data in "tidy_data.txt"



In addition to existing coloumns 2 new coloumns *subject* and *activiyt* are added to the clean dataset