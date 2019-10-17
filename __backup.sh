#!/bin/sh
. secrets.sh

WORKSPACEID=$1
OUTPUT=$2

echo "$#"
if [ "$#" -eq  "3" ]
 then
   MESSAGE=$3
else
   dt=`date +"%Y%m%d-%H%M%S"`;
   MESSAGE="Backup: $dt"
fi

curl -u "apikey:$APIKEY" "$URL/v1/workspaces/$WORKSPACEID?version=2018-09-20&export=true&include_audit=false&sort=stable" -o $OUTPUT
python prettify.py $OUTPUT
echo "Backed up workspace $WORKSPACEID to $OUTPUT to file system"

git checkout master
git add $OUTPUT
git commit -m  "$MESSAGE"
git status
git push

echo "Backed up workspace $WORKSPACEID as $OUTPUT to Git with message \"$MESSAGE\""
