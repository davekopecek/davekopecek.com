#! /bin/bash
echo 'Syncing Blog'
rsync -v -rlt -z --delete -e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" /mnt/c/Users/Dave/Projects/davekopecek/site/_site/ "davek-ftp@prod1.aisle8.net:httpdocs/"
