#!/bin/sh


commit_website_files() {
  git checkout -b other
  git add .
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git push --quiet --set-upstream origin other
}

commit_website_files
upload_files
