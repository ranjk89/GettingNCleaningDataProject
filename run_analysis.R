run_analysis <- function() {
  ## Extracting Subject
  training_data_subject <- read.table('dataset/train/subject_train.txt')
  test_data_subject <- read.table('dataset/test/subject_test.txt')
  subject <- rbind(training_data_subject, test_data_subject)
  names(subject) <- 'subject'
  
  ##Extracting X values
  activity_labels <- read.table('dataset/activity_labels.txt')
  training_data_x <- read.table('dataset/train/X_train.txt')
  test_data_x <- read.table('dataset/test/X_test.txt')
  dirty_x <- rbind(training_data_x, training_data_x)
  
  ##Setting column names for x
  features <- read.table('dataset/features.txt')
  names(dirty_x) <- features[,2]
  X <- dirty_x[grep('-mean\\(|-std', names(dirty_x))]
  
  ##Extracting Y values
  training_data_y <- read.table('dataset/train/y_train.txt')
  test_data_y <- read.table('dataset/test/y_test.txt')
  Y <- rbind(training_data_y, test_data_y)
  
  ##Setting column names
  y_labels <- cbind(Y, lapply(Y, function(i){activity_labels[i,2]}))
  names(y_labels) <- c('activityCode', 'activity')
  
  ##Merging everything together
  merged_dataset <- cbind(subject, y_labels, X)
  library(data.table)
  merged_dataset <- data.table(merged_dataset)
  
  ##Extractring and saving tidy data
  tidy <- merged_dataset[, lapply(.SD, mean), by = c('subject', 'activity')]
  write.table(tidy,file="tidy_data.txt", row.name=FALSE)
}