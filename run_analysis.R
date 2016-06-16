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
  y <- rbind(training_data_y, test_data_y)
  
  ##Setting column names
  y_labels <- cbind(y, lapply(y, function(i){activity_labels[i,2]}))
  names(y_labels) <- c('activity code', 'activity name')
  
  ##Merging everything together
  merged <- cbind(subject, y_labels, X)
  library(data.table)
  merged <- data.table(merged)
  
  ##Extractring and saving tidy data
  tidy <- merged[, lapply(.SD, mean), by = c('subject', 'activity name')]
  tidy
}