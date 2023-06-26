---
title: Azure中的App如何访问数据库
date: 2023-06-26 20:07:31
tags:
categories:
  - Azure
---

Azure中你部署的任何东西都叫做资源，比如VM，container等。那么资源间如何互联互通呢？

<!--more-->

当然是通过网络，不过这个网络不是真的我们理解中的网络，而是虚拟网络（VNET），类似K8S中的网络一样。

{% img /images/azure-vnet.png %}

`需要记住的是，VNET间默认不互通，但VNET中的Subnet是默认互通的`

那么回到标题的问题，比如我部署了一个App和一个数据库，App如何访问到数据库呢？

有下面三种方式。

**第一种，数据库暴露在公网，App通过公网访问。** 安全起见，可以为App添加白名单。

{% img /images/App-Mysql-Public-Net.png %}

**第二种，App和数据库都添加到一个VNET中。** 

{% img /images/App-Mysql-VNet-Endpoint.png %}

**第三种，App和数据库都添加到一个VNET中，但是通过专用endpoint访问。** 

{% img /images/App-Mysql-VNet--Private-Endpoint.png %}