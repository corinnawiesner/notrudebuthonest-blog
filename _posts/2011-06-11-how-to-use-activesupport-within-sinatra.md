---
layout: post
title: "Sinatra: How to Include ActiveSupport"
authors:
  - robert
modified: 2014-08-15
excerpt: "Include ActiveSupport in a Gemfile."
tags: [ruby, sinatra]
---

{% highlight ruby linenos %}
# Gemfile
source 'https://rubygems.org'

gem 'sinatra', '1.4.5'
gem 'activesupport', '4.1.4'
{% endhighlight %}

{% highlight ruby linenos %}
# app.rb
require 'active_support/all'
require 'sinatra'

Time::DATE_FORMATS[:my_datetime] = "%Y-%m-%d Hour: %H Minute: %M Second: %S"

get '/' do
  Time.now.to_s(:my_datetime)
end
{% endhighlight %}

[https://gist.github.com/gogolok/5877734](https://gist.github.com/gogolok/5877734){:target="_blank"}
