#' Perform LASSO Feature Selection
#'
#' This function performs LASSO feature selection on the training data and saves the results.
#' @param traindata The training data frame.
#' @param target_variable The target variable to predict.
#' @param output_file The file name to save the LASSO results.
#' @export
lasso_feature_selection <- function(traindata, target_variable, output_file) {
  x_matrix <- model.matrix(as.formula(paste(target_variable, "~ .")), data = traindata)[, -1]
  lasso_model <- cv.glmnet(x_matrix, traindata[, target_variable], family = "binomial", alpha = 1)
  lasso_coeff <- coef(lasso_model, s = "lambda.min")
  lasso_vars <- rownames(lasso_coeff)[lasso_coeff[, 1] != 0]
  lasso_vars_df <- data.frame(Feature = lasso_vars)
  write.csv(lasso_vars_df, output_file)
  
  # Plot LASSO path
  plot(lasso_model)
}