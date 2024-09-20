#' Install and Load Required Packages
#'
#' This function installs and loads all required packages for the analysis.
#' @export
install_and_load_packages <- function() {
  required_packages <- c("caret", "tableone", "autoReg", "MASS", "Boruta", "glmnet", "e1071", "pROC", "car", "ggplot2", "dplyr", "viridis")
  install_if_missing <- function(p) {
    if (!requireNamespace(p, quietly = TRUE)) install.packages(p)
  }
  lapply(required_packages, install_if_missing)
  lapply(required_packages, library, character.only = TRUE)
}