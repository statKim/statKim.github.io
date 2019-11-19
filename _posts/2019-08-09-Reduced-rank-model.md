---
layout: post
title:  "[시뮬레이션] Reduced rank model for sparse functional data"
subtitle:   "[시뮬레이션] Reduced rank model for sparse functional data"
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
- mean function : $$\mu(t)=\mathbf{b}(t)^T\mathbf{\theta}_{\mu}$$
- PC function : $$f(t)^T=\mathbf{b}(t)^T\mathbf{\Theta}$$
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

Let $$\mathbf\Omega = (\mathbf{\theta}_{\mu}, \mathbf{\Theta})$$ and $$ L(\mathbf\Omega|\mathbf{Z}) = -L(\mathbf{\theta}_{\mu}, \mathbf{\Theta}, \mathbf{D}, \sigma^2)$$, then the minimization problem will be equivalent to maximize $$L(\mathbf\Omega|\mathbf{Z})$$.


#### E-step
Compute the expectation of the objective function($L(\mathbf\Omega|\mathbf{Z})$) for complete data $\mathbf{Z}$,

$$
Q(\mathbf\Omega|\mathbf\Omega^{(t)}) = E\left\{ L(\mathbf\Omega|\mathbf{Z})|\mathbf{Y},\mathbf\Omega^{(t)} \right\}
$$

where $$\mathbf\Omega^{(t)} = (\mathbf{\theta}_{\mu}^{(t)}, \mathbf{\Theta}^{(t)})$$.
Also we can predict $$\mathbf{\alpha}_i$$ on the E-step.


#### M-step

$$
\mathbf\Omega^{(t+1)} = \arg\max_\mathbf\Omega Q(\mathbf\Omega|\mathbf\Omega^{(t)})
$$

Also we can estimate $$\mathbf{D}, \sigma^2$$ on the M-step.
With many \texttt{EM} iterations, it is known to converge to true parameters.

$$
\begin{algorithm}[H]
	\KwResult{ The procedure to fit the reduced rank model }
	initialization $( \widehat\mathbf{\theta}^{(1)}_\mu, \widehat\mathbf{\Theta}^{(1)}, \widehat{\mathbf{\alpha}}^{(1)}_i, \widehat\mathbf{D}^{(1)}, \widehat{\sigma^2}^{(1)} )$\;
	\For{$i=2$ to $iterations$}
		{\vspace{0.2cm}
		$$
		\begin{aligned}
			\text{(M-step)}\\
			\widehat{\sigma^2}^{(t+1)} \ &\leftarrow \ ( \widehat\mathbf{\theta}^{(t)}_\mu, \widehat\mathbf{\Theta}^{(t)}, \widehat{\mathbf{\alpha}}^{(t)}_i, \widehat\mathbf{D}^{(t)}, \widehat{\sigma^2}^{(t)} )\\
			\widehat\mathbf{D}^{(t+1)}_{jj} \ &\leftarrow \ ( \widehat\mathbf{\Theta}^{(t)}, \widehat{\mathbf{\alpha}}^{(t)}_i, \widehat\mathbf{D}^{(t)}, \widehat{\sigma^2}^{(t+1)} )\\
			\widehat\mathbf{\theta}^{(t+1)}_{\mu} \ &\leftarrow \ ( \widehat\mathbf{\Theta}^{(t)}, \widehat{\mathbf{\alpha}}^{(t)}_i )\\
			\widehat\mathbf{\Theta}^{(t+1)} \ &\leftarrow \ ( \widehat\mathbf{\theta}^{(t)}_\mu, \widehat\mathbf{\Theta}^{(t)}, \widehat{\mathbf{\alpha}}^{(t)}_i, \widehat\mathbf{D}^{(t+1)}, \widehat{\sigma^2}^{(t+1)} )\\
			\text{(E-step)}\\
			\widehat\mathbf{\alpha}_i^{(t+1)} \ &\leftarrow \ ( \widehat\mathbf{\Theta}^{(t+1)}, \widehat{\mathbf{\alpha}}^{(t+1)}_i, \widehat\mathbf{D}^{(t+1)}, \widehat{\sigma^2}^{(t+1)} )
		\end{aligned}
		$$
		}
\end{algorithm}
$$


<br>
## 3. Applications

#### Bone Mineral Density data
- 48 white females			
- 160 observations
- It was measured at the different time points and sparsely observed.

![](https://github.com/statKim/FDA-Lab/tree/master/Principal Component Models for Sparse Functional Data/Application/img/curve.png?raw=true)
*The bone mineral density of 48 females*


- Fit the reduced rank model using $$\texttt{EM}$$ algorithm
- Initial values $$=0.1 \ (\mathbf{\theta}_{\mu}, \mathbf{\Theta}, \mathbf{D}, \sigma^2, \mathbf{\alpha}_i)$$
- The number of PCs $$=2$$
- $$100$$ $$\texttt{EM}$$ iterations


#### 4 knots
![](https://github.com/statKim/FDA-Lab/tree/master/Principal Component Models for Sparse Functional Data/Application/img/4knots_true.png?raw=true)
![](https://github.com/statKim/FDA-Lab/tree/master/Principal Component Models for Sparse Functional Data/Application/img/4knots.png?raw=true)


#### 9 knots
![](https://github.com/statKim/FDA-Lab/tree/master/Principal Component Models for Sparse Functional Data/Application/img/9knots_true.png?raw=true)
![](https://github.com/statKim/FDA-Lab/tree/master/Principal Component Models for Sparse Functional Data/Application/img/9knots.png?raw=true)


#### 14 knots
![](https://github.com/statKim/FDA-Lab/tree/master/Principal Component Models for Sparse Functional Data/Application/img/14knots_true.png?raw=true)
![](https://github.com/statKim/FDA-Lab/tree/master/Principal Component Models for Sparse Functional Data/Application/img/14knots.png?raw=true)


#### Loglikelihoods for the reduced rank fits

Number of knots | Paper | Coding
--!|----!|----!
$$4$$ | 389.22 | 263.22  
$$9$$ | 409.81 | 296.23 
$$14$$ | 411.36 | 308.98

<br>
## Reference

James *et al.* (2000), **Principal component models for sparse functional data.** *Biometrika*, 87(3), 587-602.

Ramsay. & Silverman. (2005), **Functional Data Analysis 2nd edition.**  Springer

Zhou *et al.* (2008), **Joint modeling of paired sparse functional data using principal components.** *Biometrika*, 95(3), 601-619.

<br>

이 게시글의 원본 [세미나 자료](https://github.com/statKim/FDA-Lab/blob/master/Principal%20Component%20Models%20for%20Sparse%20Functional%20Data/Application/Reduced%20rank%20model.pdf)와 [코드](https://github.com/statKim/FDA-Lab/blob/master/Principal%20Component%20Models%20for%20Sparse%20Functional%20Data/Application/%EB%85%BC%EB%AC%B8%EA%B5%AC%ED%98%84.R)는 제 [Github](https://github.com/statKim/FDA-Lab)에서 받으실 수 있습니다.
