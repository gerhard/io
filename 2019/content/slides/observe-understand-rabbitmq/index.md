---
title: Observe and Understand RabbitMQ
summary: What happened when RabbitMQ became more observable? How does it work?
authors: []
tags: []
categories: []
date: "2019-11-04T11:50:00Z"
slides:
  # see available slides. options in layouts/slides/baseof.html
  height: 768
  theme: solarized
  width: 1024
  style: |
    .reveal a {
      color: #3274D9;
    }
    .reveal a:hover {
      color: #5296FF;
    }
    .reveal .hiviz-dark a {
      color: #F2CC0C;
    }
    .reveal .hiviz-dark a:hover {
      color: #FFE14A;
    }
  # https://github.com/hakimel/reveal.js/
  # https://developer.mozilla.org/en-US/docs/Web/CSS/background
---

{{< slide class="hiviz-dark" background-video="/img/observable-systems/observe-understand-rabbitmq-intro-43.mp4" background-video-loop="true" background-size="cover" >}}

## Observe && <br> [Understand](#) <br> RabbitMQ
<span class="menu-title">INTRO</span>

{{< speaker_note >}}
* See RabbitMQ in a completely different light
* The goal is to understand RabbitMQ
* Have different discussions
* Improve RabbitMQ and Erlang together
* Relate to CNCF projects
{{< /speaker_note >}}

---

### RabbitMQ Core Engineer
<span class="menu-title">Gerhard Lazu</span>

<img src="/img/observable-systems/gerhard.png" height="400">

#### <i class="fab fa-twitter"></i> <a href="https://twitter.com/gerhardlazu" target="_blank">gerhardlazu</a> &nbsp; <i class="fab fa-github"></i> <a href="https://github.com/gerhard" target="_blank">gerhard</a>

---

### RabbitMQ for K8S PM
<span class="menu-title">Michal Kuratczyk</span>

<img src="/img/observable-systems/mkuratczyk.jpeg" height="400">

#### <i class="fab fa-twitter"></i> <a href="https://twitter.com/MichalKuratczyk" target="_blank">MichalKuratczyk</a> &nbsp; <i class="fab fa-github"></i> <a href="https://github.com/mkuratczyk" target="_blank">mkuratczyk</a>

---

{{< slide background-video="/img/observable-systems/rabbitmq-management-unresponsive-43.mp4" background-video-loop="true" background-size="cover" >}}

{{< speaker_note >}}

* Let's start with the good old Management UI. It serves the purpose until...
* until you actually need it
* in a failing or very busy cluster, Management UI is usually one of the first things to fail
* so you can't access Management UI exactly when you need it most
* Also, if you restart a node, you no longer have the metrics history. If you restart all nodes to resolve an issue, you probably can't do post-mortem anymore

{{< /speaker_note >}}

---

{{< slide background-image="/img/observable-systems/exporter-vs-plugin.png" background-size="cover" >}}

{{< speaker_note >}}

* What's worse, it doesn't matter that you have external tools to monitor RabbitMQ
* they all rely on the API provided by the Management plugin to collect metrics
* so if you can't use the Management UI you probably don't get new metrics in your external system either
* Here you can see how long it takes to collect metrics using the popular rabbitmq-exporter for Prometheus which relies on the Management API
* just to be clear - the problem here is not the exporter but the Management plugin
* the average here is almost half a minute and often it takes almost a minute to collect metrics
* that means we can't collect them more than once a minute
* RabbitMQ 3.8 includes a completely new prometheus plugin that does not rely on Management API
* you can see how much faster it is - it takes a fraction of a second on average
* which means we can collect metrics every 10 or 15 seconds which is much more useful
* By the way, if you look carefully, you can see that even the new plugin is a bit slow on one of the nodes - we'll see why in a moment

{{< /speaker_note >}}

---

{{< slide background-image="/img/observable-systems/rabbitmq-overview-1.png" background-size="cover" >}}

{{< speaker_note >}}

* So now that we have a new source for the metrics, we also needed a new tool to visualize them
* Grafana is the de facto standard for visualizing metrics so we use it in combination with Prometheus
* Here you can see a new RabbitMQ Overview dashboard which shows the same data you could find in the Management UI and then some
* it works when you need it
* we added sensible default thresholds
* that you can obviously adjust
* and because it's Grafana - you can customize everything you want, you can create your own dashboards and contribute back

{{< /speaker_note >}}

---

{{< slide background-image="/img/observable-systems/rabbitmq-overview-info.png" background-size="cover" >}}

{{< speaker_note >}}

* Moreover, these new dashboards not only show you the raw data but also provide additional explanation and links to the relevant parts of the documentation

{{< /speaker_note >}}

---

{{< slide background-image="/img/observable-systems/rebalance-queues-before.png" background-size="cover" >}}

{{< speaker_note >}}

* Because all those metrics are collected from each node individually, we can easily spot imbalances
* For example, here we can see all queue masters are on a single node.
* This is a very common issue since, by default, the node you are connected to becomes the master for newly declared queues

{{< /speaker_note >}}

---
`rabbitmq-queues rebalance all`

{{< speaker_note >}}

* Well, we now have an easy way to resolve this particular issue.
* We can run `rabbitmq-queues rebalance all` on any node to reshuffle queue masters

{{< /speaker_note >}}

---

{{< slide background-image="/img/observable-systems/rebalance-queues-after.png" background-size="cover" >}}

{{< speaker_note >}}

* Try to spot the moment we ran this command.
* It's not perfectly balanced but this is because we only have 10 queues

{{< /speaker_note >}}

---

{{< slide background-video="/img/observable-systems/erlang-distribution.mp4" background-video-loop="false" background-size="cover" >}}

{{< speaker_note >}}

* Ok, now we are entering a completely new territory
* Here you can see a different dashboard - this one is focues on Erlang distribution
* As you know RabbitMQ relies on Erlang for clustering
* Which means you need to monitor Erlang to get the full picture of what's going on
* You can see if the links between nodes are up
* How much data is transmitted between each set of nodes
* And much, much more. 
* Hopefully you won't need all that data too often but it's invaluable when you actually do

{{< /speaker_note >}}

---

{{< slide background-image="/img/observable-systems/data-in-port-driver-buffer.png" background-size="cover" >}}

{{< speaker_note >}}

* Remember our old friend Management plugin? Since the API has to collect metrics from all nodes
* It actually relies on the same Erlang infrastructure to request and receive metrics that RabbitMQ uses for queue mirroring and other things
* Here we zoom in on the data in port driver buffer
* Which likely doesn't tell you anything but you can see there are is a 100 meg of data to be transferred
* This means that if, for example, the Management plugin requests metrics from another node
* it won't get an answer until all that data that was already in the buffer is transferred
* This is another case where the Management plugin fails to deliver the insights you need, exactly when you need them

{{< /speaker_note >}}

---

{{< slide background-video="/img/observable-systems/rabbitmq-qq-raft-43-part-4.mp4" background-size="cover" >}}
<span class="menu-title">Take dashboard snapshot</span>

---

<span class="menu-title">MK take-aways</span>

* RabbitMQ 3.8 provides a lot of new tools to help you understand what is going on
* This is useful for the whole community
* With this we can improve RabbitMQ and Erlang
* And solve your problems
* It's really easy to get started so please do and share that data whenever you ask people to help you

{{< speaker_note >}}

* Gerhard will now show you even more awesomeness

{{< /speaker_note >}}

---

{{< slide class="hiviz-dark" background-color="#161719">}}

<span class="menu-title">HOW TO UNDERSTAND</span>

RabbitMQ Management limitations

New metrics system in RabbitMQ 3.8

## [Understand like never before](#)

**More CLI power to you**

**What happens next?**

{{< speaker_note >}}
Now that you are starting to understand how all this fits together,
let's dig deeper so that you can better appreciate the opportunities that this opens.
{{< /speaker_note >}}

---

## What happens in a <br>[RabbitMQ cluster](#)?
<span class="menu-title">RabbitMQ Cluster - 3 nodes</span>

Mirrored Classic Queue <br>vs Quorum Queue

---

## [Mirrored Classic Queue](#)
<br>

* Master `+2` Mirrors
* 100 msg/s @ 10KiB
* 1 Publisher [→](#) 1 Consumer
* ~1MiB / s message ingress
* ~1MiB / s message egress

---

{{< slide background-image="/img/observable-systems/erlang-distribution-mirrored-queue-rabbitmq-management.png" background-size="cover" >}}
<span class="menu-title">CQ - RabbitMQ Management</span>

---

{{< slide background-video="/img/observable-systems/erlang-distribution-mirrored-queue-part-1.mp4" background-size="cover" >}}
<span class="menu-title">CQ - Erlang Distribution</span>

---

{{< slide background-video="/img/observable-systems/erlang-distribution-mirrored-queue-part-2.mp4" background-size="cover" >}}
<span class="menu-title">CQ - Inter-node traffic</span>

---

## [1MB](#) worth of msg bodies

[**Mirrored Classic Queue**](#): Master `+2` Slaves

| Erlang Distribution Link | Traffic  |
| ---                      | ---      |
| Master 0 → Mirror 1      | [2MB](#) |
| Mirror 1 → Mirror 2      | [1MB](#) |
| Mirror 2 → Master 0      | [1MB](#) |
| Master 0 → Mirror 2      | [1MB](#) |

---

## Why does <br>[Erlang Distribution traffic](#) <br>matter?
<span class="menu-title">Erlang Distribution traffic</span>

---

{{< slide background="url(/img/observable-systems/erlang-distribution-link-limit-10KB-43.png) 50% 50% / cover no-repeat" >}}
<span class="menu-title">Link limit @ 10KB</span>

---

{{< slide background="url(/img/observable-systems/erlang-otp-pr-2293-43.png) 50% 50% / cover no-repeat" >}}
<span class="menu-title">Erlang/OTP PR 2293</span>

---

{{< slide class="hiviz-dark" background-video="/img/observable-systems/erlang-distribution-43.mp4" background-video-loop="true" background-size="cover" >}}
<span class="menu-title">One graph from one dashboard</span>

{{< speaker_note >}}
One graph from one dashboard:

* Makes limitations easy to spot
* Confirms one benefit of Raft replication
* Helps Erlang/OTP improve
{{< /speaker_note >}}

---

## [Quorum Queue](#)
<br>

* Leader `+2` Followers
* 100 msg/s @ 10KiB
* 1 Publisher [→](#) 1 Consumer
* ~1MiB / s message ingress
* ~1MiB / s message egress

---

{{< slide background-image="/img/observable-systems/erlang-distribution-quorum-queue.png" background-size="cover" >}}
<span class="menu-title">QQ - Inter-node traffic</span>

---

## [Quorum Queue](#) 2.5x [less pressure](#)
on Erlang Distribution than Mirrored Classic Queue
<span class="menu-title">QQ 2.5x less pressure</span>

| MCQ Link | MCQ Traffic | QQ Link | QQ Traffic |
| ---      | ---         | ---     | ---        |
| M0  → M1 | 2MB         | L0 → F1 | 1MB        |
| M1 → M2  | 1MB         | L0 → F2 | 1MB        |
| M2 → M0  | 1MB         |         |            |
| M0  → M2 | 1MB         |         |            |

---

## Help me understand <br>[Quorum Queue](#) internals
<span class="menu-title">RabbitMQ-Quorum-Queues-Raft</span>

**RabbitMQ-Quorum-Queues-Raft**

---

{{< slide background-video="/img/observable-systems/rabbitmq-qq-raft-43-part-1.mp4" background-size="cover" >}}
<span class="menu-title">Log entries committed / s</span>

---

{{< slide background-video="/img/observable-systems/rabbitmq-qq-raft-43-part-2.mp4" background-size="cover" >}}
<span class="menu-title">Log entry commit latency</span>

---

{{< slide background-video="/img/observable-systems/rabbitmq-qq-raft-43-part-3.mp4" background-size="cover" >}}
<span class="menu-title">Raft members with >5k</span>

---

## Hey Rabbit! <br>[Where is my memory?](#)
<span class="menu-title">Where is my memory?</span>

**Erlang-Memory-Allocators**

Quorum Queues with no message backlog

---

{{< slide background-video="/img/observable-systems/erlang-memory-allocators-43-part-1.mp4" background-size="cover" >}}
<span class="menu-title">Erlang-Memory-Allocators</span>

---

{{< slide background-video="/img/observable-systems/erlang-memory-allocators-43-part-2.mp4" background-size="cover" >}}
<span class="menu-title">binary_alloc</span>

---

{{< slide background-video="/img/observable-systems/erlang-memory-allocators-43-part-3.mp4" background-size="cover" >}}
<span class="menu-title">eheap_alloc</span>

---

{{< slide background-video="/img/observable-systems/erlang-memory-allocators-43-part-4.mp4" background-size="cover" >}}
<span class="menu-title">ets_alloc</span>

---

{{< slide background-video="/img/observable-systems/erlang-memory-allocators-43-part-5.mp4" background-size="cover" >}}
<span class="menu-title">Collapsed</span>

---

## Discover more dashboards
https://grafana.com/orgs/rabbitmq

---

{{< slide class="hiviz-dark" background-color="#161719">}}

<span class="menu-title">CLI POWER TO YOU</span>

RabbitMQ Management limitations

New metrics system in RabbitMQ 3.8

Understand like never before

## [More CLI power to you](#)

**What happens next?**

---

`htop`

{{< speaker_note >}}
Who where spends most of their time in the Terminal?
{{< /speaker_note >}}

---

`rabbitmq-diagnostics observer`

---

`rabbitmq-diagnostics consume_event_stream`

---

`rabbitmq-diagnostics log_tail_stream`

---

{{< slide class="hiviz-dark" background-color="#161719">}}

<span class="menu-title">WHAT HAPPENS NEXT?</span>

RabbitMQ Management limitations

New metrics system in RabbitMQ 3.8

Understand like never before

More CLI power to you

## [What happens next?](#)

---

## Managing High Cardinality

---

## Missing Dashboards

Erlang Microstate Accounting

Queue State

Ranch

---

# [KEY TAKE AWAYS](#)

RabbitMQ v3.8 has many amazing features

We are investing heavily in observability

It's a great time to understand your RabbitMQ

[**Snapshot & share!**](#)

---

# [12/12](#) WEBINAR
