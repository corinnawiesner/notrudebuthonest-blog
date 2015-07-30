---
layout: post
title: "Kanbanery overview with banery_stats"
authors:
  - robert
modified:
excerpt: ""
tags: [gem, ruby]
---

I’ve created a very simple gem called [banery_stats](https://github.com/gogolok/banery_stats){:target="_blank"} to view my #tasks for every project for my kanbanery account.

It’s very simple to use. First you have to manually get your kanbanery api token. Afterwards it’s as simple as:

{% highlight sh linenos %}
$ export KANBANERY_API_TOKEN=my_token
$ banery_stats
WORKSPACE name0 #projects: 2
0 project1
3 project2
WORKSPACE name1 #projects: 3
3 project3
12 project4
{% endhighlight %}
