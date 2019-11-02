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

### RabbitMQ for Kubernetes Product Manager
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
{{< /speaker_note >}}

---

{{< slide background-video="/img/observable-systems/rabbitmq-management-unresponsive-43.mp4" background-video-loop="true" background-size="cover" >}}
<span class="menu-title">Management not loading</span>

{{< speaker_note >}}

* Let's start with the good old Management UI. It serves the purpose until you actually need it
* in a failing or very busy cluster, Management UI is usually one of the first things to fail
* Also, if you restart a node, you no longer have the metrics history.
* If you restart all nodes to resolve an issue, you probably can't do post-mortem anymore

{{< /speaker_note >}}

---

{{< slide background-image="/img/observable-systems/rabbitmq-exporter-duration-43.png" background-size="cover" >}}
<span class="menu-title">Management API response</span>

{{< speaker_note >}}

* We've measured how long it takes to collect metrics using the Management plugin
* I takes milliseconds without load but half a minute when the cluster is loaded
* That means we can only collect metrics once a minute

{{< /speaker_note >}}

---

{{< slide class="hiviz-dark" background-color="#161719">}}

<span class="menu-title">NEW METRICS IN 3.8</span>

RabbitMQ Management limitations

## [NEW METRICS SYSTEM IN RABBITMQ 3.8](#)

**Understand like never before**

**More CLI power to you**

**What happens next?**

{{< speaker_note >}}
{{< /speaker_note >}}

---

<span class="menu-title">Enable built-in plugin</span>

`rabbitmq-plugins enable rabbitmq_prometheus`

{{< speaker_note >}}

* Version 3.8 introduced a completely new plugin that provides Prometheus support and does not rely on the Management plugin

{{< /speaker_note >}}

---

{{< slide background-image="/img/observable-systems/rabbitmq-exporter-vs-new-plugin-43.png" background-size="cover" >}}

<span class="menu-title">Faster responses</span>

{{< speaker_note >}}

* You can see how much faster this new plugin is
* Which means we can collect metrics every 10 or 15 seconds which is much more useful
* An important point is that you have to connect to each node individually to get all metrics

{{< /speaker_note >}}

---

{{< slide background-image="/img/observable-systems/rabbitmq-overview-1.png" background-size="cover" >}}

<span class="menu-title">New Overview Dashboard</span>

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

{{< slide background-video="/img/observable-systems/rabbitmq-overview-info-43.mp4" background-size="cover" >}}

<span class="menu-title">Built-in explanations</span>

{{< speaker_note >}}

* Moreover, these new dashboards not only show you the raw data but also provide additional explanation and links to the relevant parts of the documentation

{{< /speaker_note >}}

---

{{< slide background-image="/img/observable-systems/rebalance-queues-before-43.png" background-size="cover" >}}

<span class="menu-title">Spot imbalances</span>

{{< speaker_note >}}

* Because all those metrics are collected from each node individually, we can easily spot imbalances
* For example, here we can see all queue masters are on a single node.
* This is a very common issue since, by default, the node you are connected to becomes the master for newly declared queues

{{< /speaker_note >}}

---

<span class="menu-title">Rebalance all</span>

`rabbitmq-queues rebalance all`

{{< speaker_note >}}

* Well, we now have an easy way to resolve this particular issue.
* We can run `rabbitmq-queues rebalance all` on any node to reshuffle queue masters

{{< /speaker_note >}}

---

{{< slide background-image="/img/observable-systems/rebalance-queues-after-43.png" background-size="cover" >}}

<span class="menu-title">See the balance</span>

{{< speaker_note >}}

* Try to spot the moment we ran this command.
* It's not perfectly balanced but this is because we only have 10 queues

{{< /speaker_note >}}

---

{{< slide background-video="/img/observable-systems/erlang-distribution-links-43.mp4" background-size="cover" >}}

<span class="menu-title">See node links</span>

{{< speaker_note >}}

* As you know RabbitMQ relies on Erlang for clustering
* Which means you need to monitor Erlang to get the full picture of what's going on
* You can see if the links between nodes are up

{{< /speaker_note >}}

---

{{< slide background-video="/img/observable-systems/erlang-distribution-transfer-43.mp4" background-size="cover" >}}
<span class="menu-title">Data sent to peer</span>

{{< speaker_note >}}

* How much data is transmitted between each set of nodes
* And much, much more.
* Hopefully you won't need all that data too often but it's invaluable when you actually do

{{< /speaker_note >}}

---

{{< slide background-video="/img/observable-systems/data-in-port-driver-buffer-43.mp4" background-size="cover" >}}
<span class="menu-title">Data in Port Driver Buffer</span>

{{< speaker_note >}}

* Here we zoom in on the data in port driver buffer
* Which likely doesn't tell you anything but you can see there are is a 100 meg of data to be transferred
* Remember our old friend Management plugin? Since the API has to collect metrics from all nodes
* It actually relies on the same Erlang infrastructure to request and receive metrics that RabbitMQ uses for queue mirroring and other things
* This means that if, for example, the Management plugin requests metrics from another node
* it won't get an answer until all that data that was already in the buffer is transferred
* This is another case where the Management plugin fails to deliver the insights you need, exactly when you need them

{{< /speaker_note >}}

---

{{< slide background-video="/img/observable-systems/perf-test-43.mp4" background-size="cover" >}}
<span class="menu-title">Perf-Test</span>

{{< speaker_note >}}
* What really matter is the performance from the user perspective
* In this case, our users are RabbitMQ clients
* You should expose the metrics from your apps as well
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

## [1 Mebibyte](#) of message bodies

[**Mirrored Classic Queue**](#): Master `+2` Slaves

| Erlang Distribution Link | Traffic      |
| ---                      | ---          |
| Master 0 → Mirror 1      | [2MB / s](#) |
| Mirror 1 → Mirror 2      | [1MB / s](#) |
| Mirror 2 → Master 0      | [1MB / s](#) |
| Master 0 → Mirror 2      | [1MB / s](#) |

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

{{< slide class="hiviz-dark" background-video="/img/observable-systems/erlang-distribution-stories-43.mp4" background-video-loop="true" background-size="cover" >}}
<span class="menu-title">One graph...</span>

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
| ---      | ---         | ---     | ---        |
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

{{< slide background-video="/img/observable-systems/rabbitmq-diagnostics-observer-43-part-5.mp4" background-size="cover" >}}
<span class="menu-title">observer_cli Mnesia</span>

---

{{< slide background-video="/img/observable-systems/rabbitmq-diagnostics-observer-43-part-6.mp4" background-size="cover" >}}
<span class="menu-title">observer_cli Apps</span>

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

## Integrate [logs](#)

I meant [**Events**](#)

<br><br><br><br><br><br><br><br>

---

## Try [OpenTelemetry](#)

<img data-src="/img/observable-systems/opentelemtry-43.png" />

---

{{< slide class="hiviz-dark" background-color="#161719">}}

# [3 KEY TAKE AWAYS](#)

---

## Have [different conversations](#)

**Observe, snapshot & share**

---

## Aim to [understand and improve](#)
<span class="menu-title">Understand and improve</span>

**This is an infinite game**

---

## [Ask questions](#) in the webinar

**12th of December, 2019**

[@RabbitMQ](https://twitter.com/RabbitMQ)
