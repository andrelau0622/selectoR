#' Perform Multivariate Logistic Regression
#'
#' This function performs multivariate logistic regression on the training data and saves the results.
#' @param traindata The training data frame.
#' @param target_variable The target variable to predict.
#' @param output_file The file name to save the multivariate regression results.
#' @export
multivariate_logistic_regression <- function(traindata, target_variable, output_file) {
  overall.log <- glm(as.formula(paste(target_variable, "~ .")), data = traindata, family = binomial)
  model4 <- autoReg(overall.log, uni = FALSE, multi = TRUE, threshold = 0.05)
  write.csv(model4, output_file, row.names = FALSE)
}