#!/bin/bash

# Loading this app into a Secure location:
# sudo mkdir "/Library/Application Support/com.aaron-gustafson.twitter/" 
# sudo cp -R "cron.sh" "/Library/Application Support/com.aaron-gustafson.twitter/"
# sudo chown root:wheel /Library/Application\ Support/com.aaron-gustafson.twitter/cron.sh
# sudo chmod +x /Library/Application\ Support/com.aaron-gustafson.twitter/cron.sh

# Copying over the plist
# sudo cp com.aaron-gustafson.twitter.plist /Library/LaunchDaemons 
# sudo chmod 644 /Library/LaunchDaemons/com.aaron-gustafson.twitter.plist
# sudo launchctl load /Library/LaunchDaemons/com.aaron-gustafson.twitter.plist 
# sudo launchctl start com.aaron-gustafson.twitter

currentDate=`date`
echo "Building at ${currentDate}"

# build latest
cd /Users/aarongu/Documents/GitHub/twitter.aaron-gustafson.com/;
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