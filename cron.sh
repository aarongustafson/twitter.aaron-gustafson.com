#!/bin/bash

currentDate=`date`
echo "Building at ${currentDate}"

# build latest
cd /Users/aarongu/Documents/GitHub/twitter.aaron-gustafson.com/ &&
/usr/local/bin/npm run fetch-new-data &&
/usr/local/bin/git add . &&
/usr/local/bin/git commit -am "archive on ${currentDate}" &&
/usr/local/bin/git push origin main &&
/usr/local/bin/npm run build &&
cd ./_site &&
/usr/local/bin/git add . &&
/usr/local/bin/git commit -am "Built on ${currentDate}" &&
/usr/local/bin/git push origin main
