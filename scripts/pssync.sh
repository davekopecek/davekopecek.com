echo 'Syncing Blog'
rsync -v -rlt -z --delete -e "ssh -i /drives/C/Users/Dave/Documents/key/moba/id_rsa.ppk -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" "/drives/c/Users/Dave/Projects/davekopecek/site/_site/" "davek-ftp@prod1.aisle8.net:httpdocs/"
