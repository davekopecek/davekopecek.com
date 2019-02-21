## davekopecek.com

My personal blog. Created [Jekyll](https://jekyllrb.com/docs/pages/) using [Minimal Mistakes](http://mmistakes.github.io/minimal-mistakes) theme. All commands from WSL-Ubuntu shell

###Local Development Environment

Using WSL, run with dev config on localhost:

    bundle exec jekyll serve --config _config.yml,_config_dev.yml

Runs on  http://127.0.0.1:4000

Local startup, include posts in `_drafts` folder:

````
bundle exec jekyll serve --config _config.yml,_config_dev.yml --drafts
````



### Post Workflow
* Create post file in `_drafts` or `_posts` in format `YYYY-MM-DD-post-title.md` with fronmatter:

  ````
  ---
  layout: post
  title: "99 Percent Pure and Up"
  description: "Sometimes you've got to pick your poison"
  category: articles
  tags: [MSG, yummy]
  ---
  ````

  

* `bundle exec jekyll serve --config _config.yml,_config_dev.yml --drafts --watch`

* View @  http://127.0.0.1:4000/

* Edit _posts/new-post-title.md

* Git add / commit / push / deploy as below

### Deploying

Rsync deploy to production from `sites` directory:

     # // This will build the site without _config_dev.yml on 127.0.0.1
     bundle exec jekyll build
     ../scripts/deploy.sh
     # Clear cloudflare cache
     #../scipts/clearblogcache.sh

Optionally clear cloudflare cache: [Documented Here](http://www.davekopecek.com/cloudflare-command-line-cache-clear)

### Documentation for Minimal Mistakes

To learn how to install and use this theme check out the [Setup Guide](http://mmistakes.github.io/minimal-mistakes/theme-setup/) for more information.

### Installing Jekyll on WSL

https://jekyllrb.com/docs/installation/ubuntu/