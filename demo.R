library(selectoR)

# 自定义参数
data_file <- "path/to/your/data.csv"  # 输入数据文件路径
output_train_file <- "output/train_data.csv"  # 输出训练集文件路径
output_test_file <- "output/test_data.csv"  # 输出测试集文件路径
baseline_file <- "output/baseline_table.csv"  # 基线表文件路径
univariate_file <- "output/univariate_results.csv"  # 单因素回归结果文件路径
multivariate_file <- "output/multivariate_results.csv"  # 多因素回归结果文件路径
vif_file <- "output/vif_results.csv"  # VIF 结果文件路径
boruta_file <- "output/boruta_results.csv"  # Boruta 特征选择结果文件路径
lasso_file <- "output/lasso_results.csv"  # LASSO 特征选择结果文件路径
svm_rfe_file <- "output/svm_rfe_results.csv"  # SVM-RFE 结果文件路径

# 读取数据
data <- read.csv(data_file)

# 数据划分
data_partition <- create_data_partition(data, target_variable = "death_within_hosp_30days", train_proportion = 0.7)
train_data <- data_partition$train
test_data <- data_partition$test

# 保存训练集和测试集
write.csv(train_data, output_train_file, row.names = FALSE)
write.csv(test_data, output_test_file, row.names = FALSE)

# 生成基线表
baseline_table <- generate_baseline_table(train_data, categorical_vars = 2:12)
write.csv(baseline_table, baseline_file, row.names = FALSE)

# 单因素回归分析
univariate_results <- perform_univariate_analysis(train_data, target_variable = "death_within_hosp_30days")
write.csv(univariate_results, univariate_file, row.names = FALSE)

# 多因素回归分析
multivariate_results <- perform_multivariate_analysis(train_data, target_variable = "death_within_hosp_30days")
write.csv(multivariate_results, multivariate_file, row.names = FALSE)

# 计算 VIF
vif_results <- calculate_vif(train_data, target_variable = "death_within_hosp_30days")
write.csv(vif_results, vif_file, row.names = FALSE)

# Boruta 特征选择
boruta_results <- perform_boruta(train_data, target_variable = "death_within_hosp_30days")
write.csv(boruta_results, boruta_file, row.names = FALSE)

# LASSO 特征选择
lasso_results <- perform_lasso(train_data, target_variable = "death_within_hosp_30days")
write.csv(lasso_results, lasso_file, row.names = FALSE)

# SVM-RFE 特征选择
svm_rfe_results <- perform_svm_rfe(train_data, target_variable = "death_within_hosp_30days")
write.csv(svm_rfe_results, svm_rfe_file, row.names = FALSE)
