---
layout: post
title: "Whitelisting domains in gmail"
description: "Here's how to whitelist an entire domain, not just an individual address."
category: articles
tags: [plesk,qmail]
---

For the past year or so I've been managing all my various email addresses from gmail.  It's been working well until a week before Christmas when the gmail's spam filter decided that all of the voice mails forwarded from our office VOIP system were spam.  The system forwards me voicemails in the format

{% highlight bash %}
"john.doe 333-444-5555"@myvoicemailsystem.com
{% endhighlight %}

so I needed to whitelist the entire domain.

While gmail doesn't have a specific "whitelist" feature, turns out this is pretty easily accomplished with "filters".  Here's how:
<ol>
  <li>Log into gmail, click 'settings'</li>
  <li>Click 'Filters'</li>
  <li>Click 'Create a New Filter'</li>
  <li>In the "From" field enter the domain you want to whitelist, ie. 'somedomain.com'</li>
  <li>Click 'Next Step', then tick the 'Never send it to Spam' box.</li>
  <li>Click 'Create Filter' and your done.</li>
</ol>
That wasn't so bad. Anything sent from 'somedomain.com' now show up in your inbox rather than disappearing onto the great SPAM abyss.
