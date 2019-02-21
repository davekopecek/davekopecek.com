---
layout: post
title: Google Analytics for One Page Sites
modified:
categories:
excerpt: This is an exerpt. Where does it go? What does it do?
tags: [Analytics]
comments: true
image:
  feature:
date: 2017-05-13T14:58:47-04:00
---
I just had a case where a client needed to quickly pivot their overall strategy and immediately rebrand. The old site needed to go away *"right now"*. Although there was a steady stream traffic coming to the URL there was very little consensus about what that traffic *actually wanted*.  The decision was made to quicky create a very stripped down, extremely simple single page site with a few basic options.  We'd quickly get feedback and use that info to test our hunches.

But how, exactly do you do this with Google Analytics? Adding Google Analytics for your site is [easy enough](https://support.google.com/analytics/answer/1008080?hl=en). Most CMS's have modules or plugins that allow you to just paste your `Tracking Id` in and you're good to go. Failing that, paste the Univeral Analytics Tracking code on every page you want to track and you'll be analyzing pageviews and the like in no time. What if your website is a single page scrolling wonder and all the links are simply sending users up ad down the page? Since the site is a single page you'll get really limited insights as to what users are doing and

# Enter the Google Tag Manager

Head on over to [https://www.google.com/analytics/tag-manager](https://www.google.com/analytics/tag-manager) and take a gander. You'll quickly find out that the Google Tag Manager puts *Tags at your service* and that:

>> Marketers want tag management that’s simple, reliable, and integrates easily with existing systems. That’s what Google Tag Manager delivers. You’ll launch programs faster, so you can make swifter decisions.

and

>> “In the fast-paced world of digital analytics and sophisticated marketing programs, Google Tag Manager is a serious game-changer that provides the kind of competitive edge our clients need.”

Wow! That was helpful. In my experience it sounds *exactly* like something a Marketer would want.  Marketinese aside, turns out it's something can actually be useful for what we're trying to do here. Among other things, Tag Manager allows us to create  `Tags` that trigger custom events when users interact in specific ways with the page. These custom events are logged like other website stats and show up in Google Analytics under Behavior -> Events.

# Results First - Cut to the Chase & Show the Money

Given a one page site, an ID attribute was set for each anchor tag:

````
<a id="lnk-btn-find-out-more" href="#about" class="btn btn-dark btn-lg">Find Out More</a>
````

The page had bootstrap buttons and a "hamburger menu". All the button ids started with `lnk-` and all the menu ids start with `menu-`. This isn't crucial, but it makes identifying the links easier later.

With the tag setup we got results like this in Google Analytics -> Behavior -> Events -> Overview -> Labels:

IMAGE HERE

# The Details




