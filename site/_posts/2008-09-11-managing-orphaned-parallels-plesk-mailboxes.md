---
layout: post
title: "Managing Orphaned Parallels Plesk Mailboxes"
description: "Mismanaged mail forwards can errode disk space. Here's how to reclaim it."
category: articles
tags: [plesk,qmail]
---
Over the past few months I began to notice a steady erosion in available disk space on a server running the Parallels' <a href="http://www.parallels.com/plesk/">Plesk</a> control panel.  After some sleuthing I tracked it down to the management of mailboxes in combination with the "Mail Forward" and "Mail Group" functions on domains the "Mailbox quota" set to unlimited.

There are two basic issues:
<ol>
  <li>Users setup 'redirects' or 'mail group' functions and leave the account mailbox enabled, then never check the mailbox and delete the messages.  (e.g. sales@somedomain.com forwards to bill@somedomain.com and jim@gmail.com, but nobody logs on to sales@ and deletes the message)</li>
  <li><strong><em>Disabling</em></strong> the mailbox does not <strong><em>delete</em></strong> the existing files in the mailbox.  All those mail files will just hang around forever, orphaned from the control panel.</li>
</ol>

Slogging around in the qmail directories looking for files is no fun.  Here's how I rid myself of these pesky disk-eaters.  I took a two pronged approach:
<ul>
  <li>Query the Plesk database to identify mail accounts with mailboxes that redirect.</li>
  <li>Query the filesystem to find Mailbox directories that are large.</li>
</ul>

###Query the Plesk Database

You'll need shell access to your server.  Login to your server, pop into mysql and use the Plesk database (PSA) using the following command:

{% highlight bash %}
    mysql -u admin -p`cat /etc/psa/.psa.shadow`;
    use psa;
{% endhighlight %}

Use the following query to select mailboxes that redirect:

{% highlight sql %}
    select name,mail_name,redir_addr from mail, domains
    where mail.dom_id = domains.id and postbox = 'true' and redirect = 'true';
{% endhighlight %}

Now you've got some ammunition.  Exit out of mysql.

###Finding Big Mailboxes

A 'mailbox' in qmail is simply a directory.  Each undelivered message is a file in that directory.  On my  installation of Plesk qmail  is installed in '/var/qmail/'   The mailbox for 'jimbo@somedomain.com' takes the form: '/var/qmail/somedomain.com/jimbo/Maildir/new'.

The command below uses 'du' to grab the size of all the directories in mailnames, grep filters out all but the 'Maildir/new' directory leaving us with a list of all our mailboxes and their size.  Running them through sort in the manner shown orders them biggest to smallest.  Just the way we want 'em.

Log in as root and run the following:

{% highlight bash %}
du  /var/qmail/mailnames | grep 'Maildir/new' | sort -rnk1 > mboxsize.txt
{% endhighlight %}

Sample Output:
{% highlight bash %}
1047680 /var/qmail/mailnames/somedomain.com/karyon/Maildir/new
123820  /var/qmail/mailnames/somedomain.com/vickih/Maildir/new
94156   /var/qmail/mailnames/somedomain.com/info/Maildir/new
88368   /var/qmail/mailnames/somedomain.com/kathyh/Maildir/new
{% endhighlight %}

###Delete those Suckers

Armed with all the mailboxes that forward and a list of the big offenders you wouldn't think this would need much explanation, but after several weeks or months of collecting files you may find you have to many files in the directory to delete with a simple

{% highlight bash %}
 rm * -f
{% endhighlight %}

Apparently there are limits to the number of files you can delete at one time with a wildcard. If you run into difficulties with rm give this a shot:

CD to the directory and run
{% highlight bash %}
ls -al
{% endhighlight %}

Note that the name of your server is a string common to all files, replace MYSERVER below with the common string:

{% highlight bash %}
find . -name '*MYSERVER*' | xargs rm
{% endhighlight %}

In your gusto to clean things out remember that there are legitimate reasons to keep a mailbox turned on for forwarded accounts, (The boss may want to be able to review mail sent to sales@ to make sure that leads are being followed up on, etc.) and some users may just get incredible amounts of mail.  With that in mind this should help you keep a lid on things.  Once you've got things cleaned out you may be able to use quotas to help the problem from repeating.
