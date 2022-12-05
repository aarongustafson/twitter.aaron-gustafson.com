#!/bin/bash

# build latest
cd /Users/aarongu/Documents/GitHub/twitter.aaron-gustafson.com/ &&
# npm run fetch-new-data &&
/usr/local/bin/git commit -am "archive on ${date}" &&
/usr/local/bin/git push origin main
