---
title: Observe and Understand RabbitMQ
summary: What happened when RabbitMQ became more observable? How does it work?
authors: []
tags: []
categories: []
date: "2019-11-04T11:50:00Z"
slides:
  # see available slides. options in layouts/slides/baseof.html
  height: 1080
  theme: solarized
  width: 1920
  # https://github.com/hakimel/reveal.js/
  # https://developer.mozilla.org/en-US/docs/Web/CSS/background
---

# Observe and Understand RabbitMQ
<span class="menu-title">Intro</span>

---

# What is observability?

* Understand a system from its external outputs: metrics & events
  * Metric: a number with limited metadata - low-cardinality
      * Predefined or manual correlation - predictable - known-unknowns
  * Event: a combination of properties - high-cardinality
      * Highly dynamic correlation - non-predictable - unknown-unknowns

> Determining the behavior of the entire system from the system's outputs

---

# Why is it important?

* Distributed systems are hard to understand & explain
* The landscape is becoming more complex
    * containers on VMs on physical hosts
    * service meshes on software defined networks on physical networks
    * frameworks that use wrappers which delegate to client libraries
* All the layering makes it hard to understand where the problems are
* Observability enables us to understand, explain & improve

---

# How did we observe =< 3.7?

* Via the `rabbitmq_management` plugin
  * UI - lots of screenshots!
  * JSON API - all monitoring solutions use this
* [`rabbitmq_event_exchange`](https://www.rabbitmq.com/event-exchange.html)
* logs & crashes (unhandled exceptions)
* Erlang crash dumps

---

# This is too hard

* Correlating metrics from different layers is very hard
  * RabbitMQ / Mnesia / Erlang / System / Network
  * Impossible post-incident
* How to access events from the event exchange?
* Logs for a RabbitMQ cluster are hard to correlate
  * vim skills helps, but it's still cumbersome
  * really hard to correlate logs to metrics

---

# [No metrics](#) when...

* A node goes away or the cluster is under pressure
  * API requests take a really long time - show request timing in Chrome Network
* Nodes go away - state of Erlang Distribution links
* Data in Erlang Distribution link buffers - OTP-15905 in v22.1

---

# What do we need to help you?

* Metrics & logs from all RabbitMQ nodes
* Best-case scenario, you send us walls of plain text
* Hard to share & analyze, a lot of missing info

---

# We needed a rethink

* Focus on metrics first, tackle events afterwards
* Improving what we had was not going to be enough

> If I had asked people what they wanted, <br>
> they would have said faster horses. <br>
> Henry Ford

---

# A different metrics system

* Remove the inter-node dependency
  * How to get metrics from other nodes without the Erlang Distribution?
* Minimize resources used by metrics
  * Do not take memory away from messages
  * Do not take reductions away from channels & queues
* Have metrics even when RabbitMQ is under pressure or unavailable

> We didn't need a better metrics system, <br>
> we needed a **different** metrics system

---

# How to tell a better story?

We had to pick our battles, and focus on the end-goal

---

# The new metrics in 3.8

* Do the simplest thing - only expose node local metrics
* Expose more metrics - Raft / Mnesia / Erlang
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

* Helpful context for all metrics
  * **i** is the new & improved **?**
* Correlate graphs: queues, connections & channels
  * queue rebalancing
* Built-in thresholds: churn metrics
* Spot anti-patterns: polling operations
* Zoom in on interesting spikes or drops

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
