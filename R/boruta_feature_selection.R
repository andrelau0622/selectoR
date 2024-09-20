#' Perform Boruta Feature Selection
#'
#' This function performs Boruta feature selection on the training data and saves the results.
#' @param traindata The training data frame.
#' @param target_variable The target variable to predict.
#' @param output_file The file name to save the Boruta results.
#' @export
feature_selection <- function(traindata, target_variable, output_file) {
  boruta_model <- Boruta(as.formula(paste(target_variable, "~ .")), data = traindata, doTrace = 2)
  boruta_final <- TentativeRoughFix(boruta_model)
  boruta_vars <- getSelectedAttributes(boruta_final, withTentative = F)
  boruta_vars_df <- data.frame(Feature = boruta_vars)
  write.csv(boruta_vars_df, output_file, row.names = FALSE)
  
  # Plot feature importance
  plot(boruta_model, xlab = "", xaxt = "n", main = "Boruta Feature Importance")
  lz <- lapply(1:ncol(boruta_model$ImpHistory), function(i) boruta_model$ImpHistory[is.finite(boruta_model$ImpHistory[, i]), i])
  names(lz) <- colnames(boruta_model$ImpHistory)
  Labels <- sort(sapply(lz, median))
  axis(side = 1, las = 2, labels = names(Labels), at = 1:ncol(boruta_model$ImpHistory), cex.axis = 0.7)
}