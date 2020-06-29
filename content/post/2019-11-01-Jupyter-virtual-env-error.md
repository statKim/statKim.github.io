---
categories:
  - Python
  - error
coverImage: 
coverMeta: out
date: "2019-11-01"
metaAlignment: center
tags:
  - error
  - jupyter notebook
  - kernel
title: Jupyter notebook에서 가상환경 kernel이 인식되지 않는 오류
---


### 오류 발생
- Jupyter notebook 실행 후, 가상환경 kernel이 인식되지 않음
- 동시에 터미널의 Log 메시지에 다음의 오류 발생
```cmd
ImportError: DLL load failed: 지정된 프로시저를 찾을 수 없습니다.
```

<br>

### 해결방법
- 가상환경에 `jupyter`를 설치하면 된다!!

  ```cmd
  activate 가상환경
  pip install jupyter
  ```

  <br>

- [Reference](https://youngjoongkwon.com/2019/10/06/conda-가상환경에서-jupyter-notebook-사용하기/)

