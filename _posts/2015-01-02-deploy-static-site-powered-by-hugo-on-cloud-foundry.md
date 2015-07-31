---
layout: post
title: "Deploy static site powered by Hugo on Cloud Foundry"
authors:
  - robert
excerpt: "Step by step introduction to Hugo on Cloud Foundry."
tags: [cloudfoundry, golang, hugo]
comments: true
---

<figure>
  <img src="/images/hugo-plus-cloud-foundry.png">
</figure>

Hugo is a static site generator. You can find some showcases at [http://gohugo.io/showcase/](http://gohugo.io/showcase/){:target="_blank"}.

**TL;DR**

If you know how Hugo and Cloud Foundry work, here’s the short version, otherwise read on.

{% highlight sh linenos %}
touch public/Staticfile
cf push hugo-site -m 64M -p public -b https://github.com/cloudfoundry-incubator/staticfile-buildpack.git
{% endhighlight %}

**Installing Hugo (Mac OS X)**

{% highlight sh linenos %}
brew install hugo
{% endhighlight %}

More complete instructions are available at [http://gohugo.io/overview/installing/](http://gohugo.io/overview/installing/){:target="_blank"}

**Setup demo site**

Let’s build a simple demo site with some dummy content.

{% highlight sh linenos %}
hugo new site my_site
cd my_site
hugo new post/first.md
{% endhighlight %}

Edit the file content/post/first.md and add some content in this file below the +++ in the Markdown format, e.g.:

{% highlight text linenos %}
+++
date = "2014-12-30T04:32:57+01:00"
draft = true
title = "first"

+++
First content
{% endhighlight %}

Add some themes to choose from.

{% highlight sh linenos %}
git clone --recursive https://github.com/spf13/hugoThemes themes
{% endhighlight %}

Before generating the static site files, we need to set the base url of the site in the config.toml file.

{% highlight toml linenos %}
baseurl = "http://hugo-site.de.a9sapp.eu"
languageCode = "en-us"
title = "my new hugo site"
{% endhighlight %}

I’ll deploy the site to [http://hugo-site.de.a9sapp.eu](http://hugo-site.de.a9sapp.eu/){:target="_blank"}.

Generate the static files to be uploaded to a server.

{% highlight sh linenos %}
hugo --theme=hyde --buildDrafts
{% endhighlight %}

Hugo will output the static site to the public/ folder by default.
We’re done for the moment with our site.
Let’s upload it to Cloud Foundry to be publicly available.

**Register with Cloud Foundry (e.g Anynines)**

Register with a Cloud Foundry provider of your choice, e.g. [anynines.com](http://anynines.com/){:target="_blank"}.

[Download and install](https://anynines.zendesk.com/entries/60241846-How-to-install-the-CLI-v6){:target="_blank"} the Command Line Interface to interact with Cloud Foundry.

Afterwards you need to target your Cloud Foundry provider, e.g. anynines. Login using your credentials by typing

{% highlight sh linenos %}
cf api https://api.de.a9s.eu
cf login
{% endhighlight %}

We are now ready to deploy apps to Cloud Foundry.

**Deploy demo site on Cloud Foundry**

To get the site online we need to upload the public/ directory to Cloud Foundry and serve those static files.
The staticfile-buildback from the Cloud Foundry community serves static assets by [Nginx](http://nginx.org/){:target="_blank"} and requires only around 20MB.

Before pushing our site to Cloud Foundry we need to place a file named Staticfile in the public/ directory.
This will ensure that the staticfile-buildpack will be used.

{% highlight sh linenos %}
touch public/Staticfile
{% endhighlight %}

The last step is to deploy the public/ directory to Cloud Foundry.

{% highlight sh linenos %}
cf push hugo-site -m 64M -p public -b https://github.com/cloudfoundry-incubator/staticfile-buildpack.git
{% endhighlight %}

That’s it. The site is now publicly available. In this example we can view our site at [http://hugo-site.de.a9sapp.eu](http://hugo-site.de.a9sapp.eu/){:target="_blank"}.

<figure>
  <img src="/images/hugo-demo-page.png">
</figure>
