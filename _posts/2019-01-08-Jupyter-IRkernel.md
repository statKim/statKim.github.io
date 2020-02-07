---
layout: post
title:  "Jupyter notebook에서 R 사용하기"
subtitle:   "Jupyter notebook에서 R 사용하기"
categories: programming
tags: r
comments: true
---



## 1. 준비사항

- **Anaconda (Jupyter)**
- **R**

<br>

## 2. R에서 Packages 설치

- Rstudio가 아닌 **R Console**에서 실행!!

```R
install.packages('devtools')
devtools::install_github('IRkernel/IRkernel')
IRkernel::installspec()
```

<br>

## 3. Jupyter kernel에 추가되었는지 확인

- cmd 창에서 jupyter kernel list 확인

```bash
$ jupyter kernelspec list
```

- 로컬에 가지고 있던 R과 같은 버전을 사용할 수 있다!

```R
version
```

![irkernel](https://github.com/statKim/TIL/blob/master/R/images/irkernel.png?raw=true)

