#!/bin/bash

if test -z "$TRAVIS_BRANCH" 
then
	TRAVIS_BRANCH=master
	echo I\'m not on travis-ci
fi

set -e
if test "$TRAVIS_BRANCH" == "master"
then
	if test -z "$GH_TOKEN"
	then
		echo I don\'t have the GH token!
		exit -1
	fi
	echo Deploying to GitHub Pages ...
	name=$(git --no-pager show -s --format="%aN")
	email=$(git --no-pager show -s --format="%ae")
	echo Today\'s commit belongs to "$name" \("$email"\)
	echo Cloning pages
	git clone --depth 1 --branch gh-pages https://$GH_TOKEN@github.com/ccfd/course_materials.git deploy
	cp pdf/*.pdf deploy/pdf/
	pushd deploy
        git config user.email "$email"
	git config user.name "$name"
	git add pdf/*.pdf
	git commit -m "autodeploy to pages"
#	git push
	popd
	rm -fr deploy
else
	echo Not in master branch. I won\'t upload to GitHub Pages
fi

