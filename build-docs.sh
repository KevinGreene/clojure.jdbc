#!/bin/sh
lein doc
(cd doc; make)
cp -vr doc/index.html /tmp/index.html;
cp -vr doc/static /tmp/static
mv -v doc/api /tmp/api
git checkout gh-pages;

rm -rf *
mv -fv /tmp/static .
mv -fv /tmp/index.html .
mv -fv /tmp/api .

git add --all index.html
git add --all api
git add --all static

git commit -a -m "Update doc"
