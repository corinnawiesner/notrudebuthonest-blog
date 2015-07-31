---
layout: post
title: "Local PostgreSQL Setup"
authors:
  - robert
excerpt: "How to setup PostgreSQL on Mac OS X."
tags: [postgresql]
comments: true
---

**Shell configuration (~/.bashrc, ~/.zshrc, …)**

{% highlight ruby linenos %}
export PGDATA=~/anywhere/postgresql_data # PostgreSQL data directory
export PGHOST="/tmp"
alias pgstart="pg_ctl start"
alias pgstop="pg_ctl stop"
{% endhighlight %}

**Initial setup**

{% highlight ruby linenos %}
$ initdb -A md5 -E UTF8 -U $USER -W

$ vim $PGDATA/postgresql.conf

listen_addresses = 'localhost'

$ vim $PGDATA/pg_hba.conf

# TYPE DATABASE USER ADDRESS METHOD
# ADD THE FOLLOWING LINE AND REPLACE 'YOUR_USER' by $USER
local all YOUR_USER trust
{% endhighlight %}

**Start/Stop PostgreSQL**

{% highlight ruby linenos %}
$ pgstop
$ pgstart
{% endhighlight %}

**Important commands**

{% highlight ruby linenos %}
$ createdb database_name # create new database
$ dropdb database_name # drop database
$ psql -p # list all available databases
$ psql database_name # connect to database
{% endhighlight %}

**psql console**

{% highlight ruby linenos %}
\? # help
\d # list tables (and other things)
\d table_name # show table schema
{% endhighlight %}
