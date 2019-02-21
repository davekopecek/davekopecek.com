---
layout: post
title: "Ubercart Credit Card Settings on Plesk Hosted Site - Setting up /keys"
description: "You'll need to tweak your vhost files to get /keys working."
category: articles
tags: [plesk,drupal,ubercart]
---
<a title="Ubercart - One cart to rule them all!" href="http://ubercart.org" target="_blank">Ubercart</a> is a a popular shopping cart plug-in for the popular <a title="Drupal.org" href="http://drupal.org" target="_blank">Drupal</a> Content Management system. <a title="Parallels Plesk" href="http://www.parallels.com/spp/parallelsplesk/" target="_blank">Parallel's Plesk</a> is a popular hosting control panel.

When configuring a Drupal-Ubercart install on a Plesk based host <a title="Ubercart Credit Card Setup Documentation Page" href="http://www.ubercart.org/docs/user/2731/credit_card_settings" target="_blank">Ubercart requires</a> the creation of a /keys directory that is outside of your document root (aka /httpdocs in Plesk )  To create a keys directory that does not generate open_basedir errors you'll need to do the following

Log in as root and create or edit conf/vhost.conf and conf/vhost_ssl.conf as shown.

###conf/vhost.conf:

{% highlight html %}
{% raw %}
<Directory /var/www/vhosts/YOUR-DOMAIN.COM/httpdocs>
php_admin_value open_basedir "/var/www/vhosts/YOUR-DOMAIN.COM/httpdocs:/tmp:/var/www/vhosts/YOUR-DOMAIN.COM/keys"
</Directory>
{% endraw %}
{% endhighlight %}

###conf/vhost_ssl.conf:

{% highlight html %}
{% raw %}
<Directory /var/www/vhosts/YOUR-DOMAIN.COM/httpdocs/>
php_admin_value open_basedir "/var/www/vhosts/YOUR-DOMAIN.COM/httpdocs:/tmp:/var/www/vhosts/YOUR-DOMAIN-HERE.COM/keys"<
</Directory>
{% endraw %}
{% endhighlight %}

Note that Php_admin_value and all that follows should be on one line.

Then run (on CentOS - Ubuntu/Debian may be slightly different):

{% highlight bash %}
{% raw %}
/usr/local/psa/admin/sbin/websrvmng -u --vhost-name=<domainname>
/etc/init.d/apache2 restart
{% endraw %}
{% endhighlight %}

After the restart Plesk will include the contents of your file in the apache config file. You can verify that it's being included by checking httpd.include you should see a line similiar to:

{% highlight bash %}
Include /var/www/vhosts/mydomain.com/conf/vhost.conf
{% endhighlight %}

Feeling adventurous and want to add other apache directives in the .conf file ?   Great, but HEED MY WARNING.  If you mess up the syntax in either of the files apache may fail to restart -- That would be why you needed to log in as root.   Delete-Remove-Rename the .conf files, rerun websrvmng and start apache.  No big deal if you're on a development box, but, as always you would be wise to follow the 2-Beer rule when logging into production boxes as root.

<strong>Resources:</strong>

Ubercart Keys Documentation Page:
<a href="http://www.ubercart.org/docs/user/2731/credit_card_settings">http://www.ubercart.org/docs/user/2731/credit_card_settings</a>

Plesk forum and Knowledgebase posts:
<a href="http://forum.parallels.com/showthread.php?t=84211&amp;highlight=vhost.conf+websrvmng">http://forum.parallels.com/showthread.php?t=84211&amp;highlight=vhost.conf+websrvmng</a>
<a href="http://kb.parallels.com/en/5464">http://kb.parallels.com/en/5464</a>
<a href="http://kb.parallels.com/en/432">http://kb.parallels.com/en/432</a>

You may want to check out Power Toys for Plesk from grafxsoftware.com <a href="http://www.grafxsoftware.com/product.php?id=172">http://www.grafxsoftware.com/product.php?id=172</a> which includes a vhost conf editing tool.

Of course you can avoid all this by having Aisle8, Inc. host your Drupal, Ubercart or <a title="Open Atrium" href="http://openatrium.com" target="_blank">OpenAtrium</a> site.  We can host it on a Plesk based server, or one of our trusty <a href="http://groups.drupal.org/aegir-hosting-system" target="_blank">Aegir</a> based boxes.  Aegir eases the hosting and upgrading Drupal sites ---   Ain't nothing else like it around.
