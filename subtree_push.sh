#!/bin/bash

commit_msg=$1

# commit to source branch
git add .
git commit -m "${commit_msg}"
git push origin source

# commit to master branch(blog)
git subtree push --prefix=public https://github.com/statKim/statKim.github.io.git master

echo "Blog update 완료"