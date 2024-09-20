#' Perform SVM-RFE Feature Selection
#'
#' This function performs SVM-RFE feature selection on the training data and saves the results.
#' @param traindata The training data frame.
#' @param target_variable The target variable to predict.
#' @param output_file The file name to save the SVM-RFE results.
#' @export
svm_rfe_feature_selection <- function(traindata, target_variable, output_file) {
  svm_model <- svm(as.formula(paste(target_variable, "~ .")), data = traindata, kernel = "linear")
  svm_rfe <- rfe(traindata[, -which(names(traindata) == target_variable)], traindata[, target_variable], sizes = c(1:ncol(traindata)), rfeControl = rfeControl(functions = caretFuncs, method = "cv"))
  svm_rfe_vars <- svm_rfe$optVariables
  svm_rfe_vars_df <- data.frame(Feature = svm_rfe_vars)
  write.csv(svm_rfe_vars_df, output_file)
}