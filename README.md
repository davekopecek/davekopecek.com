## davekopecek.com

My personal blog. Created using [Minimal Mistakes](http://mmistakes.github.io/minimal-mistakes), a two column responsive Jekyll theme. I maintain and deploy this from a Windows 10 system & I'm not a "ruby guy" so things that may be obvious to others were certainly not to me. Some info about my current system:

    C:\>ruby -v
    ruby 2.0.0p645 (2015-04-13) [x64-mingw32]

    C:\>gem -v
    2.0.14

    C:\>jekyll -v
    jekyll 3.1.2

    C:\>bundle -v
    Bundler version 1.11.2

To start Jekyll from my projects directory

    C:\>cd C:\Users\Dave\Projects\davekopecek\site
    C:\Users\Dave\Projects\davekopecek\site>bundle exec jekyll serve --config _config.yml,_config_dev.yml

Above will run using _config_dev.yml - This file overrides url with http://127.0.0.1:4000.
It's excluded from the repo with the .gitignore file


## Getting Jekyll and Minimal Mistakes to Run on Windows.

Took a bit of doing. Mileage may vary.

### Getting rid of the CRAZY SSL Error

Problem: After running `bundle exec jekyll serve` this error embedded in the output:

    SSL_connect returned=1 errno=0 state=SSLv3 read server certificate B: certificate verify failed

This has to do with current gem version. There were a few versions that were released with incorrect or missing cacert.pem files. There are a lot of suggestions for fixing this out there. The ONLY one that worked was Jerome Cheng's solution found [here](http://ayulin.net/blog/2015/jekyll-3-beta-on-windows/) Scroll down to "Fix SSL the Right Way"

Many Thanks to Jerome for this solution. I was damn near ready to toss it all and fire up Wordpress over this issue.

### Getting rid of the wdm Gemfile error on startup

* Add wdm with `gem install wdm`
* Follow the instructions in the startup error message and add `gem 'wdm', '>= 0.1.0' if Gem.win_platform?` to /Gemfile

### Workflow
* Fire up powershell from start menu and navigate to project dir
* `bundle exec octopress new post "New Post Title"`
* `bundle exec jekyll serve`
* View @  http://127.0.0.1:4000/
* Edit _posts/new-post-title.md
* Git add / commit / push

### Deploying

KISS deployment using rsync 'cause that's how I roll:

'./pssync.sh'

Gist of the rsync script. Can be run from powershell:

    rsync -v -rlt -z --delete -e "ssh -i /drives/C/path/to/my/key/id_rsa.ppk -o StrictHostKeyChecking=n o -o UserKnownHostsFile=/dev/null" "/drives/c/Users/Dave/Projects/davekopecek/site/_site/" "username@myserver.comt:httpdocs/"



### Documentation for Minimal Mistakes

To learn how to install and use this theme check out the [Setup Guide](http://mmistakes.github.io/minimal-mistakes/theme-setup/) for more information.
