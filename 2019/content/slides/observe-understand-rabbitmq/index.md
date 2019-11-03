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

### RabbitMQ for Kubernetes <br> Product Manager
<span class="menu-title">Michal Kuratczyk</span>

<img src="/img/observable-systems/mkuratczyk.jpeg" height="400">

#### <i class="fab fa-twitter"></i> <a href="https://twitter.com/MichalKuratczyk" target="_blank">MichalKuratczyk</a> &nbsp; <i class="fab fa-github"></i> <a href="https://github.com/mkuratczyk" target="_blank">mkuratczyk</a>

---

{{< slide class="hiviz-dark" background-color="#161719">}}

<span class="menu-title">MANAGEMENT LIMITATIONS</span>

## [RABBITMQ MANAGEMENT LIMITATIONS](#)

**New metrics system in RabbitMQ 3.8**

**Understand like never before**

**More CLI power to you**

**What happens next?**

{{< speaker_note >}}

* What was the problem? Why have we invested so much time into observability?
* Until now, the Management plugin was the de facto tool to monitor your RabbitMQ

* **Unfortunately, in a failing or very busy cluster, Management UI is usually one of the first things to fail**

{{< /speaker_note >}}

---

{{< slide background-video="/img/observable-systems/rabbitmq-management-unresponsive-43.mp4" background-size="cover" >}}
<span class="menu-title">Management not loading</span>

{{< speaker_note >}}

* Here's the Management UI of a busy RabbitMQ cluster
* It takes a minute to load the page!
* Metrics are not available if you restart a node
* If you restart all nodes to resolve an issue, you probably can't do post-mortem anymore
* **External monitoring tool probably relies on the Management plugin API to collect the metrics as well**

{{< /speaker_note >}}

---

{{< slide background-image="/img/observable-systems/rabbitmq-exporter-duration-43.png" background-size="cover" >}}
<span class="menu-title">Management API response</span>

{{< speaker_note >}}

* This means that yur external tool will be affected by the same performance issues
* As you can see, it takes milliseconds to get the metrics if there is no load but 30-40 seconds on a busy cluster
* That means we can only collect metrics once a minute

{{< /speaker_note >}}

---

##### `rabbitmq-plugins enable rabbitmq_prometheus`
<span class="menu-title">New built-in plugin</span>

{{< speaker_note >}}

* Version 3.8 introduced a completely new plugin that provides Prometheus support and does not rely on the Management plugin
* **Let's compare the performance of this new plugin to what we saw before**

{{< /speaker_note >}}

---

{{< slide background-video="/img/observable-systems/rabbitmq-plugins-enable-prometheus.mp4" background-size="cover" >}}

<span class="menu-title">Enable built-in plugin</span>

{{< speaker_note >}}

* Version 3.8 introduced a completely new plugin that provides Prometheus support and does not rely on the Management plugin
* **Let's compare the performance of this new plugin to what we saw before**

{{< /speaker_note >}}

---

{{< slide background-image="/img/observable-systems/rabbitmq-exporter-vs-new-plugin-43.png" background-size="cover" >}}

<span class="menu-title">Faster responses</span>

{{< speaker_note >}}

* You can see how much faster this new plugin is
* Which means we can collect metrics every 10 or 15 seconds which is much more useful
* An important point is that you have to connect to each node individually to get all metrics
* **Now that we have a new, reliable, source of data, we also needed a new way to visualize that data**

{{< /speaker_note >}}

---

{{< slide background-image="/img/observable-systems/rabbitmq-overview-1.png" background-size="cover" >}}

<span class="menu-title">New RabbitMQ-Overview</span>

{{< speaker_note >}}

* Grafana is a great tool for the job
* RabbitMQ Overview dashboard shows roughly the same data you could find in the Management UI
* This dashboard is already available - once you enable the plugin, deploy Prometheus and Grafana, just import this dashboard and that's it**
* **Because all those metrics are collected from each node individually, we can easily spot imbalances**

{{< /speaker_note >}}

---

{{< slide background-image="/img/observable-systems/rebalance-queues-before-43.png" background-size="cover" >}}

<span class="menu-title">Spot queue imbalances</span>

{{< speaker_note >}}

* For example, here we can see the number of queue masters per node
* This is a very common issue since, by default, the node you are connected to becomes the master for newly declared queues
* It is also what you'll see after a rolling upgrade or restart of your cluster
* **Well, we now have an easy way to resolve this particular issue.**

{{< /speaker_note >}}

---

<span class="menu-title">Rebalance all queues</span>

`rabbitmq-queues rebalance all`

{{< speaker_note >}}

* We can rebalance some of the queues or all of them
* **If you look carefully, you can see when the command was executed**

{{< /speaker_note >}}

---

{{< slide background-image="/img/observable-systems/rebalance-queues-after-43.png" background-size="cover" >}}

<span class="menu-title">Evenly spread queues</span>

{{< speaker_note >}}

* **As you know RabbitMQ relies on Erlang for clustering**
* **Which means you need to monitor Erlang to get the full picture of what's going on**

{{< /speaker_note >}}

---

{{< slide background-video="/img/observable-systems/erlang-distribution-links-43.mp4" background-size="cover" >}}

<span class="menu-title">See node links</span>

{{< speaker_note >}}

* We have 6 connections in a 3-node cluster
* You can see if the links between nodes are up

{{< /speaker_note >}}

---

{{< slide background-video="/img/observable-systems/erlang-distribution-transfer-43.mp4" background-size="cover" >}}
<span class="menu-title">Data sent to peer</span>

{{< speaker_note >}}

* How much data is transmitted between each set of nodes
* **And much, much more.**

{{< /speaker_note >}}

---

{{< slide background-video="/img/observable-systems/data-in-port-driver-buffer-43.mp4" background-size="cover" >}}
<span class="menu-title">Data in port driver buffer</span>

{{< speaker_note >}}

* Here we zoom in on the data in port driver buffer
* Which likely doesn't tell you anything but it is a very important buffer
* Anything that needs to be transmitted between node, is added to this buffer
* This is actually explains why the Management plugin is slow in a busy cluster
* **So we have RabbitMQ and Erlang metrics. Do we need anything else? Yes!**

{{< /speaker_note >}}

---

{{< slide background-video="/img/observable-systems/perf-test-43.mp4" background-size="cover" >}}
<span class="menu-title">Perf-Test dashboard - v1</span>

{{< speaker_note >}}

* What really matters is the performance from the user perspective
* In this case, our users are RabbitMQ clients
* You should expose the metrics from your apps as well
* Even though this dashboard is v1, a version with better UX is in the works

{{< /speaker_note >}}

---

{{< slide background-image="/img/observable-systems/sharing-metrics-problem.png" background-size="cover" >}}
<span class="menu-title">Problem</span>

---

{{< slide background-video="/img/observable-systems/sharing-metrics-info.mp4" background-size="cover" >}}
<span class="menu-title">Info</span>

---

{{< slide background-video="/img/observable-systems/sharing-metrics-snapshot.mp4" background-size="cover" >}}
<span class="menu-title">Snapshot</span>

---

{{< slide class="hiviz-dark" background-color="#161719">}}

# [FIRST 3 TAKE AWAYS](#)

---

## [Upgrade](#) to RabbitMQ [3.8](#)

**Discover all the new features**

😱 Metricless Management 🤯

---

## [Enable & visualise](#) new metrics
<span class="menu-title">Start using new metrics</span>

**First step towards better conversations**

---

## [Share metrics](#) when asking for help
<span class="menu-title">Share snapshots</span>

**Help us help you!**

{{< speaker_note >}}

* Help us help you!
* Gerhard will now show you even more awesomeness

{{< /speaker_note >}}

---

{{< slide class="hiviz-dark" background-color="#161719">}}

<span class="menu-title">HOW TO UNDERSTAND</span>

RabbitMQ Management limitations

New metrics system in RabbitMQ 3.8

## [UNDERSTAND LIKE NEVER BEFORE](#)

**More CLI power to you**

**What happens next?**

{{< speaker_note >}}
Now that you are starting to understand how all this fits together,
let's dig deeper so that you can better appreciate the opportunities that this opens.
{{< /speaker_note >}}

---

## What happens in the <br>[Erlang Distribution](#)?
<span class="menu-title">What happens in inet_dist?</span>

Mirrored Classic Queue <br>vs Quorum Queue

---

## [Mirrored Classic Queue](#)
<br>

* Master `+2` Mirrors
* 100 msg/s @ 10KiB
* 1 Publisher [→](#) 1 Consumer
* 1 MiB / s constant message flow

---

{{< slide background-image="/img/observable-systems/erlang-distribution-mirrored-queue-rabbitmq-management-43.png" background-size="cover" >}}
<span class="menu-title">MCQ - Management</span>

---

{{< slide background-video="/img/observable-systems/erlang-distribution-mirrored-queue-43-part-1.mp4" background-size="cover" >}}
<span class="menu-title">MCQ - Erlang Distribution</span>

---

{{< slide background-video="/img/observable-systems/erlang-distribution-mirrored-queue-43-part-2.mp4" background-size="cover" >}}
<span class="menu-title">MCQ - Data sent to peer</span>

---

## [1 Mebibyte](#) of msg bodies

[**Mirrored Classic Queue**](#): Master `+2` Slaves

| Erlang Distribution Link | Traffic      |
| ------------------------ | ------------ |
| Master 0 → Mirror 1      | [2MB / s](#) |
| Mirror 1 → Mirror 2      | [1MB / s](#) |
| Mirror 2 → Master 0      | [1MB / s](#) |
| Master 0 → Mirror 2      | [1MB / s](#) |

---

## Why does <br>[Erlang Distribution traffic](#) <br>matter?
<span class="menu-title">Erlang Distribution traffic</span>

---

{{< slide class="hiviz-dark" background="url(/img/observable-systems/erlang-distribution-link-limit-10KB-43.png) center bottom / cover no-repeat" >}}

## [470 MB/s](#) link max @ [10KB](#) in OTP [22](#)
<span class="menu-title">inet_tcp link limit @ 10KB</span>

---

{{< slide background="url(/img/observable-systems/erlang-otp-pr-2293-43.png) 50% 50% / cover no-repeat" >}}
<span class="menu-title">Erlang/OTP PR 2293</span>

---

## [Quorum Queue](#)
<br>

* Leader `+2` Followers
* 100 msg/s @ 10KiB
* 1 Publisher [→](#) 1 Consumer
* 1 MiB / s constant message flow

---

{{< slide background-image="/img/observable-systems/erlang-distribution-quorum-queue-43.png" background-size="cover" >}}
<span class="menu-title">QQ - Inter-node traffic</span>

---

## [Quorum Queue](#) 2.5x [less pressure](#)
on Erlang Distribution than Mirrored Classic Queue
<span class="menu-title">QQ 2.5x less pressure</span>

| MCQ Link | MCQ Traffic | QQ Link | QQ Traffic |
| -------- | ----------- | ------- | ---------- |
| M0 → M1  | 2MB / s     | L0 → F1 | 1MB / s    |
| M1 → M2  | 1MB / s     | L0 → F2 | 1MB / s    |
| M2 → M0  | 1MB / s     |         |            |
| M0 → M2  | 1MB / s     |         |            |

---

## Help me understand <br>[Quorum Queue](#) internals
<span class="menu-title">Understand QQ Raft</span>

**RabbitMQ-Quorum-Queues-Raft**

---

{{< slide background-video="/img/observable-systems/rabbitmq-qq-raft-43-part-1.mp4" background-size="cover" >}}
<span class="menu-title">Log entries committed / s</span>

---

{{< slide background-video="/img/observable-systems/rabbitmq-qq-raft-43-part-2.mp4" background-size="cover" >}}
<span class="menu-title">Log entry commit latency</span>

---

{{< slide background-video="/img/observable-systems/rabbitmq-qq-raft-43-part-3.mp4" background-size="cover" >}}
<span class="menu-title">Raft members with >5k entries</span>

---

## Hey Rabbit! <br>[Where is my memory?](#)
<span class="menu-title">Where is my memory?</span>

**Erlang-Memory-Allocators**

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
<span class="menu-title">All memory allocators</span>

---

## Discover other [dashboards](#)

<img data-src="/img/observable-systems/grafana-rabbitmq-org-43.png" />

---

## Make [dashboards](#)

<img data-src="/img/observable-systems/make-dashboards-43.png" />

---

{{< slide class="hiviz-dark" background-color="#161719">}}

<span class="menu-title">MORE CLI POWER TO YOU</span>

RabbitMQ Management limitations

New metrics system in RabbitMQ 3.8

Understand like never before

## [MORE CLI POWER TO YOU](#)

**What happens next?**

---

{{< slide background-video="/img/observable-systems/htop-43.mp4" background-video-loop="true" background-size="cover" >}}
<span class="menu-title">Remember htop?</span>

---

## [Observe](#) Erlang VM

**RabbitMQ v3.8.0**

`rabbitmq-diagnostics observer`

---

{{< slide background-video="/img/observable-systems/rabbitmq-diagnostics-observer-43-part-1.mp4" background-size="cover" >}}
<span class="menu-title">observer_cli home</span>

---

{{< slide background-video="/img/observable-systems/rabbitmq-diagnostics-observer-43-part-2.mp4" background-size="cover" >}}
<span class="menu-title">observer_cli home reductions</span>

---

{{< slide background-video="/img/observable-systems/rabbitmq-diagnostics-observer-43-part-3.mp4" background-size="cover" >}}
<span class="menu-title">observer_cli inspect process</span>

---

{{< slide background-video="/img/observable-systems/rabbitmq-diagnostics-observer-43-part-4.mp4" background-size="cover" >}}
<span class="menu-title">observer_cli ETS</span>

---

## [See](#) RabbitMQ events

**RabbitMQ v3.8.1**

`rabbitmq-diagnostics consume_event_stream`

---

{{< slide background-video="/img/observable-systems/rabbitmq-diagnostics-events-43.mp4" background-size="cover" >}}
<span class="menu-title">consume_event_stream</span>

---

{{< slide background-video="/img/observable-systems/rabbitmq-diagnostics-43.mp4" background-size="cover" >}}
<span class="menu-title">rabbitmq-diagnostics help</span>

---

{{< slide class="hiviz-dark" background-color="#161719">}}

<span class="menu-title">WHAT HAPPENS NEXT?</span>

RabbitMQ Management limitations

New metrics system in RabbitMQ 3.8

Understand like never before

More CLI power to you

## [WHAT HAPPENS NEXT?](#)

---

## Expose [more metrics](#)

and address high cardinality

<img data-src="/img/observable-systems/rabbitmq-prometheus-pr-9-43.png" />

---

## Build [new dashboards](#)

**Erlang-Microstate-Accounting**

<img data-src="/img/observable-systems/prometheus.erl-pr-98-43.png" />

---

{{< slide background="url(/img/observable-systems/loki-logs.png) 0 115% / 100% no-repeat" >}}

## See [logs](#) together with metrics

I meant [**Events**](#)

<br><br><br><br><br><br><br><br>

---

## Try [OpenTelemetry](#)

<img data-src="/img/observable-systems/opentelemtry-43.png" />

---

{{< slide class="hiviz-dark" background-color="#161719">}}

# [LAST 3 TAKE AWAYS](#)

---

## Have [different conversations](#)

**Observe, snapshot & share**

---

## Aim to [understand and improve](#)
<span class="menu-title">Understand and improve</span>

**This is an infinite game**

---

## [Ask questions](#) in the [webinar](#)

**12th of December, 2019**

[@RabbitMQ](https://twitter.com/RabbitMQ)

---

{{< slide background-video="/img/observable-systems/observe-understand-rabbitmq-live-43.mp4" background-size="cover" >}}
<span class="menu-title">PUBLIC SLIDES</span>
