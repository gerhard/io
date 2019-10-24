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
<span class="menu-title">Intro</span>

---

### RabbitMQ Core Engineer

<img src="/img/observable-systems/gerhard.png" height="400">

#### <i class="fab fa-twitter"></i> <a href="https://twitter.com/gerhardlazu" target="_blank">gerhardlazu</a> &nbsp; <i class="fab fa-github"></i> <a href="https://github.com/gerhard" target="_blank">gerhard</a>

---

### RabbitMQ for K8S PM

<img src="/img/observable-systems/mkuratczyk.jpeg" height="400">

#### <i class="fab fa-twitter"></i> <a href="https://twitter.com/MichalKuratczyk" target="_blank">MichalKuratczyk</a> &nbsp; <i class="fab fa-github"></i> <a href="https://github.com/mkuratczyk" target="_blank">mkuratczyk</a>

---

## Agenda

* [`05'` INTRO](#)
* `05'` I do not get it
* `10'` I am starting to get it
* `10'` Oh, wow - this is amazing
* `05'` I did not know this existed
* `05'` I have so many ideas now...

---

## What is observability?
#### Understanding a system through its external outputs

* [LOGS](#) - **What happened?** - Information
* [METRICS](#) - **How much? How long?** - Quantity
* [TRACES](#) - **How does it fit together?** - Correlation

> Logs + Metrics + Traces

---

## Why is it important?

* Distributed systems are hard to understand & explain
* The landscape is becoming more complex
    * containers on VMs on physical hosts
    * service meshes on software defined networks on physical networks
* All this layering makes it hard to understand where the problems are
* Observability enables us to understand, explain & improve our systems

---

## How did we observe in 3.7?

* Via the `rabbitmq_management` plugin
  * **UI** - lots of screenshots!
  * **JSON API** - all monitoring agents use this
* Logs + Crash traces
* Erlang crash dumps
* [`rabbitmq_event_exchange`](https://www.rabbitmq.com/event-exchange.html)

---

# But this is too hard

* Logs for a RabbitMQ cluster are hard to correlate
  * Editor-of-choice skills helps, but it's still hard
  * Tools have been built to make it easier, but no traction
* Correlating metrics from different layers was very hard
  * RabbitMQ / Raft / Mnesia / BEAM + System / Hardware / Network
  * Especially hard to correlate to logs / crashes
  * Impossible post-incident - either in memory or 3rd party systems
* Do you even use the event exchange to understand the system? I don't.

---

# Oh, and [no metrics when](#):

* A node goes away or the cluster is under pressure
  * API requests take a long time and mostly timeout
  * Let me show you!
* Nodes go away
  * Watch the state of Erlang Distribution links
* Data buffered (a.k.a. stuck) in Erlang Distribution links
  * Watch OTP-15905 (v22.1) in action

---

# And when you escalate to us...

* We need metrics & logs from all RabbitMQ nodes to be able to help
* Best-case scenario, you send us walls of plain text
  * Hard to capture, share & analyze
  * Using different systems for logs & metrics makes it challenging
  * In many cases, state is simply lost
  * We end up with insufficient data to make informed conclusions

---

# So we needed a rethink

* Improving what we had was not going to be enough
* We chose to focus on metrics first
  * We expect alerts to follow closely
* And then logs next
* And eventually traces

> If I had asked people what they wanted, <br>
> they would have said faster horses. <br>
> Henry Ford

---

# We needed a different system

* Remove the inter-node dependency
  * Get metrics from other nodes without going through the Erlang Distribution
* Minimize resources used by metrics
  * Do not aggregate server-side
  * Use as little RabbitMQ memory & CPU as possible (and no disk)
* Expose metrics when RabbitMQ is under extreme pressure
* Access metrics when RabbitMQ is unavailable
* ... and make it easy to share metrics

> We didn't need a better metrics system, <br>
> **we needed a different metrics system**

---

# Primary Goal: Tell a Better Story

We had to pick our battles, and focus on the primary goal:

**Tell a better story with metrics**

---

# The New Metrics System in 3.8

* Do the simplest thing - only expose node local metrics
* Expose more metrics - Raft / Mnesia / BEAM
* Metrics history no longer dependent on RabbitMQ
* Querying metrics will not impact RabbitMQ
  * RabbitMQ has more resources for messaging
* Things that we chose to delegate
  * metrics storage & querying - Prometheus
  * metrics visualisation - Grafana

---

# How to enable the new metrics?

* `rabbitmq-plugins enable rabbitmq_prometheus`
* `curl localhost:15692/metrics`

---

# How to use the new metrics?

* Given there is a Prometheus & Grafana
* Prometheus scrapes RabbitMQ metrics periodically
* Grafana is connected to Prometheus
* Import Grafana dashboards that our team manages
* Visualise RabbitMQ metrics stored in Prometheus via Grafana

> Refer to the new **Monitoring with Prometheus** guide

---

# RabbitMQ Overview Dashboard
## The equivalent of RabbitMQ Management Overview

* Correlate metrics by colour: node-specific
* Correlate graphs by order: queues, channels & connections
  * queue rebalancing
* Built-in thresholds: churn metrics
* Spot anti-patterns: polling operations
* Zoom in on interesting spikes or drops
* Helpful context for all metrics
  * **i** is the new & improved **?**

> This is just a bridge from RabbitMQ Management into the new world...

---

# A Simpler RabbitMQ Overview

* [LETS](#) build a simpler RabbitMQ Overview, together
* [The Four Golden Signals](https://landing.google.com/sre/sre-book/chapters/monitoring-distributed-systems/#xref_monitoring_golden-signals)
  * [L](#)atency
  * [E](#)rrors
  * [T](#)raffic
  * [S](#)aturation

> We both know that you will not build your own, so...

---

# Discover other dashboards

* grafana.com RabbitMQ team
* RabbitMQ Raft
* Erlang Distribution
* Erlang Memory Allocators

---

# Next time you need help

* Share your metrics!

---

# If you want it all integrated
## RabbitMQ for K8S

* Prometheus & Grafana integration
  * service discovery (RabbitMQ & clients)
  * all public dashboards, including updates
  * automatically get new RabbitMQ dashboards
  * system metrics for RabbitMQ & clients
* Private dashboards
  * e.g. fleet overview

---

# We care about different things

* We care about monitoring RabbitMQ
* You care about monitoring the system as a whole
  * What is the end-to-end message lantency?
  * Open Tracing integration via Spring Boot?

---

# Observer CLI

`rabbitmq-diagnostics observer`

---

# Internal events

`rabbitmq-diagnostics consume_event_stream`

---

# `rabbitmq-diagnostics`

---

# Health Checks
