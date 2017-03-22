---
layout: post
title: 'Shell Secret: (Re)Use Your Words! Repeat Yourself with the Reverse SheBang'
modified:
categories:
excerpt:
tags: [Bash]
image:
  feature: reverse-shebang.jpg
  credit: Gimp & Neon Glow
date: 2017-03-21T17:27:13-04:00
---
I *love*, *Love*, *LOVE* it when linux reaches out and hands me a gift. I've typed on some form of Bash or Zsh command line pretty much every day for as long as I can remember and somehow this gem slipped by me. Like many beautiful things it's dead simple and easy to remember. It's usable just about every day and has an immediate payoff: Fewer keystrokes on the command line and powerful text substituion in scripts. Here goes...

# Behold, The Reverse Shebang `!#`

I've probably typed a "Shebang"  `#!` a gazillion times.  As in `#! /bin/bash`.  It's like typing `<?php` or `<!DOCTYPE html>`. It's just automatic. It turns out there's a "reverse shabang" `!#` that will let you do something *incredibly* useful. Inside a script `#!` represents the current command line. You can reference words in the current command line by following it with a number. Like this: `!#:1`. Like arrays in Javascript, words on the command line are zero-based so `!#:1` will reference the second word on your current command line.

How can this help you?  Ever move a file with a long filename to an ever deeper directory?  Give this a spin:

````
$ mv my-file-with-a-long-name.pdf /someplace/very/far/away/from/here/!#:1
````

If you're sitting in the source file's directory you get the filename pretty much for free using TAB to autocomplete. Same with the target directory. But not the filename. That's pure typing drudgery. Until now.

#SheBang!\# Schlimazel!\# Hasenpfeffer Incorporated!\#

This chunk of awesome comes from Jason Cannon's free kindle ebook [*Bash Command Line Pro Tips*](https://www.amazon.com/Bash-Command-Line-Pro-Tips-ebook/dp/B00K53EO3G). As Jason points out, in scripts you can combine `!#:n` with other goodness to do things like create timestamped files with the original filename like this:

    $ cp  mylogfile.txt $(date +%F)-!#:1
    $ ls
    2017-03-21-mylogfile.txt    mylogfile.txt



Hat tip to Jason for the book. It's a quick read with a bunch of useful tips.


