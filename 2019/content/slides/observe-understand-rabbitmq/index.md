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

{{< slide class="hiviz-dark" background-video="/img/observable-systems/observe-understand-rabbitmq-intro.mp4" background-video-loop="true" background-size="cover" >}}

## Observe && <br> [Understand](#) <br> RabbitMQ
<span class="menu-title">INTRO</span>

{{< speaker_note >}}
* See RabbitMQ in a completely different light
* The goal is to understand RabbitMQ
* Have different discussions
* Improve RabbitMQ and Erlang together
* Relate to other CNCF projects
{{< /speaker_note >}}

---

### RabbitMQ Core Engineer
<span class="menu-title">Gerhard Lazu - GL</span>

<img src="/img/observable-systems/gerhard.png" height="400">

#### <i class="fab fa-twitter"></i> <a href="https://twitter.com/gerhardlazu" target="_blank">gerhardlazu</a> &nbsp; <i class="fab fa-github"></i> <a href="https://github.com/gerhard" target="_blank">gerhard</a>

---

### RabbitMQ for K8S PM
<span class="menu-title">Michal Kuratczyk - MK</span>

<img src="/img/observable-systems/mkuratczyk.jpeg" height="400">

#### <i class="fab fa-twitter"></i> <a href="https://twitter.com/MichalKuratczyk" target="_blank">MichalKuratczyk</a> &nbsp; <i class="fab fa-github"></i> <a href="https://github.com/mkuratczyk" target="_blank">mkuratczyk</a>

---

{{< slide class="hiviz-dark" background-color="#161719">}}

<span class="menu-title">I DO NOT UNDERSTAND</span>

* ~~Intro~~
* **[I DO NOT UNDERSTAND](#)**
* I am starting to get it
* This is amazing!
* I had no idea that this even existed
* We are just getting started...

---

{{< slide background-video="/img/observable-systems/rabbitmq-management-unresponsive.mp4" background-video-loop="true" background-size="cover" >}}

{{< speaker_note >}}
I assume that you have all seen Management UI not loading...
{{< /speaker_note >}}

---

{{< slide background-image="/img/observable-systems/exporter-vs-plugin.png" background-size="cover" >}}

{{< speaker_note >}}
Since management plugin provides the UI and the monitoring API, metrics are not available or very slow to collect when cluster is busy
{{< /speaker_note >}}

---

{{< slide background-video="/img/observable-systems/erlang-distribution.mp4" background-video-loop="false" background-size="cover" >}}

{{< speaker_note >}}
<!-- And even if you had the expected RabbitMQ metrics, <br>you still wouldn't understand what is happening -->
<!-- You need to have and look at <br>the Erlang Distribution metrics: -->
{{< /speaker_note >}}

---

{{< slide background-image="/img/observable-systems/data-in-port-driver-buffer.png" background-size="cover" >}}

{{< speaker_note >}}
Management Plugin won't receive metrics from other nodes until all that data is flushed from the buffers
{{< /speaker_note >}}

---

{{< slide class="hiviz-dark" background-color="#161719">}}

<span class="menu-title">I AM STARTING TO GET IT</span>

* ~~Intro~~
* ~~I do not understand~~
* **[I AM STARTING TO GET IT](#)**
* This is amazing!
* I had no idea that this even existed
* We are just getting started...

---

{{< slide background-image="/img/observable-systems/rabbitmq-overview-1.png" background-size="cover" >}}

{{< speaker_note >}}
* is a transition from what you are familiar with
* it shows more metrics than you can see on the traditional RabbitMQ Overview
* all metrics are per node
* some panels have sensible default thresholds
* panels are grouped by object type: e.g. nodes, connections, etc.
{{< /speaker_note >}}

---

{{< slide background-image="/img/observable-systems/rabbitmq-overview-2.png" background-size="cover" >}}

{{< speaker_note >}}
See your cluster's imbalances
* connections
* queues
{{< /speaker_note >}}

---

`rabbitmq-queues rebalance all`

{{< speaker_note >}}
This is what it looks like to rebalance queue masters / followers
{{< /speaker_note >}}

---

<span class="menu-title">MK take-aways</span>

* MK wants you to remember...
* MK encourages you to think about...
* MK challenges you to imagine...

---

{{< slide class="hiviz-dark" background-color="#161719">}}

<span class="menu-title">THIS IS AMAZING!</span>

* ~~Intro~~
* ~~I do not understand~~
* ~~I am starting to get it~~
* **[THIS IS AMAZING!](#)**
* I had no idea that this even existed
* We are just getting started...

{{< speaker_note >}}
Now that you are starting to understand how all this fits together,
let's dig deeper so that you can better appreciate the opportunities that this opens.
{{< /speaker_note >}}

---

## What happens in the <br>[Erlang Distribution](#)?
<span class="menu-title">Erlang Distribution - 3 nodes</span>

RabbitMQ cluster with [3 nodes](#)

---

## [Mirrored Classic Queue](#)
<br>

* Master `+2` Slaves
* 100 msg/s @ 10KiB
* 1 Publisher [→](#) 1 Consumer

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
| Master  → Slave 1        | [2MB](#) |
| Slave 1 → Slave 2        | [1MB](#) |
| Slave 2 → Master         | [1MB](#) |
| Master  → Slave 2        | [1MB](#) |

---

## Why does <br>[Erlang Distribution traffic](#) <br>matter?
<span class="menu-title">Erlang Distribution traffic</span>

---

{{< slide background="url(/img/observable-systems/erlang-distribution-link-limit-10KB-43.png) 50% 50% / cover no-repeat" >}}
<span class="menu-title">Link limit @ 10KB</span>

---

## [50,000 msg/s](#) @ 10KiB
Erlang Distribution link theoretical max

---

## [25,000 msg/s](#) @ 10KiB

Erlang Distribution link theoretical max <br>[when using **Mirrored Classic Queues**](#)

---

## [Quorum Queue](#)
<br>

* Leader `+2` Followers
* 100 msg/s @ 10KiB
* 1 Publisher [→](#) 1 Consumer

---

{{< slide background-image="/img/observable-systems/erlang-distribution-quorum-queue.png" background-size="cover" >}}
<span class="menu-title">QQ - Inter-node traffic</span>

---

## [Quorum Queue](#) 2.5x [less pressure](#)
on Erlang Distribution than Mirrored Classic Queue
<span class="menu-title">QQ 2.5x less pressure</span>

| MCQ Link | MCQ Traffic | QQ Link | QQ Traffic |
| ---      | ---         | ---     | ---        |
| M  → S1  | 2MB         | L → F1  | 1MB        |
| S1 → S2  | 1MB         | L → F2  | 1MB        |
| S2 → M   | 1MB         |         |            |
| M  → S2  | 1MB         |         |            |

---

## What happens with the <br>[50,000 msg/s](#) limit?
<span class="menu-title">Erlang Distribution traffic</span>

---

{{< slide background="url(/img/observable-systems/erlang-otp-pr-2293-43.png) 50% 50% / cover no-repeat" >}}
<span class="menu-title">Erlang/OTP PR 2293</span>

---

{{< slide class="hiviz-dark" background-video="/img/observable-systems/erlang-distribution-43.mp4" background-video-loop="true" background-size="cover" >}}

{{< speaker_note >}}
One graph from one dashboard:

* Makes limitations easy to spot
* Confirms one benefit of Raft replication
* Helps Erlang/OTP improve
{{< /speaker_note >}}

---

## Can you show me <br>[Quorum Queue Raft](#) now?
<span class="menu-title">RabbitMQ-Quorum-Queues-Raft</span>

---

{{< slide background-video="/img/observable-systems/rabbitmq-raft-part-1-43.mp4" background-size="cover" >}}
<span class="menu-title">Log entries committed / s</span>

---

{{< slide background-video="/img/observable-systems/rabbitmq-raft-part-2-43.mp4" background-size="cover" >}}
<span class="menu-title">Log entry commit latency</span>

---

{{< slide background-video="/img/observable-systems/rabbitmq-raft-part-3-43.mp4" background-size="cover" >}}
<span class="menu-title">Raft members with >5k</span>

---

{{< slide background-video="/img/observable-systems/rabbitmq-raft-part-4-43.mp4" background-size="cover" >}}
<span class="menu-title">Take dashboard snapshot</span>

---

{{< slide background-video="/img/observable-systems/rabbitmq-raft-part-5-43.mp4" background-size="cover" >}}
<span class="menu-title">Share dashboard snapshot</span>

---

## Why did RabbitMQ <br>[eat all my memory](#)?

---

{{< slide background="url(/img/observable-systems/erlang-memory-allocators-43.png) 50% 50% / cover no-repeat" >}}

---

{{< slide background="url(/img/observable-systems/erlang-memory-allocators-binary-alloc-43.png) 50% 50% / cover no-repeat" >}}

---

{{< slide background="url(/img/observable-systems/erlang-memory-allocators-ets-alloc-43.png) 50% 50% / cover no-repeat" >}}

---

## Discover more dashboards
https://grafana.com/orgs/rabbitmq

---

{{< slide class="hiviz-dark" background-color="#161719">}}

<span class="menu-title">NO IDEA THIS EXISTED</span>

* ~~Intro~~
* ~~I do not understand~~
* ~~I am starting to get it~~
* ~~This is amazing!~~
* **[I HAD NO IDEA THAT THIS EVEN EXISTED](#)**
* We are just getting started...

{{< speaker_note >}}
Now that most of you are amazed and inspired about what is possible when combining RabbitMQ with Prometheus and Grafana, let me amaze the rest of you...
{{< /speaker_note >}}

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

<span class="menu-title">JUST GETTING STARTED</span>

{{< slide class="hiviz-dark" background-color="#161719">}}

* ~~Intro~~
* ~~I do not understand~~
* ~~I am starting to get it~~
* ~~This is amazing!~~
* ~~I had no idea that this even existed~~
* **[WE ARE JUST GETTING STARTED...](#)**

---

## Managing High Cardinality

---

## Missing Dashboards

Erlang Microstate Accounting

Queue State

Ranch

---

## THINGS to [REMEMBER](#)

RabbitMQ v3.8 has many amazing features

We are investing heavily in observability

It's a great time to understand your RabbitMQ

[Show us your RabbitMQ!](#)
