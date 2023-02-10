#!/bin/bash

# Loading this app into a Secure location:
# sudo mkdir "/Library/Application Support/com.aaron-gustafson.twitter/" 
# sudo cp -R "cron.sh" "/Library/Application Support/com.aaron-gustafson.twitter/"

# Copying over the plist
# sudo cp com.aaron-gustafson.twitter.plist /Library/LaunchDaemons 
# sudo launchctl load /Library/LaunchDaemons/com.aaron-gustafson.twitter.plist 
# sudo launchctl start com.aaron-gustafson.twitter

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
/usr/local/bin/git push origin gh-pages
