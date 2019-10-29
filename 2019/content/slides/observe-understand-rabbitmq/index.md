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

{{< speaker_note >}}
You are familiar with the empty Management UI...
{{< /speaker_note >}}

---

There are no metrics to understand what is happening

---

And even if you had the expected RabbitMQ metrics, <br>you still wouldn't understand what is happening

You need to have and look at <br>the Erlang Distribution metrics:

---

<span class="menu-title">I AM STARTING TO GET IT</span>

* ~~Intro~~
* ~~I do not understand~~
* **[I AM STARTING TO GET IT](#)**
* This is amazing!
* I had no idea that this even existed
* We are just getting started...

---

Let me show you how to get started

---

Let me explain the new RabbitMQ Overview to you

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

---

Erlang Distribution - Throughput
<br>

1. CQ
1. QQ

---

RabbitMQ Quorum Queue Raft
<br>

1. Log ops
1. Log op latency
1. Long logs

---

Share with Karl & Diana

---

Erlang Memory Allocators

Ask an Erlang expert

---

https://grafana.com/orgs/rabbitmq

---

<span class="menu-title">I HAD NO IDEA THIS EXISTED</span>

* ~~Intro~~
* ~~I do not understand~~
* ~~I am starting to get it~~
* ~~This is amazing!~~
* **[I HAD NO IDEA THAT THIS EVEN EXISTED](#)**
* We are just getting started...

---

`htop`

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

Queue state

---

Erlang Microstate Accounting

---

The problem with high cardinality

---

Logs / Events

---

A new Management UI?

---

<span class="menu-title">GL take-aways</span>

* GL wants you to remember...
* GL encourages you to think about...
* GL challenges you to imagine...
