---
layout: post
title:  "[시뮬레이션] Functional Logistic Regression with Sparse Functional PCA Method"
subtitle:   "[시뮬레이션] Functional Logistic Regression with Sparse Functional PCA Method"
categories: data
tags: fda-lab
comments: true
---



## 1. Introduction

#### Temporal gene expression data
- The data was measured at $$18$$ equal time points($$0, 7, ..., 119$$).
- From this dense data, We generate 100 datasets based on the functional PCs. 

#### Classification for the simulated data
- We compute FPC scores using sparse functional PCA method.
- Using the above FPC scores, we perform classification using the functional logistic regression.


<br>
## 2. Methods

#### The Sparse Functional PCA
- It can be applied the curves measured at irregular or sparse time points.
- James *et al.* (2001) used the reduced rank model to solve the functional PC problem.
- To fit above model, $$\texttt{EM}$$ algorithm was used.

#### Functional Logistic Regression

$$Y_i = \pi_i + \epsilon_i, \text{   } i=1,\cdots,n $$

where $$Y_i=1$$, if the curve $$\in G_1$$ and $$Y_i=0$$, if the curve $$\in G_2$$,

$$ 
\begin{aligned}
    \pi_i &= P(Y=1|X=\mathbf{x}_i)\\
          &= \frac{ \exp[\alpha + \int_T \beta(t)x_i(t) dt] }{1 + \exp[\alpha + \int_T \beta(t)x_i(t) dt]}
\end{aligned}  
$$

with $$X:T \rightarrow \mathbb{R}$$ is the predictor, $$\alpha$$ is an intercept parameter, $$\mathbf\beta : T \rightarrow \mathbb{R}$$ is a coefficient function, and $$\epsilon_i$$ is the independent errors with zero mean.

#### Functional Logistic Regression with functional PC approach

$$ Y_i = \pi_i + \epsilon_i, \ i=1,\cdots,n $$

where $$Y_i=1$$, if the curve $$\in G_1$$ and $$Y_i=0$$, if the curve $$\in G_2$$,

$$ \pi_i = \frac{ \exp[\alpha + \sum_{k=1}^K \beta_k\xi_{ik}] }{1 + \exp[\alpha + \sum_{k=1}^K \beta_k\xi_{ik}]}, \ i=1,\cdots,n $$

with $$\alpha$$ is an intercept parameter and $$\mathbf\beta$$ is a coefficient function, $$\xi_{ik}$$ is $$k$$th FPC score for the $$i$$th individual, and $$\epsilon_i$$ is the independent errors with zero mean.


<br>
## 3. Simulation

#### The simulated datasets
- The $$100$$ datasets are simulated from the first $$5$$ estimated FPCs from the temporal gene expression data.
- Each dataset has $$200$$ curves with 2 groups($$G_1, G_2$$) and is randomely divided to $$100$$ training and test sets for each.
- We perform the functional logistic regression for the training sets, and predict for the test sets.

![](https://github.com/statKim/FDA-Lab/blob/master/Principal%20Component%20Models%20for%20Sparse%20Functional%20Data/Application/logistic_reg/img/1.png?raw=T)
##### <Figure 1: *The mean curve and 5 FPC functions for $$1$$st training set*>
<br>

![](https://github.com/statKim/FDA-Lab/blob/master/Principal%20Component%20Models%20for%20Sparse%20Functional%20Data/Application/logistic_reg/img/3.png?raw=T)
##### <Figure 2: *Scatterplot of pairwise FPC scores for $$1$$st training dataset*>
<br>

![](https://github.com/statKim/FDA-Lab/blob/master/Principal%20Component%20Models%20for%20Sparse%20Functional%20Data/Application/logistic_reg/img/2.png?raw=T)
##### <Figure 3: *The curves classified $$\mathbf{y}$$ functional logistic regression for $$1$$st simulated dataset*>

<br>
![](/assets/img/20190821-1.png)

#### Comparison between Dense and Sparse FPCA method
- The sparse method shows higher misclassification rate than the dense one.
- The Monte Carlo standard errors are much lower on the sparse method.
- For the data measured at all time points, the dense functional PCA method perform well than the sparse method.


<br>
## Reference

1. James *et al.* (2000), **Principal component models for sparse functional data.** *Biometrika*, 87(3), 587-602.
2. Zhou *et al.* (2008), **Joint modeling of paired sparse functional data using principal components.** *Biometrika*, 95(3), 601-619.
3. Leng. X. and Müller. HG. (2006), **Classification using functional data analysis for temporal gene expression data.** *Bioinformatics*, 22(1), 68-76.

<br>

이 게시글의 원본 [세미나 자료](https://github.com/statKim/FDA-Lab/blob/master/Principal%20Component%20Models%20for%20Sparse%20Functional%20Data/Application/logistic_reg/Functional%20logistic%20regression%20for%20sparse%20functional%20pca%20method.pdf)와 [코드](https://github.com/statKim/FDA-Lab/blob/master/Principal%20Component%20Models%20for%20Sparse%20Functional%20Data/Application/logistic_reg/functional%20logistic.R)는 제 [Github](https://github.com/statKim/FDA-Lab)에서 받으실 수 있습니다.
