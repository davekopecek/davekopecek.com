#! /bin/bash
echo 'Deploy Blog'

# Build the site for production
cd site
JEKYLL_ENV=production bundle exec jekyll build

# Deploy using rsync
rsync -v -rlt -z --delete -e \
  "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i $HOME/.ssh/id_rsa-p6dev " \
  --progress \
  ~/projects/davekopecek.com/site/_site/ \
  davek-ftp@prod1.aisle8.net:httpdocs/
