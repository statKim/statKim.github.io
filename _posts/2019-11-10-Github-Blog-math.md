---
layout: post
title:  "Github 블로그에 수식 작성하기"
subtitle:   "Github 블로그에 수식 작성하기"
categories: programming
tags: git
comments: true
---



Github 블로그와 같은 HTML에 수식을 작성할 수 있는 math 엔진 중 `katex`를 사용하여 수식을 작성하는 방법입니다.



- ##### 수식 Block

  $$ y_i=\beta_0 + \beta_1x_i+\epsilon_i $$

  ```latex
  % $$로만 감싸주면 됩니다!
  $$ y_i=\beta_0 + \beta_1x_i+\epsilon_i $$
  ```




- ##### Inline 수식

  \$$y_i=\beta_0 + \beta_1x_i+\epsilon_i$$

  ```latex
  % $$와 더불어 \를 추가로 붙여주어야 합니다.
  \$$ y_i=\beta_0 + \beta_1x_i+\epsilon_i $$
  ```

  - Inline으로 작성할 시에는 앞에 escape symbol `\`를 적어주어야 합니다.

    





