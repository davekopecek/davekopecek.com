#! /bin/bash
echo 'Deploy Blog'
rsync -v -rlt -z --delete -e \
  "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i $HOME/.ssh/id_rsa-p6dev " \
  --progress \
  /mnt/c/projects/davekopecek/site/_site/ \
  davek-ftp@prod9.aisle8.net:httpdocs/
