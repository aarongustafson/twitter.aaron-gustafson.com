#!/bin/bash

# Loading this app into a Secure location:
# mkdir ~/Library/Application\ Support/com.aaron-gustafson.twitter 
# cp -R cron.sh ~/Library/Application\ Support/com.aaron-gustafson.twitter/

# Copying over the plist
# cp com.aaron-gustafson.twitter.plist ~/Library/LaunchAgents 
# launchctl load ~/Library/LaunchDaemons/com.aaron-gustafson.twitter.plist 
# launchctl start com.aaron-gustafson.twitter

currentDate=`date`
echo "Building at ${currentDate}"

# build latest
cd /Users/aarongu/GitHub/twitter.aaron-gustafson.com/;
echo "Fetching new data";
/usr/local/bin/npm run fetch-new-data;
echo "Done fetching, updating in Git";
/usr/local/bin/git add .;
/usr/local/bin/git commit -am "archive on ${currentDate}";
/usr/local/bin/git push origin main;
echo "Building";
/usr/local/bin/npm run build;
echo "Build complete, pushing to GitHub";
cd ./_site;
/usr/local/bin/git add .;
/usr/local/bin/git commit -am "Built on ${currentDate}";
/usr/local/bin/git push origin gh-pages;
echo "All done";