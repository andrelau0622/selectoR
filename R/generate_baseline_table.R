#' Generate Baseline Table
#'
#' This function generates a baseline table for categorical variables in the training data.
#' @param traindata The training data frame.
#' @param categorical_vars The indices of categorical variables in the data.
#' @param output_file The file name to save the baseline table.
#' @export
generate_baseline_table <- function(traindata, categorical_vars, output_file) {
  x <- traindata
  myVars <- colnames(x[, categorical_vars])
  catVars <- colnames(x[, categorical_vars])
  tab2 <- CreateTableOne(vars = myVars, data = x, factorVars = catVars)
  tab2Mat <- print(tab2, quote = FALSE, noSpaces = TRUE, printToggle = FALSE)
  write.csv(tab2Mat, file = output_file)
}