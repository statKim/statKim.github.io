---
layout: post
title:  "Python 가상환경 만들기"
subtitle:   "Python 가상환경 만들기"
categories: programming
tags: python
comments: true
---






> 가상환경을 사용하는 이유
>
> - 여러 사람과 협업 또는 만들어 놓은 코드를 분석할 때 각 프로젝트마다 파이썬, 라이브러리 버전이 다름=> 이로 인해 기존 로컬에 영향이 가지 않는 별개의 가상환경을 만들고 그 안에서만 사용할 패키지를 설치하여 사용!!



### 1. conda를 사용한 가상환경 사용법

> [Reference](http://niceman.tistory.com/85)

- 가상환경 생성

```cmd
# 아나콘다 버전 확인
conda --version

# 아나콘다 업데이트
conda update conda

# 아나콘다 가상환경 생성
conda create --name 가상환경이름 파이썬버전
# 예) 파이썬 3.6.4 버전 설치 & 가상환경 이름은 test
conda create --name test python=3.6.4
```

- 가상환경 활성화 및 비활성화

```cmd
# 설치된 가상환경 리스트 확인
conda info --envs

# 가상환경 활성화
activate 가상환경이름

# 가상환경 비활성화
deactivate
```

- 가상환경 패키지 설치 및 확인 (가상환경 activate된 상태에서 실행)

```cmd
# 가상환경에 설치된 package 확인
pip list
# or
conda list

# pip upgrade
python -m pip install --upgrade pip

# 필요한 library 한번에 설치 (현재 내 컴퓨터로는 잘 안됨...)
pip install -r requirements.txt

# 위 방법으로 안될 때는 아래에 있는 방법 사용해볼것!!
# conda를 이용해서 package 설치
conda install 패키지명
# conda를 이용해서 한 번에 설치
conda install --file requirements.txt
```

- 가상환경 삭제 (root 계정으로 activate 후 삭제하는 것을 추천)

```cmd
# 가상환경 삭제
conda remove --name 가상환경이름 --all
# 예)
conda remove --name test --all

# 가상환경 삭제되었는지 확인
conda info --envs
```

---




### 2. Virtualenv를 사용한 가상환경 사용법

```cmd
cd 경로
# virtualenv 설치
pip install virtualenv	

# 가상환경 만들기 - 현재 경로에 가상환경 폴더 생성
virtualenv 가상환경이름	

# 가상환경 활성화
call 경로/Script/activate
# 활성화되면 terminal 왼쪽에 (가상환경이름) 이 생긴다!!

# 가상환경에 설치된 package 확인
pip list

# 필요한 library 한번에 설치
# (requirements.txt에 필요 library 목록이 있음)
# 가상환경 활성화된 상태에서!!
pip install -r requirements.txt

# 가상환경 비활성화
deactivate

# 가상환경 삭제 -> 가상환경 폴더를 삭제하면 됨!!!
rm -rf 경로/가상환경이름 (리눅스)
rmdir /s 경로/가상환경이름 (cmd - /s:하위 모든 파일 삭제)
```

---



### 3. Jupyter notebook에서 가상환경 사용하기!

- ##### 가상환경에 새로운 kernel 만드는 방법
  - kernel 생성 경로

    > C:\Users\window계정명\AppData\Roaming\jupyter\kernels

```cmd
# 가상환경 활성화
activate <가상환경이름>

# 가상환경에 ipykernel을 설치!!
pip install ipykernel

# jupyter notebook에서 가상환경(kernel)을 선택할 수 있게 만듬
python -m ipykernel install --user --name 가상환경이름 --display-name "<kernel에 표현할 이름>"
```

- ##### jupyter에 추가된 kernel 삭제하는 방법

```cmd
# 가상환경을 파이썬3로 만들기(만약 현재 파이썬 버전이 2.xx일 떄)
virtualenv -p python3 <가상환경이름>

# 현재 가지고 있는 kernel 종류
jupyter kernelspec list

# 생성한 kernel 지우는 방법
jupyter kernelspec remove <지우고 싶은 kernel명>
```

---



### 4. Pycharm에서 가상환경 사용하기!

`File` -> `Settings` -> `Project	` -> `Project Interpreter` -> `+`

-> 해당되는 가상환경 선택 (ex - `conda` or `virtualenv` 등)

 -> `Existing environment` 탭 클릭!!  -> `Interpreter` 옆의 `...` 클릭

-> 가상환경 폴더 내에 있는 "python.exe" 경로 선택 (ex - "C:/Anaconda/envs/가상환경이름/python.exe")

---

