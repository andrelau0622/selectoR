#' Split Data into Training and Testing Sets
#'
#' This function splits a dataset into training and testing sets based on the target variable and train proportion.
#' @param data The input data frame.
#' @param target_variable The target variable to predict.
#' @param train_proportion The proportion of data to be used for training.
#' @return A list containing the training and testing sets.
#' @export
split_data <- function(data, target_variable, train_proportion) {
  set.seed(123)
  inTrain <- createDataPartition(y = data[, target_variable], p = train_proportion, list = FALSE)
  traindata <- data[inTrain, ]
  testdata <- data[-inTrain, ]
  return(list(train = traindata, test = testdata))
}