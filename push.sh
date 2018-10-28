#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_website_files() {
  git checkout -b other
  git add .
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add origin https:///eduadiez:${GITHUB_TOKEN}@github.com/eduadiez/dappnode-autorelease.git > /dev/null 2>&1
  git push --quiet --set-upstream origin other
}
echo "GITHUB_TOKEN"
echo $GITHUB_TOKEN
setup_git
commit_website_files
upload_files
