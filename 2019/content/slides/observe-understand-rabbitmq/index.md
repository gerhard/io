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

---

# Why is it important?

---

# How did we use to observe?

* `rabbitmq-management`
* JSON API
* scatter-gather all nodes

---

# But it didn't always work

* Metrics availability when the cluster is under pressure or the node goes away
* API requests taking a really long time - show request timing in Chrome Network

---

# Why did it stop working?

* Erlang Distribution links data buffers - OTP-15905 in v22.1
* Use Management just for management - no inter-node dependency
* But if there are no metrics in Management, where do we look?

---

# We needed a rethink

* Improving what we had was not enough
* We had to pick our battles, and focus on the questions
* **How could we tell a better story?**

> If I had asked people what they wanted, <br>
> they would have said faster horses. <br>
> Henry Ford

---

# How are we observing in 3.8?

* Do the simplest thing - only expose node local metrics
* Expose more metrics - Raft / Mnesia / Erlang
* Metrics history no longer dependent on RabbitMQ
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

* Helpful context for all graphs
* Correlate graphs: queues, connections & channels
  * queue rebalancing
* Built-in thresholds: churn metrics
* Spot anti-patterns: polling operations
* Zoom in on interesting spikes or drops

> This is just a bridge from RabbitMQ Management into the new world...

---

<span class="menu-title">But this looks too complex...</span>

# [L](#)atency
# [E](#)rrors
# [T](#)raffic
# [S](#)aturation

[The Four Golden Signals](https://landing.google.com/sre/sre-book/chapters/monitoring-distributed-systems/#xref_monitoring_golden-signals)
