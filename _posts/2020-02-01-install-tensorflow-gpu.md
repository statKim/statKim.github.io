---
layout: post
title:  "Tensorflow 2.0 GPU 설치하기"
subtitle:   "Tensorflow 2.0 GPU 설치하기"
categories: programming
tags: python
comments: true
---


## 0. 컴퓨터 사양 확인
- 설치 전, 자신의 컴퓨터의 **운영체제**, **GPU**를 먼저 확인
> 제 컴퓨터 사양
> - 운영체제 : Windows 10
> - GPU : Quadro P600

<br>

## 1. NVIDIA driver 설치
**NVIDIA driver Download** : [https://www.nvidia.co.kr/Download/index.aspx?lang=kr](https://www.nvidia.co.kr/Download/index.aspx?lang=kr)

- 자신의 GPU에 맞는 드라이버 설치

![](https://github.com/statKim/TIL/blob/master/Python/img/nvidia_driver.png?raw=T)

<br>

## 2. CUDA 설치
**CUDA Toolkit Archieve** : [https://developer.nvidia.com/cuda-downloads](https://developer.nvidia.com/cuda-downloads)

- 운영체제와 버전을 선택하여 설치파일 다운로드(여기서는 CUDA 10.0 설치)
- 설치파일 실행하여 CUDA 설치

![](https://github.com/statKim/TIL/blob/master/Python/img/cuda.png?raw=T)

<br>

## 3. cuDNN 설치

**cuDNN Download** : [https://developer.nvidia.com/cudnn](https://developer.nvidia.com/cudnn)

- **회원가입 필요**
- **CUDA에 맞는 버전** 설치파일 다운로드(여기서는 cuDNN 10.0 설치)
- 다운받은 `zip` 파일을 압축 해제(각 폴더마다 1개의 파일이 들어있음)
- 압축 해제된 파일들을 CUDA 설치 경로(`C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA`)에 덮어쓰기 

<figure>
  <img src="https://github.com/statKim/TIL/blob/master/Python/img/cuda_dnn.png?raw=T">
  <figcaption>왼쪽 폴더의 모든 파일들을 오른쪽 폴더에 덮어쓰기)</figcaption>
</figure>

<br>

## 4. 가상환경 생성 및 jupyter kernel 생성

- cmd **관리자 권한**으로 실행
- 가상환경 생성

    ```cmd
    conda create --name tf-gpu python=3.7
    ```

- 가상환경 활성화
    ```cmd
    activate tf-gpu
    ```

- jupyter kernel 생성

    ```cmd
    conda install ipykernel
    python -m ipykernel install --user --name tf-gpu --display-name tf-gpu
    ```

<br>

## 5. Tensorflow 2.0 gpu 설치
- **가상환경 활성화**된 상태에서 tensorflow 2.0 gpu 버전 설치

```cmd
conda install tensorflow-gpu==2.0.0
```

<br>

## 6. 설치 확인

```python
import tensorflow as tf 
print(tf.__version__) 
tf.test.is_gpu_available()
```

```
2.0.0
True
```

<br>

## Reference

- [https://chan-lab.tistory.com/13](https://chan-lab.tistory.com/13)
- [https://stat-ryan.tistory.com/6](https://stat-ryan.tistory.com/6)
- [https://wordbe.tistory.com/entry/Windows-tensorflow-GPU-설치](https://wordbe.tistory.com/entry/Windows-tensorflow-GPU-설치)
