#!/bin/bash

if test -z "$TRAVIS_BRANCH" 
then
	TRAVIS_BRANCH=master
	echo I\'m not on travis-ci
fi

if test "$TRAVIS_BRANCH" == "master"
then
	echo Deploying to GitHub Pages ...
        git checkout --track -b origin/gh-pages
	git pull
	git add pdf/*.pdf
	git commit -m "autodeploy to pages"
	git push
else
	echo Not in master branch. I won\'t upload to GitHub Pages
fi

