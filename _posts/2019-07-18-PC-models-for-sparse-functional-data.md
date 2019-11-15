---
layout: post
title:  "Principal Component Models for Sparse Functional Data 논문 리뷰"
subtitle:   "Principal Component Models for Sparse Functional Data 논문 리뷰"
categories: data
tags: paper
comments: true
---

## Outline

1. Introduction
2. The Growth Curve Data
3. The Reduced Rank Model
4. Fitting the Reduced Rank Model
5. The Reduced Rank and Mixed Effects Methods Compared
6. Model Selection and Inference
7. Comparison of the Reduced Rank Method and Classical Principal Components
8. Appendix



## Introduction
 ![](https://github.com/statKim/FDA-Lab/blob/master/Principal Component Models for Sparse Functional Data/img/1.png?raw=true)
- If each curves observed different time points, it is not good way to apply method with equal time points.
- In this paper, present an estimation technique when the data are sparse and measured at the different time points each curves.


### The direct method
When the curves are not measured at common time points, we estimate the curves by basis expansion and then perform PCA on the estimated curves.

### Drawbacks
- If each curves have few observation, there are not existed unique basis coefficients.
- The solution is not optimal ($$ \because $$ perform PCA onto estimated curves)


### Mixed effect model

$$
Y_i(t) = \mathbf{b}(t)^T \mathbf{\beta} + \mathbf{b}(t)^T \mathbf{\gamma}_i + \epsilon_i(t), \ i=1, \cdots , N
$$

where $$ \mathbf{b}(t)=[b_1(t), ..., b_q(t)]^T $$ is the vector of spline basis functions, $$\mathbf \beta$$ is a fixed vector of spline coefficients, $$\mathbf \gamma_i$$ is a random vector of spline coefficients with covariance matrix $$\mathbf \Gamma$$,
$$ \mathbf Y_i=\mathbf B_i \mathbf \beta + \mathbf B_i\mathbf \gamma_i + \mathbf \epsilon_i $$
where $$\mathbf Y_i$$ is the $$n_i$$-dimensional vector, $$\mathbf B$$ is the $$n_i \times q$$ spline basis matrix

