---
layout: post
title:  "[시뮬레이션] Reduced Rank Model for Sparse Functional Data"
subtitle:   "[시뮬레이션] Reduced Rank Model for Sparse Functional Data"
categories: data
tags: fda-lab
comments: true
---



## 1. Reduced rank model

#### Reduced rank model

$$ 
\mathbf{Y}_i=\mathbf{B}_i\mathbf{\theta}_{\mu}+\mathbf{B}_i\mathbf{\Theta}\mathbf{\alpha}_i + \mathbf{\epsilon}_i
$$

where $$\mathbf{\theta}_{\mu}$$ is $$q \times 1$$ vector, $$\mathbf{\Theta}$$ is $$ q \times k$$ matrix, $$\mathbf{\alpha}_i$$ is $$k \times 1$$ vector,

$$
 \mathbf{\epsilon}_i \sim (\mathbf{0}, \sigma^2 \mathbf{I}), \ \mathbf{\alpha}_i \sim (\mathbf{0}, \mathbf{D}) 
$$

subject to

$$ 
\mathbf{\Theta}^T \mathbf{\Theta}=\mathbf{I}, \ \int \mathbf{b}(t)^T\mathbf{b}(t)dt=1, \ \int\int \mathbf{b}(t)^T\mathbf{b}(s)dt=0 
$$



#### How to find functional PCs
- mean function
<br>$$\mu(t)=\mathbf{b}(t)^T\mathbf{\theta}_{\mu}$$
- PC function
<br>$$f(t)^T=\mathbf{b}(t)^T\mathbf{\Theta}$$
where $$\mathbf{b}(t)$$ is the orthonormal spline basis and it can be computed by Gram–Schmidt orthonormalization.(Zhou *et al.*(2008))

To find the PC curves, We should estimate $$\mathbf{\theta}_{\mu}, \mathbf{\Theta}$$.


<br>
## 2. EM Algorithm

#### Maximum likelihood (or Penalized least squares)
In the reduced rank model, we should minimized $$L(\mathbf{\theta}_{\mu}, \mathbf{\Theta}, \mathbf{D}, \sigma^2)$$,

$$
\sum_{i=1}^N \bigg \{ (\mathbf{Y}_i-\mathbf{B}_i\mathbf{\theta}_{\mu}-\mathbf{B}_i\mathbf{\Theta}\mathbf{\alpha}_i)^T(\mathbf{Y}_i-\mathbf{B}_i\mathbf{\theta}_{\mu}-\mathbf{B}_i\mathbf{\Theta}\mathbf{\alpha}_i) + \sigma^2 \mathbf{\alpha}_i^T \mathbf{D}^{-1}\mathbf{\alpha}_i \bigg \}
$$

We can minimize this equation using the \texttt{EM} algorithm.


#### Complete data
Let $$\mathbf{\alpha}_i$$ is the latent variable(unobserved), then we can define the complete data $$ \mathbf{Z} = (\mathbf{Y}, \mathbf{\alpha})$$ and employ the $$\texttt{EM}$$ algorithm.

Let $$\mathbf{\Omega}=(\mathbf{\theta}_{\mu},\mathbf{\Theta})$$ and $$L(\mathbf{\Omega}\lvert\mathbf{Z})=-L(\mathbf{\theta}_{\mu},\mathbf{\Theta},\mathbf{D},\sigma^2)$$, then the minimization problem will be equivalent to maximize $$L(\mathbf\Omega \lvert \mathbf{Z})$$.


#### E-step
Compute the expectation of the objective function($$L(\mathbf\Omega \lvert \mathbf{Z})$$) for complete data $$\mathbf{Z}$$,

$$
Q(\mathbf\Omega|\mathbf\Omega^{(t)}) = E\left\{ L(\mathbf\Omega \lvert \mathbf{Z}) \lvert \mathbf{Y},\mathbf\Omega^{(t)} \right\}
$$

where $$\mathbf\Omega^{(t)} = (\mathbf{\theta}_{\mu}^{(t)}, \mathbf{\Theta}^{(t)})$$.
Also we can predict $$\mathbf{\alpha}_i$$ on the E-step.


#### M-step

$$
\mathbf\Omega^{(t+1)} = \arg\max_\mathbf\Omega Q(\mathbf\Omega \lvert \mathbf\Omega^{(t)})
$$

Also we can estimate $$\mathbf{D}, \sigma^2$$ on the M-step.
With many \texttt{EM} iterations, it is known to converge to true parameters.

![](/assets/img/20190809-1.png)


<br>
## 3. Applications

#### Bone Mineral Density data
- 48 white females			
- 160 observations
- It was measured at the different time points and sparsely observed.

![](https://github.com/statKim/FDA-Lab/blob/master/Principal%20Component%20Models%20for%20Sparse%20Functional%20Data/Application/img/curve.png?raw=true)
<center><The bone mineral density of 48 females></center>

<br>
- Fit the reduced rank model using $$\texttt{EM}$$ algorithm
- Initial values $$=0.1 \ (\mathbf{\theta}_{\mu}, \mathbf{\Theta}, \mathbf{D}, \sigma^2, \mathbf{\alpha}_i)$$
- The number of PCs $$=2$$
- $$100$$ $$\texttt{EM}$$ iterations


#### 4 knots
![](https://github.com/statKim/FDA-Lab/blob/master/Principal%20Component%20Models%20for%20Sparse%20Functional%20Data/Application/img/4knots_true.png?raw=true)

![](https://github.com/statKim/FDA-Lab/blob/master/Principal%20Component%20Models%20for%20Sparse%20Functional%20Data/Application/img/4knots.png?raw=true)


#### 9 knots
![](https://github.com/statKim/FDA-Lab/blob/master/Principal%20Component%20Models%20for%20Sparse%20Functional%20Data/Application/img/9knots_true.png?raw=true)

![](https://github.com/statKim/FDA-Lab/blob/master/Principal%20Component%20Models%20for%20Sparse%20Functional%20Data/Application/img/9knots.png?raw=true)


#### 14 knots
![](https://github.com/statKim/FDA-Lab/blob/master/Principal%20Component%20Models%20for%20Sparse%20Functional%20Data/Application/img/14knots_true.png?raw=true)

![](https://github.com/statKim/FDA-Lab/blob/master/Principal%20Component%20Models%20for%20Sparse%20Functional%20Data/Application/img/14knots.png?raw=true)


#### Loglikelihoods for the reduced rank fits

| Number<br> of knots | Paper | Coding |
| ---: | -----: | -----: |
| 4 | 389.22 | 263.22 | 
| 9 | 409.81 | 296.23 |
| 14 | 411.36 | 308.98 |

<br>
## Reference

1. James *et al.* (2000), **Principal component models for sparse functional data.** *Biometrika*, 87(3), 587-602.
2. Ramsay. & Silverman. (2005), **Functional Data Analysis 2nd edition.**  Springer
3. Zhou *et al.* (2008), **Joint modeling of paired sparse functional data using principal components.** *Biometrika*, 95(3), 601-619.

<br>

이 게시글의 원본 [세미나 자료](https://github.com/statKim/FDA-Lab/blob/master/Principal%20Component%20Models%20for%20Sparse%20Functional%20Data/Application/Reduced%20rank%20model.pdf)와 [코드](https://github.com/statKim/FDA-Lab/blob/master/Principal%20Component%20Models%20for%20Sparse%20Functional%20Data/Application/%EB%85%BC%EB%AC%B8%EA%B5%AC%ED%98%84.R)는 제 [Github](https://github.com/statKim/FDA-Lab)에서 받으실 수 있습니다.
