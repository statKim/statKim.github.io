---
layout: post
title:  "[시뮬레이션] Functional Classification for Sparse Data"
subtitle:   "[시뮬레이션] Functional Classification for Sparse Data"
categories: data
tags: fda-lab
comments: true
---



## 1. $$\texttt{fpca}$$ package

#### $$\texttt{fpca}$$ package
- The package to obtain functional PC for sparsely and irregularly observed data.
- Using the $$\texttt{EM}$$ option, it solves the reduced rank model(James *et al.*) to obtain FPC functions.
- It uses PACE method(Yao *et al.*) not the numerical integration to estimate FPC scores.

### Comparison for Karhunen-Loe`ve Expansion

![](https://github.com/statKim/FDA-Lab/blob/master/Principal%20Component%20Models%20for%20Sparse%20Functional%20Data/Application/sparse_classification/img/1.png?raw=T)
##### <Figure 1: *Predicted curves using 3 FPCs for 1st training set*>


<br>
## 2. Simulation

#### The Classification Methods
- Functional logistic regression
- SVM using FPCs with $$4$$ different kernels
    - Linear
	- Gaussian(Radial basis function)
	- Sigmoid
	- Polynomial


#### The Procedure of the Simulation
- Generate the $$100$$ datasets from the temporal gene expression data and split the each dataset with training and test set.
- "Sparsify" the each dataset.
- Estimate the FPC functions and scores using the sparse FPCA method with $$7$$ knots.
- Perform the $$5$$ classification methods for the training sets, and predict for the test sets with the different number of FPCs.


### Simulation Results

![](/assets/img/20190909-1.png)
![](/assets/img/20190909-2.png)
![](/assets/img/20190909-3.png)
![](/assets/img/20190909-4.png)


#### Comparison between 5 Classification methods
- The logistic regression and linear SVM perform well than other kernel SVM methods.
- When the number of FPCs is greater than or equal to $$3$$, the accuracy is very similar.
- If there are about $$7$$ out of $$18$$ observations, the accuracy is almost the same.


<br>
## Reference

1. James G. *et al.* (2000), **Principal component models for sparse functional data.** *Journal of the American Statistical Association*, 100(470), 577-590.
2. Yao F. *et al.* (2005), **Functional data analysis for sparse longitudinal data.** *Biometrika*, 95(3), 601-619.
3. Rossi F. and Villa N. (2006), **Support vector machine for functional data classification.** *Neurocomputing*, 69, 730-742.
4. Leng. X. and Müller. HG. (2006), **Classification using functional data analysis for temporal gene expression data.** *Bioinformatics*, 22(1), 68-76.

<br>

이 게시글의 원본 [세미나 자료](https://github.com/statKim/FDA-Lab/blob/master/Principal%20Component%20Models%20for%20Sparse%20Functional%20Data/Application/sparse_classification/Functional%20classification%20for%20sparse%20data.pdf)와 [코드](https://github.com/statKim/FDA-Lab/blob/master/Principal%20Component%20Models%20for%20Sparse%20Functional%20Data/Application/sparse_classification/functional%20classification%20sparse.R)는 제 [Github](https://github.com/statKim/FDA-Lab)에서 받으실 수 있습니다.
