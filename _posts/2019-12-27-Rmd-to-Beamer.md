---
layout: post
title:  "R markdown으로 Beamer 슬라이드 만들기"
subtitle:   "R markdown으로 Beamer 슬라이드 만들기"
categories: programming
tags: r
comments: true
---


### R markdown의 header

```yaml
---
title: "Rmarkdown to Beamer"
author: "Hyunsung Kim"
date: December 27, 2019
institute: Department of Statistics \newline Chung-Ang University
fonttheme: "professionalfonts"
output:
  beamer_presentation:
    theme: "metropolis"
---
```

- `title` : 제목
- `author` : 저자이름
- `date` : 날짜
- `institute` : 소속(연구소)
- `fonttheme` : Beamer에서 사용할 폰트(LaTeX 폰트 기준) 결정
    - `professionalfonts`는 수식의 경우만 `serif` 폰트로 변환해줌

- `output` : 출력 옵션 결정
  - `theme` : LaTex Beamer의 테마 결정

![](https://github.com/statKim/TIL/blob/master/R/images/rmd_beamer1.png?raw=true)

<br>

### 슬라이드 만들기

- 아래와 같이 `##`으로 슬라이드를 구분
- 수식의 경우, LaTeX 코드 사용

```markdown
## Slide with Math

- inline math : $\widehat X = \sum_{i=1}^n X_i$
- math block
  $$
  \widehat X = \sum_{i=1}^n X_i
  $$
```

![](https://github.com/statKim/TIL/blob/master/R/images/rmd_beamer2.png?raw=true)

<br>

### R output 넣기

```markdown
## Slide with R Output

​```{r cars, echo = TRUE}
summary(cars)
​```
```

![](https://github.com/statKim/TIL/blob/master/R/images/rmd_beamer3.png?raw=true)

<br>

### 그래프 넣기

```markdown
## Slide with Plot

​```{r pressure}
plot(pressure)
​```
```

![](https://github.com/statKim/TIL/blob/master/R/images/rmd_beamer4.png?raw=true)

