#!/bin/bash

# build latest
cd /Users/aarongu/Documents/GitHub/twitter.aaron-gustafson.com/ &&
# npm run fetch-new-data &&
git commit -am "archive on ${date}" &&
git push origin main
