---
layout: post
title: "Deploy static HTML page on Cloud Foundry"
authors:
  - robert
excerpt: ""
tags: [anynines, cloudfoundry]
---

**Setup static HTML page**

Let’s build a simple html page with some dummy content.
Paste the following content into an index.html file.

{% highlight html linenos %}
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>My page</title>
  </head>
  <body>
    <h1>Hello, world!</h1>
  </body>
</html>
{% endhighlight %}

**Register with Cloud Foundry (e.g Anynines)**

Register with a Cloud Foundry provider of your choice, e.g. [anynines.com](http://anynines.com/){:target="_blank"}.

[Download and install](https://anynines.zendesk.com/entries/60241846-How-to-install-the-CLI-v6){:target="_blank"} the Command Line Interface to interact with Cloud Foundry.

Afterwards you need to target your Cloud Foundry provider, e.g. anynines. Login using your credentials by typing

{% highlight sh linenos %}
cf api https://api.de.a9s.eu
cf login
{% endhighlight %}

We are now ready to deploy apps to Cloud Foundry.

**Deployment on Cloud Foundry**

Within the same directory as the index.html file, run the following commands.

{% highlight sh linenos %}
touch Staticfile
cf push my-cool-page -m 64M -b https://github.com/cloudfoundry-incubator/staticfile-buildpack.git
{% endhighlight %}

The site is now publicly available.
We can view our site at [http://my-cool-page.de.a9sapp.eu](http://my-cool-page.de.a9sapp.eu/){:target="_blank"}.
