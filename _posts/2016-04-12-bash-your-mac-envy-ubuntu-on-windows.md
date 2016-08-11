---
layout: post
title: Bash Your Mac Envy with Ubuntu on Windows
modified:
categories:
excerpt:
comments: true
tags: [Ubuntu on Windows]
image:
  feature: ubuntu-on-windows-10.jpg
  credit: yosuke muroya
  creditlink: https://www.flickr.com/photos/hamur0w0/
date: 2016-04-12T19:28:52-04:00
---

When I stumbled on Dustin Kurkland's blog post [Ubuntu on Windows -- The Ubuntu Userspace for Windows Developers](http://blog.dustinkirkland.com/2016/03/ubuntu-on-windows.html) on March 31st I really thought I had found the setup for an elaborate April Fool's day prank. An Ubuntu user space inside of windows? Crazy Talk.

## Windows Bourne Again

I spent the last week of March wrestling with various versions Cygwin & Git Bash that accumulated on my Windows 10 system. Scripts that worked in one didn't work in another. An evening spent with [rix0rrr](https://github.com/rix0rrr)'s' fantastic [Windows Path Editor](https://rix0rrr.github.io/WindowsPathEditor/) was time well spent, I had a "good enough" solution but I was still left feeling burned. I have simple needs. Just let me drop into a good old Bash shell, get my work done and I'll be on my way. The cool kids with the shiny Macs can do it. Why, Windows? Why can't I?

##He Clicked on [Preview Build 14316](https://blogs.windows.com/windowsexperience/2016/04/06/announcing-windows-10-insider-preview-build-14316/) and You'll Never Guess What Happened Next !!

And then there were more rumblings. No, Dustin hadn't set us all up with a cruel joke. _From the mouth of [Microsoft itself](https://blogs.windows.com/windowsexperience/2016/04/06/announcing-windows-10-insider-preview-build-14316/) on April 6, 2016:_

>> Today we are releasing Windows 10 Insider Preview Build 14316 to Windows Insiders in the Fast ring...

>> Here’s what’s new in Build 14316
Run native Bash on Ubuntu on Windows: In this build, you can natively run Bash in Windows as announced last week at Build 2016.

Game On! I had enrolled in [Microsoft's Insider Program](https://insider.windows.com/) pre-Windows 10. Golden ticket in hand I fired up to the old machine in the attic, installed about a bazillion updates and finally got Build 14316. A little more googling revealed the need to visit the `Turn Windows Features on or off` to enable the `Windows Subsystem for Linux(Beta)` option. A reboot later and:


<figure>
  <a href="/images/bash-1.jpg"><img src="/images/bash-1.jpg"></a>
  <figcaption><a href="bash-1.jpg" title="Entered `bash` from CMD prompt to install">Entered 'bash' from CMD prompt to install</a>.</figcaption>
</figure>

<figure>
  <a href="/images/bash-2-git-install.jpg"><img src="/images/bash-2-git-install.jpg"></a>
  <figcaption><a href="bash-2-git-install.jpg" title="Packages!! Ima Git me some">Packages!! Ima Git me some</a>.</figcaption>
</figure>

## Better than Lickable Wallpaper
<figure>
  <a href="http://45.media.tumblr.com/34ad7e4990a285be2019330be88171c6/tumblr_mtjrtyUJ1E1s0teago4_400.gif"><img src="http://45.media.tumblr.com/34ad7e4990a285be2019330be88171c6/tumblr_mtjrtyUJ1E1s0teago4_400.gif"></a>
  <figcaption><a href="http://45.media.tumblr.com/34ad7e4990a285be2019330be88171c6/tumblr_mtjrtyUJ1E1s0teago4_400.gif" title="Listen to the man."></a>.</figcaption>
</figure>

<figure>
  <a href="/images/bash-5-lsb-release-a.jpg"><img src="/images/bash-5-lsb-release-a.jpg"></a>
  <figcaption><a href="/images/bash-5-lsb-release-a.jpg" title="Looks like Trusty">Looks like Trusty</a>.</figcaption>
</figure>

You get the idea. I feel my Mac envy fading.

## What? No Sprinkles?

Damn it. I just *had* to push the envlope. Had to. Tried `sudo apt-get install docker-engine` and no dice. It seems with all the Azure / Docker buzz floating around this might a very cool thing for Redmond to get all over. I am never satisfied. Well, maybe for a little while.

<figure>
  <a href="/images/docker-install-errors.jpg"><img src="/images/docker-install-errors.jpg"></a>
  <figcaption><a href="/images/docker-install-errors.jpg" title="No Docker Love">No Docker, But I'm still loving this</a>.</figcaption>
</figure>
