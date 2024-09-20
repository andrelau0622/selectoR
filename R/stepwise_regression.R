#' Perform Stepwise Logistic Regression
#'
#' This function performs stepwise logistic regression on the training data and saves the results.
#' @param traindata The training data frame.
#' @param target_variable The target variable to predict.
#' @param output_file The file name to save the stepwise regression results.
#' @export
stepwise_regression <- function(traindata, target_variable, output_file) {
  overall.log <- glm(as.formula(paste(target_variable, "~ .")), data = traindata, family = binomial)
  stepwise_model <- step(overall.log, direction = "both", threshold = 0.05)
  model_summary <- summary(stepwise_model)
  coefficients_df <- as.data.frame(model_summary$coefficients)
  variables <- rownames(coefficients_df)
  coefficients_df$Variable <- variables
  coefficients_df <- coefficients_df[, c("Variable", "Estimate", "Std. Error", "z value", "Pr(>|z|)")]
  write.csv(coefficients_df, output_file, row.names = FALSE)
}