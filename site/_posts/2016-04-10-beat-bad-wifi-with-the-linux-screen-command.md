---
layout: post
title: Beat Bad WIFI With the Linux Screen Command
modified:
categories:
excerpt:
comments: true
tags: [Linux Screen]
image:
  feature: wifi.jpg
  credit: Marcus Linder
  creditlink: https://www.flickr.com/photos/linder/
date: 2016-04-10T20:10:01-04:00
---
Nothing makes you crankier than a flakey WIFI connection, right?  What good is being able to work from anywhere you want if you can't work from anywhere you want? I can't fix your WIFI connection, but if your work  takes you to the Linux command line I suggest you check out the `screen` command.

## TL;DR

Screen lets you toggle between terminal screens or windows from a single ssh session. Drop your connection?  No Problem. Log back in and re-attached (`screen -r`) to your running screen.

Screen is also just the ticket for long running processes. Pop into a screen, start the process, detach, log off and go get coffee. It'll be there when you get back.

### Quick And Dirty

Install with:

    [root@machine ~] yum install screen

Screen Basics: Make / Switch / Detach / Re-Attach

    [root@machine ~] screen
    [root@machine ~] "ctrl-a" "c"  // make a new screen
    [root@machine ~] "ctrl-a" "n"  // switch to next screen
    [root@machine ~] "ctrl-a" "d"  // detach from screen on purpose
    ... or your connection drops...
    [root@machine ~] screen -r     // reattach your screen

If you have many screens `screen -r` may give you a list. Reattach to your favorite like this:

    [root@machine~] screen -r 12345.pts-0.machine

## Screen Tutorial

Here's fantactic tutorial appropriately titled [How To Use Linux Screen](https://www.rackaid.com/blog/linux-screen-tutorial-and-how-to/). If you're new to `screen` scroll down to the bottom and check out the video first. You'll be up to speed in no time.

I use `screen` all the time, but if you google `top linux commands` it rarely makes the listicle hit parade. Is there some other command all the cool kids are using? Why? Bueller? Bueller?


