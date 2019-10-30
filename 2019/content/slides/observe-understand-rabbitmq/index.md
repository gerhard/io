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

<span class="menu-title">THIS IS AMAZING!</span>

* ~~Intro~~
* ~~I do not understand~~
* ~~I am starting to get it~~
* **[THIS IS AMAZING!](#)**
* I had no idea that this even existed
* We are just getting started...

{{< speaker_note >}}
* What do we want you to take-away?
* Why is this important?
* How do you get started and make the transition from what you already know?

Let's dig deeper so that you can appreciate the subtle and totally amazing aspects of this
{{< /speaker_note >}}

---

What happens at the Erlang Distribution level when <br>publishing and consuming from a <br>**Mirrored Classic Queue**?

---

How about a **Quorum Queue**?

---

What happens within **Quorum Queue Raft**?

{{< speaker_note >}}
* log ops / s
* log op latency
* long logs
{{< /speaker_note >}}

---

This is interesting! **Let's share** with Karl & Diana

---

RabbitMQ ate all my memory!

Show an Erlang Solutions expert this: <br>**Erlang-Memory-Allocators**

---

Discover more: <br>https://grafana.com/orgs/rabbitmq

---

Life on the cutting edge: <br>https://grafana.gcp.rabbitmq.com

---

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

* ~~Intro~~
* ~~I do not understand~~
* ~~I am starting to get it~~
* ~~This is amazing!~~
* ~~I had no idea that this even existed~~
* **[WE ARE JUST GETTING STARTED...](#)**

---

The problem with high cardinality

---

Queue state

---

Erlang Microstate Accounting

---

Compare Erlang Distributions alternatives <br>**Enterprise Feature**

{{< speaker_note >}}
Open Core business model - new value-add features applicable to enterprise environments
{{< speaker_note >}}

---

<span class="menu-title">REMEMBER THIS</span>

* RabbitMQ v3.8 has many amazing features
* We are investing heavily in observability
* It's a great time to understand your RabbitMQ

---

Show us your RabbitMQ!
