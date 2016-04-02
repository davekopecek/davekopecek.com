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
    C:\Users\Dave\Projects\davekopecek\site>bundle exec jekyll serve

## Getting Jekyll and Minimal Mistakes to Run on Windows.

This took a bit of doing. Your mileage may vary.

### Getting rid of the CRAZY SSL Error

Problem: After running `bundle exec jekyll serve` you see this embedded in the output:

    SSL_connect returned=1 errno=0 state=SSLv3 read server certificate B: certificate verify failed

This has to do with your gem version. Apparently there were a few versions that were released with incorrect or missing cacert.pem files. There are a lot of suggestions for fixing this out there. The ONLY one that worked was Jerome Cheng's solution found [here](http://ayulin.net/blog/2015/jekyll-3-beta-on-windows/) Scroll down to "Fix SSL the Right Way"


Many Thanks to Jerome for this solution. I was damn near ready to toss it all and fire up wordpress over this issue. 


### Getting rid of the wdm Gemfile error on startup

**Add wdm with `gem install wdm`
**Follow the instructions in the startup error message and add `gem 'wdm', '>= 0.1.0' if Gem.win_platform?` to /Gemfile






## Minimal Mistakes is all about:

* Responsive templates. Looking good on mobile, tablet, and desktop.
* Gracefully degrading in older browsers. Compatible with Internet Explorer 8+ and all modern browsers.
* Minimal embellishments -- content first.
* Optional large feature images for posts and pages.
* Simple and clear permalink structure.
* [Custom 404 page](http://mmistakes.github.io/minimal-mistakes/404.html) to get you started.
* Support for Disqus Comments

![screenshot of Minimal Mistakes theme](http://mmistakes.github.io/minimal-mistakes/images/mm-theme-post-600.jpg)

See a [live version of Minimal Mistakes](http://mmistakes.github.io/minimal-mistakes/) hosted on GitHub.

## Getting Started

Minimal Mistakes takes advantage of Sass and data files to make customizing easier. These features require [Jekyll 2.x](https://github.com/mmistakes/minimal-mistakes/releases/tag/2.1.3) and will not work with older versions of Jekyll.

To learn how to install and use this theme check out the [Setup Guide](http://mmistakes.github.io/minimal-mistakes/theme-setup/) for more information.