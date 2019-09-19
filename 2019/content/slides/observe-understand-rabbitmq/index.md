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

# How did we use to observe before 3.8?
<span class="menu-title">How did we use to observe?</span>

* Metrics availability when the cluster is under pressure
* API requests taking a really long time - Chrome Network
* The best we could do at the time

---

# How are we observing now?

* Do the simplest thing in RabbitMQ - expose metrics - minimal pressure
* Expose more metrics - Raft / Mnesia / Erlang
* Delegate metrics storage & querying to a purpose-built system
* Metrics history no longer dependent on RabbitMQ
* Delegate visualisation to a purpose-built system

---

# How to enable the new metrics?

* `rabbitmq-plugins enable rabbitmq_prometheus`
* `curl localhost:15692/metrics`

---

# What happens next?

* Given there is a Prometheus & Grafana
* Prometheus scrapes RabbitMQ metrics periodically
* Grafana is connected to Prometheus
* Import Grafana dashboards (some are managed by us)
* Visualise RabbitMQ metrics stored in Prometheus via Grafana

> Refer to the new **Monitoring with Prometheus** guide

---

# The New RabbitMQ Overview
