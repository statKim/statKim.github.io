---
layout: post
title:  "Jekyll 테마로 Github Blog 만들기"
subtitle:   "Jekyll 테마로 Github Blog 만들기"
categories: programming
tags: git
comments: true
---



### 1. Ruby 설치

- [RubyInstaller for Windows](https://rubyinstaller.org/downloads/)에서 **Ruby+Devkit** 설치 프로그램 다운 및 설치
- Ruby의 경우 최신버전보다는 이하 버전 사용을 권장
  - 최신 버전의 경우 jekyll 인스톨시 호환성 문제가 있다고 함
  - 2019.11.03 기준, `Ruby+Devkit 2.5.7` 다운

![Ruby Install](https://github.com/statKim/TIL/blob/master/Git/images/blog_1.png?raw=true)

![Ruby Install](https://github.com/statKim/TIL/blob/master/Git/images/blog_3.png?raw=true)

![Ruby Install](https://github.com/statKim/TIL/blob/master/Git/images/blog_4.png?raw=true)

![Ruby Install](https://github.com/statKim/TIL/blob/master/Git/images/blog_5.png?raw=true)

- Terminal에서 Ruby 설치 확인

```cmd
ruby --version
```

<br>

### 2. Jekyll 설치

- Terminal에서 `jekyll`과 `bundler` 설치

```cmd
gem install jekyll
gem install bundler
jekyll -v   # jekyll 설치되었는지 확인
```

<br>

### 3. Sample Blog 생성

```cmd
jekyll new my_blog        # sample 블로그 생성
cd my_blog                # 블로그 폴더로 이동
bundle exec jekyll serve  # 블로그 호스팅
```

- 만약, encoding 에러 발생시, 아래 명령어 실행 후 다시 실행

```cmd
chcp 65001
bundle exec jekyll serve
```

- [http://127.0.0.1:4000/](http://127.0.0.1:4000/)에 접속해서 생성된 블로그 확인!

![Sample Blog](https://github.com/statKim/TIL/blob/master/Git/images/blog_2.png?raw=true)

<br>

### 4. Github repository에 push

- `github계정.github.io`라는 이름으로 repository 생성
  - ex) `statkim.github.io`

- 다음 명령어로 생성된 repo에 push

```bash
git init
git add .
git commit -m "Github 블로그"
git remote add origin https://github.com/github계정/github계정.github.io
git push -u origin master
```

- `https://github계정.github.io`에 접속하여 생성된 블로그 확인

<br>

### Reference

- [윈도우에서 지킬 설치 및 블로그 생성하기](https://shryu8902.github.io/_posts/2018-06-22-jekyll-on-windows/)
- [GitHub Pages 블로그 준비하기](https://devinlife.com/howto github pages/github-prepare/)
- [jekyll을 이용한 Github 블로그 만들기](http://labs.brandi.co.kr/2018/05/14/chunbs.html)
- [Git](https://jrcho.github.io/2018/01/20/Git.html)

