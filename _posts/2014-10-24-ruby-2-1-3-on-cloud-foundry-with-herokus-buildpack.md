---
layout: post
title: "Ruby 2.1.3 and newer on Cloud Foundry with Heroku’s Buildpack"
authors:
  - robert
modified: 2014-12-26
excerpt: "Learn how to deploy Ruby 2.x apps on Anynines."
tags: [anynines, cloudfoundry, deployment, ruby]
---

If you’re using the [Heroku Buildpack](https://github.com/heroku/heroku-buildpack-ruby){:target="_blank"}on Cloud Foundry (or [Anynines](http://www.anynines.com/){:target="_blank"} or …) and want to use a stable Ruby version >= 2.1.3, cf push will fail downloading ruby version >= 2.1.3 during staging.

You have to use the **STACK environment variable** for ruby version >= 2.1.3 and specify the value **cedar** for example.

Modify the Gemfile:

{% highlight ruby linenos %}
source 'https://rubygems.org'

ruby '2.2.0'
...
{% endhighlight %}

Set the STACK environment variable for your app:

{% highlight sh linenos %}
$ cf set-env APP STACK cedar
{% endhighlight %}

Push your app and enjoy ruby version >= 2.1.3:

{% highlight sh linenos %}
$ cf push APP -b https://github.com/heroku/heroku-buildpack-ruby
{% endhighlight %}

This change is required for ruby versions >= 2.1.3 because Heroku Buildpack added support for different stacks, see:
https://github.com/heroku/heroku-buildpack-ruby/blob/master/CHANGELOG.md#v121-6302014



**UPDATE 2014-12-26: ruby 2.2.0 mentioned**

**UPDATE 2014-12-09: ruby 2.1.5 mentioned**

**UPDATE 2014-10-30: ruby 2.1.4 mentioned**
