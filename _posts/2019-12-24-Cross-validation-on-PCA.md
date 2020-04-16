---
layout: post
title:  "PCA에서 최적 PC 개수를 정하기 위한 Cross-validation 방법"
subtitle:   "PCA에서 최적 PC 개수를 정하기 위한 Cross-validation 방법"
categories: statistics
tags: paper
comments: true
---



####  1. Row-wise cross-validation

$$
\begin{aligned}
  CV(k) &= \sum_{i=1}^N \lvert \lvert \mathbf{x}_i - \mathbf{\xi} \mathbf{f}_i^T \lvert\vert^2 \\
  	  &= \sum_{i=1}^N \lvert \lvert \mathbf{x}_i - \mathbf{\xi} (\mathbf{x}_i^T\mathbf{\xi})^T \lvert\vert^2
  \end{aligned}
$$

  where $$\mathbf\xi$$ is a PC function(PC loading) with $$k$$ eigenvectors and $$\mathbf{f}_i$$ is $$i$$th PC score with $$k$$ components.

- $$\mathbf{x}_i$$를 predict하는데 사용 => **Overfitting!!**


<br>
#### 2. Wold cross-validation

![Wold cross-validation](https://github.com/statKim/TIL/blob/master/Statistics/img/wold_cv.png?raw=true)

- **NIPALS(Non-linear Iterative Partial Least Squares) algorithm**을 사용하여 missing data imputation

- diagonal pattern의 elements $$x_{ij}$$를 제외하여 "missing value"로 생각하고 cross-validation 진행

- residual matrix에 PCA를 fit하여 CV error 계산

- 간격 $$S$$를 결정해줘야함($$s,s+S,s+2S,\cdots$$,  $$s=1,2,...,S$$)

- ##### Algorithm

  1. Initialize residual matrix, $$X(1)=X$$.

  2. Calculate the sum of squared elements

     $$
     SS_{X(k)} = \sum_i\sum_j x_{ij}^2(k)
     $$
     
  3. Calculate CV error using the residuals $$X(k)$$ left-out segment, $$s$$

     $$
     CV(k) = \sum_i \sum_j (x_{ij}(k) - \hat x_{ij}(k))^2
     $$
     
     where $$\hat x_{ij}(k) = \xi_i f_j^T$$,  $$\xi_i$$ is $$i$$th row of $$\mathbf{\xi}^{(-s)}$$ and $$f_j$$ is $$j$$th row of $$\mathbf{f}^{(-s)}$$.
  
  4. Validate the dimension $$k$$
 
     $$
     R(k) = \frac{CV(k)}{SS_{X(k)}}
     $$
  
     - If $$R<1$$, predictions are improved.
     - If $$R>1$$, predictions does not improved, so the best number of components is $$k-1$$
  
  5. Recalculate the residuals $$X(f)$$ using the complete data matrix $$X$$, and iterate the algorithm with increasing $$k=k+1$$.

- 단점

  - CV error 계산과정에서 $$k-1$$까지의 residual을 사용하여 $$k$$th error 계산 

    => $$k-1$$ components PCA model에 dependent($$x_{ij}$$가 model에 포함) 

    => **Overfitting**


<br>
#### 3. EK cross-validation(Eastment and Krzanowski)

- Overfitting 방지를 위해 prediction과 assessment stage에 each data point를 사용하지 않도록 함

- ##### Procedure

  1. $$x_{ij}$$를 cross-validation하기 위해 2개의 PCA model를 fit

     ![EK cross-validation](https://github.com/statKim/TIL/blob/master/Statistics/img/EK_cv.png?raw=true)

     - $$i$$th row를 제외한 PCA model

       $$
       \mathbf x^{(-i)} = \mathbf{U}^{(-i)} \mathbf{S}^{(-i)} \mathbf{V}^{(-i)T}
       $$

     - $$j$$th column을 제외한 PCA model

       $$
       \mathbf x^{(-j)} = \mathbf{U}^{(-j)} \mathbf{S}^{(-j)} \mathbf{V}^{(-j)T}
       $$

       => $$x_{ij}$$와 independent

  2. Proposed method to combine 2 models by Eastement and Krzanowski

      $$
      \hat{x}_{ij}(k) = \sum^k u_i^{(-j)}(k)\sqrt{s^{(-j)}(k)} \sqrt{s^{(-i)}(k)} v_j^{(-i)}(k)
      $$

  3. Calculate CV error

      $$
      CV(k) = \frac{1}{IJ}\sum_i \sum_j (\hat{x}_{ij}(k) - x_{ij})^2
      $$

  4. Compare the model complexity

     $$
     W(k) = \frac{CV(k-1) - CV(k)}{df_{fit}(k)} \big/ \frac{CV(k)}{df_r(k)}
     $$
     
     where $$df_{fit}(k) = I+J-2k$$ is the number of degrees of freedom lost in fitting the $$k$$th components and $$df_r(k)$$ is the number of degrees of freedom remaining after fitting $$k$$ components.

  5. Choose the $$k$$ such that $$W(k)>1(\text{or }0.9)$$.

- 단점
  
  - 각각 다른 subset에서 parameter를 estimate하기 때문에, true value와 다른 parameter를 estimate하게 된다.


<br>
#### 4. Eigenvector cross-validation

- LOOCV 방법을 사용
- missing data problem (한 변수가 missing인 데이터와 이 데이터로 만들어진 model로 missing variable을 예측하는 문제)

- **Procedure**

  1. Apply PCA on data $$X^{(-i)}$$ left-out $$i$$th row.

  2. For the left-out variables, $$j=1,2,\cdots, J$$

     1. Estimate the score (Least squares form)
   
        $$
        \mathbf{f}^{(-j)T} = \mathbf{x}_i^{(-j)T} \mathbf{\xi}^{(-j)} \big( \mathbf{\xi}^{(-j)T}\mathbf{\xi}^{(-j)}  \big)^{-1}
        $$

     2. Estimate the element $$x_{ij}$$
     
        $$
        \hat{x}_{ij}(k)=\mathbf{f}^{(-j)} \mathbf{\xi}_j^T
        $$

     3. Calculate CV error
     
        $$
        CV(k) = \sum_i \sum_j (x_{ij} - \hat{x}_{ij}(k))^2
        $$

  3. Iterate $$i=1,2,\cdots,I$$.

- $$x_{ij}$$ and $$\hat{x}_{ij}$$ are actually independent.


<br>
#### 5. EM cross-validation

- Overfitting을 일으키는 다음의 2가지 원인을 제거 가능
  - predicted value와 left-out element간의 dependence
  - method가 정확하지 않아서 발생한 error


<br>
#### 6. EM-Wold cross-validation

- Improved version of Wold cross-validation

- 각 segment의 components를 동시에 estimate함으로써 Wold CV의 문제점 해결

- NIPALS algorithm으로 missing data를 다루는 것이 더이상 불가능

- Imputation을 통해 PCA fit 가능

- Element-wise computation (row-wise or column-wise X)

- **Procedure**

  - For left-out element $$s=1,\cdots,IJ$$

    1. Split data into $$X^{(-s)}$$ and $$x^{(s)}$$.

    2. Fit a PCA model by solving
    
       $$
       \min\lvert\lvert \mathbf{X}^{(-s)} - \mathbf{f} \mathbf{\xi}^T \lvert\lvert^2_k
       $$

    3. Find the predicted data matrix as
    
       $$
       \hat X(k) = \mathbf{f} \mathbf{\xi}^T
       $$

    4. Calculate CV error
    
       $$
       CV(k) = \frac{1}{IJ} \sum_s(x_s - \hat x_s(k))
       $$


<br>
#### 7. EM-EK cross-validation

- Improved version of EK cross-validation

- predicted matrix as

  $$
  \hat X = \bigg( \mathbf{U}^{(-j)} \big(\mathbf{U}^{(-j)} \big)^+ \bigg) X^{(-ij)} \bigg( \mathbf{V}^{(-i)} \big(\mathbf{V}^{(-i)} \big)^+ \bigg)^T
  $$

- EM algorithm으로 missing data imputation




<br>
### Reference

1. R. Bro *et al.* (2008), **Cross-validation of component models: A critical look at current methods.** *Analytical and Bioanalytical Chemistry*, 390, 1241-1251.
2. [**How to perform cross-validation for PCA to determine the number of principal components?**](https://stats.stackexchange.com/questions/93845/how-to-perform-cross-validation-for-pca-to-determine-the-number-of-principal-com/115477#115477)
3. [**How to cross-validate PCA, clustering, and matrix decomposition models**](http://alexhwilliams.info/itsneuronalblog/2018/02/26/crossval/)

