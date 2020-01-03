---
layout: post
title:  "[시뮬레이션] PC Selection for Sparse FPCA"
subtitle:   "[시뮬레이션] PC Selection for Sparse FPCA"
categories: data
tags: fda-lab
comments: true
---



## 1. Methods to Choose the Number of PCs

### PVE

#### PVE(Proportion of Variance Explained)

$$ 
\begin{aligned}
    PVE_i &= \frac{\lambda_i}{\sum_{j=1}^{\infty}\lambda_j} \\
    PVE &= \frac{\sum_{j=1}^{K}\lambda_j}{\sum_{j=1}^{\infty}\lambda_j}
\end{aligned}
$$
		
Select $$K$$, the number of PCs, where 
		
$$ PVE \ge 0.95 $$


### Cross-Validation

#### Leave-one-curve-out cross validation

$$ LOOCV_i(K) = \frac{1}{N} \sum_{i=1}^N \lVert \mathbf{Y}_i - \hat{\mathbf{Y}}_i^{-i} \lVert^2  $$

where

$$ \hat{Y_i}^{-i}(t) = \hat\mu(t) + \sum_{k=1}^K \hat\phi_k^{-i}(t) \hat\xi_{ik}^{-i} $$
		
Select $$K$$, the number of FPCs, by minimizing the $$LOOCV$$ error.


### LOOCV with Squared Loss
![](https://github.com/statKim/FDA-Lab/blob/master/Principal%20Component%20Models%20for%20Sparse%20Functional%20Data/Application/pc_selection/img/1.png?raw=T)
##### Figure 1: *Estimated MSE for 1st training data*
<br>

### LOOCV with Kullback–Leibler Loss(Peng and Paul, 2009)
![](https://github.com/statKim/FDA-Lab/blob/master/Principal%20Component%20Models%20for%20Sparse%20Functional%20Data/Application/pc_selection/img/2.png?raw=T)
##### Figure 2: *Estimated Kullback–Leibler divergence for 1st training data*
<br>


## 3. Simulation

#### The Procedure of the Simulation
- Generate the $$100$$ datasets from the temporal gene expression data and split the each dataset with training and test set.
- "Sparsify" the each dataset.
- Estimate the FPC functions and scores using the sparse FPCA method with $$7$$ knots.
- Choose the number of FPCs satisfied $$PVE \ge 0.95$$
- Perform the $$5$$ classification methods for the training sets, and predict for the test sets with the different number of FPCs.


### Simulation Results
![](/assets/20191001-1.png)


### Summary of Results
- Using PVE, almost $$5$$ FPCs are selected.
- The selected FPCs explained about 99% of total variability except $$ N_i \le 5 $$.
- The linear SVM perform well than other kernel SVM methods.
- If there are about $$7$$ out of $$18$$ observations, the model answered more than 90% correctly.


### Conclusion
- LOOCV with squared loss doesn't look like the reliable method.
- Also, LOOCV's computation time is very slow, even though used parallel computing.
- LOOCV with Kullback–Leibler loss looks a better measure than squared loss, but $$\texttt{fpca.mle}$$ function in $$\texttt{fpca}$$ package is very unstable.
- PVE is the more useful method than LOOCV in terms of dimension reduction.


<br>
## Reference

1. Peng, J. and Paul, D. (2009), **A Geometric Approach to Maximum Likelihood Estimation of the Functional Principal Components From Sparse Longitudinal Data.** *Journal of Computational and Graphical Statistics*, 18(4), 995-1015.
2. Yao F. *et al.* (2005), **Functional data analysis for sparse longitudinal data.** *Biometrika*, 95(3), 601-619.


<br>

이 게시글의 원본 [세미나 자료](https://github.com/statKim/FDA-Lab/blob/master/Principal%20Component%20Models%20for%20Sparse%20Functional%20Data/Application/pc_selection/PC%20selection%20for%20sparse%20FPCA.pdf)와 [코드](https://github.com/statKim/FDA-Lab/blob/master/Principal%20Component%20Models%20for%20Sparse%20Functional%20Data/Application/pc_selection/pc_selection.R)는 제 [Github](https://github.com/statKim/FDA-Lab)에서 받으실 수 있습니다.
