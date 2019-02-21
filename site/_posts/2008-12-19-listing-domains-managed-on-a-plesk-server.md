---
layout: post
title: "Listing Domains Managed on a Plesk Server"
description: "An 'Export' button would be nice, but this will work too."
category: articles
tags: [plesk]
---

I've learned the hard way that while directly altering Plesk's database is almost never a good idea, the Plesk database 'PSA' holds a ton of useful information that's not always readily exportable from the interface.  Here are a couple of useful queries.  The first simply exports a list of "standard hosted" domains.  The second includes client information.

You'll need to be logged in as root.

First, Get into MySQL and use the Plesk database, "psa":
{% highlight sql %}
mysql -u admin -p`cat /etc/psa/.psa.shadow`;
use psa;
{% endhighlight %}

<strong>Query 1:  List all the standard hosted domains, send the results to a csv file:</strong>
{% highlight sql %}
select name from domains where htype='vrt_hst' INTO OUTFILE '/tmp/domains.csv';
{% endhighlight %}


<strong>Query 2:  Building on that, lets add client information and sort it to make it pretty:</strong>
{% highlight bash %}
select cname,name from domains, clients where cl_id = clients.id and htype='vrt_hst' order by cname,name INTO OUTFILE '/tmp/domains-client.csv';
{% endhighlight %}

Nothing earth shattering here, but it might save you 5 minutes.
