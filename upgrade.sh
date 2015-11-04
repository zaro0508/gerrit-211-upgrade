#!/bin/bash
set -x #echo on
echo "create 2.8 site"
java -jar gerrit-v2.8.4.19.4548330.war init --batch --no-auto-start -d gerrit_testsite
cp gerrit_testsite-post-upgrade/etc/gerrit.config gerrit_testsite/etc/.
echo "Gerrit 2.8 site created"
echo "Copy git folder to site"
cp -r review_site/git gerrit_testsite/.
echo "Copy folder completed"
echo "Cleanup DB"
./gerrit_db_cleanup.sh
echo "Completed cleanup"
date
echo "Starting upgrade"
java -jar gerrit-2.11.4-2-g97fa846.war init --batch --no-auto-start -d gerrit_testsite
echo "Completed upgrade"
date
echo "Starting reindex"
java -jar gerrit-2.11.4-2-g97fa846.war reindex --threads 4 -d gerrit_testsite
echo "Completed reindex"
date
set +x #echo off

