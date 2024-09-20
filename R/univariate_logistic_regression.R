#' Perform Univariate Logistic Regression
#'
#' This function performs univariate logistic regression on the training data and saves the results.
#' @param traindata The training data frame.
#' @param target_variable The target variable to predict.
#' @param output_file The file name to save the univariate regression results.
#' @export
univariate_logistic_regression <- function(traindata, target_variable, output_file) {
  overall.log <- glm(as.formula(paste(target_variable, "~ .")), data = traindata, family = binomial)
  model3 <- autoReg(overall.log, uni = TRUE, multi = FALSE, threshold = 0.05)
  write.csv(model3, output_file, row.names = FALSE)
}