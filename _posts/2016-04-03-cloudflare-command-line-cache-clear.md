---
layout: post
title: CloudFlare Command Line Cache Clear
modified:
categories:
tags: [cloudflare]
date: 2016-04-03T13:00:33-04:00
---

Here' a quick and dirty way to refresh a site's [Cloudflare](https://www.cloudflare.com) CDN cache from the command line. For large or high volume sites you would probably want to purge individual files or purge by tag but for deploying a small blog it's just fine & can be added to the end of your deployment script. It doesn't get much simpler that this. A command line curl call to:

    DELETE https://api.cloudflare.com/client/v4/zones/:identifier/purge_cache

with a few added parameters gets you what you need. The API is even available on free accounts. No verifications or other shenanigans are required.

Cloudflare does a damn fine job with their API. Not only is it [fully documented](https://api.cloudflare.com/), but there are links on their "regular" web interface to the corresponding API calls.  It only took me two trips to clear the cache on the web interface before I saw the API link and had the, "Hey wait, I can do this from the command prompt" aha moment.

## You Need
* Your "Global API Key"
* Your domain's Cloudflare zone id

### Get Your "Global API Key"
The "Global API Key" is on your "My Settings" page toward the bottom of the "Account" tab. Click the dropdown next to your email address in the header to navigate to "My Settings".

### Get Your Domain's Cloudlare Zone Id

Replace your domain name, email address and global API key from above ( X-Auth-Key) below. Grap the zone id out of the returned JSON and save it for the next step.

    $ curl -X GET "https://api.cloudflare.com/client/v4/zones?name=example.com&status=active&page=1&per_page=20&order=status&direction=desc&match=all" \
    -H "X-Auth-Email: user@example.com" \
    -H "X-Auth-Key: c2547eb745079dac9320b638f5e225cf483cc5cfdda41" \
    -H "Content-Type: application/json"

Cloudflare documentation [here](https://www.cloudflare.com/docs/next/#zone-list-zones)

### Clear Your Cache.

Paste your newly found :identifier, email and key & you're set.

    curl -X DELETE "https://api.cloudflare.com/client/v4/zones/:identifier/purge_cache" \
    -H "Content-Type:application/json" \
    -H "X-Auth-Key:1234567893feefc5f0q5000bfo0c38d90bbeb" \
    -H "X-Auth-Email:example@example.com"
    --data '{"purge_everything":true}'

Cloudflare documentation [here](https://api.cloudflare.com/#zone-purge-all-files)

### Winner Winner

That's It! Add that puppy to the end of your deployment script. Go Crazy. Not too crazy -- you're supposed to treat your API key like a password, but you get the point.
