#!/bin/bash
 git checkout --orphan stable
 git rm -rf .
# git commit --allow-empty -m .
 git push origin stable

 git add .
 git commit -m "fixed"
 git switch stable
 git push -f origin stable
