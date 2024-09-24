嗨嗨嗨又是我！今天整点好玩的！😛

做临床预测模型时筛选变量步骤都很散，于是乎我把常用的方法整合在了一起方便使用！（我知道很low很简单各位大佬别骂我QAQ）

在临床预测模型任务中，通常分为两个派别，一派是临床派一派是工程派

临床派是坚定的经验主义者，在构建模型时，通常会纳入所有临床共识和国际规范中的特征，并纳入那些“有感觉”的特征，并不断优化迭代构建最优模型，最后由临床专家审核临床意义和可行性，这样的模型可解释性是最好的

工程派则是以数据为向导，建模“大力出奇迹”，自己考虑端到端路径的构建，可以不顾临床实践和现实意义，用集成学习或者“黑盒”模型建模，只追求模型性能最优，这样的模型可解释性略逊一筹，但是可以运用SHAP或者LIME等对黑盒进行解释

那么在实战中，还是建议各位同行各取所长，临床派+工程派才是最优解！

那么言归正传，selectoR包主要功能有：

1.  变量相关性分析

2.  膨胀因子（VIF）计算

3.  单/多因素逻辑回归&逐步逻辑回归

4.  Boruta

5.  LASSO

6.  SVM-RFE

7.  单变量AUC大于0.6

具体使用请各位大佬移步demo.R

祝大家玩得开心！🎉

## Installation

### Online Installation

To install the package directly from GitHub, use the following command in R:

``` r
devtools::install_github("andrelau0622/selectoR")
```

### Offline Installation

If you prefer to install the package from a local clone, follow these steps:

1.  Clone the repository to your local machine:

``` bash
git clone https://github.com/andrelau0622/selectoR.git
cd selectoR
```

2.  Install the package using devtools:

``` r
devtools::install()
```
