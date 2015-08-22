---
layout: post
title: "Connect to Swift Service instance with Cyberduck"
authors:
  - robert
excerpt: "It might be handy to browse the anynines Swift storage with a GUI client."
tags: [anynines, cloudfoundry]
comments: true
---

When using the anynines Swift service with an application, it might be handy to browse the anynines Swift storage with a GUI client.
The program [Cyberduck](https://cyberduck.io/) is such a great GUI client that can be used as OpenStack Swift browser to transfer files to/from your anynines Swift service.

## Get credentials

At first, you must collect the Swift Credentials bound to your app.
The credentials get exposed through environment variables to your app.
You can list the app's environment variables  using the cf command:

{% highlight bash %}
cf env APP_NAME
{% endhighlight %}

The output will contain the Swift credentials if an anynines Swift service is bound to the application.
Here's a sample output:


{% highlight json%}
...
"swift-1.0": [
 {
 "credentials": {
 "account_meta_key": "vq782FA4qhLfMX1pB1iO",
 "authentication_uri": "https://auth.hydranodes.de:5000/v2.0/",
 "authentication_version": "v2",
 "availability_zone": "hydranodes",
 "name": "29554ded-dbbb-12f1-9fae-6039bf806569",
 "password": "XTHn1tsRl1l1zPkjt8zt",
 "self_signed_ssl": false,
 "service_type": null,
 "tenant_id": "2b9fa3cbda2144549211ff8035710608",
 "tenant_name": "29a44ded-dbbb-45f1-9fae-6039bf806569.swift.tenant@a9s.eu",
 "user_id": "3f3905f40e44435f8f0931dd486189af",
 "user_name": "87adcfe1-bb2d-4449-34f4-4675fb8b10c7.swift.user@a9s.eu"
 },
...
{% endhighlight %}

You will need the attribute values **tenant_id**, **user_name** and **password** for the configuration of Cyberduck.

## Connect with Cyberduck


Start *Cyberduck*, open a new connection and select the **Swift (OpenStack Object Storage)** profile.
Next fill **auth.hydranodes.de** as the **Server**, **5000** as the server **Port**.

**Username** is made up of **tenant_id** and **user_name**, separated by a colon.
Fill in the **password** above.

Finally you can connect to the anynines Swift service and browse your data.
