---
layout: post
title: "Where My WordPress At?"
description: "Finding WordPress installs on a Linux Server"
category: articles
tags: [Wordpress, Plesk]
comments: true
share: true
---
Wordpress installs multiply like bunnies.  If you've got several WordPress domains hosted on a single server it's easy to loose track of installed versions.  This one-line wonder will sniff out WordPress powered sites and grab their version number.  Drop it in a CRON that runs once a month and you'll get regular reminders of what's lurking out on your server.

WordPress installs contain the file version.php with the variable $wp_version. Find all the version.php files, grab the variable and you're golden. Here's the basic <strong>locate</strong> command:

{% highlight bash %}
locate /wp-includes/version.php | xargs grep '$wp_version ='
{% endhighlight %}

That's nice enough, but we can get a bit better. The server I'm targeting stores all virtual hosts in the directory <strong>/var/www/vhosts</strong>. We can use the cut command to snip that from the display, sort the output by domain name and email the results.

{% highlight bash %}
locate /wp-includes/version.php | xargs grep '$wp_version =' | cut -d'/' -f5,6,7,8,10  | sort | mail -s "WordPress Installs on Server XYZ" your-email@yourdomain.com
{% endhighlight %}

You'll get an email with results like this:

{% highlight bash %}
foobar.com/version.php:$wp_version = '3.0.1';
whatsit.com/version.php:$wp_version = '2.7.1';
whizzbang.com/version.php:$wp_version = '2.9.1';
widget.net/wp-includes/version.php:$wp_version = '2.9.1';
{% endhighlight %}

For extra credit you could sort by version number, but there's no need to be an overachiever here.  Quit while you're ahead. The script uses <em><strong>locate</strong></em>, so make sure you run <em><strong>updatedb</strong></em> periodically.
