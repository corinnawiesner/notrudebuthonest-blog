---
layout: post
title: "Today App Extension Experiments on iOS 8"
authors:
  - robert
excerpt: ""
tags: [ios]
---

<figure>
  <img src="/images/kid-age.png">
</figure>

I’ve played around with the [Today App Extensions](https://developer.apple.com/library/ios/documentation/General/Conceptual/ExtensibilityPG/NotificationCenter.html#//apple_ref/doc/uid/TP40014214-CH11-SW1){:target="_blank"} that has been introduced with iOS 8.

**Sample Code**

There’s a nice [blog post/tutorial](http://blog.xebia.com/2014/09/13/ios-today-widget-written-in-swift/){:target="_blank"} by Lammert Westerhoff creating a more advanced sample extension than the iOS template by Apple.

**Simulator**

Most of the time the simulator does not run the current code with Xcode 6.0.1. You have to manually reset the simulator and run the current extension again to see the newest results. Hope this gets fixed in the next release.

**App Bundle**

Unfortunately you have to create a real app next to the today extension. I can imagine that in most cases you want simple today extension settings dialogs where you can setup your extension and don’t want a big fat app to distribute.
