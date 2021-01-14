---
title: Make Your System Observable
summary: Why should you? What to expect? Where to begin?
authors: []
tags: []
categories: []
date: "2019-07-25T18:30:00Z"
slides:
  # see available slides. options in layouts/slides/baseof.html
  height: 1080
  theme: solarized
  width: 1920
---

# [Make](#)<br><br>

## your system<br><br>

# [observable](#)
<span class="menu-title">WHY ARE WE HERE?</span>

<img data-src="/img/observable-systems/overview-rmq-38-gcp-qq.png" />

{{< speaker_note >}}
What experience/context is this talk based on?

Why is it worth listening to this?

Why am I givig this talk?
{{< /speaker_note >}}

---

# [Ask](#) questions
<br>
## <a href="https://twitter.com/gerhardlazu" target="_blank">📷 gerhardlazu <i class="fab fa-twitter-square"></i></a>
<span class="menu-title">Ask, take pictures & share</span>

{{< speaker_note >}}
How do I want you to behave during the talk?
{{< /speaker_note >}}

---

{{< slide background="url(/img/observable-systems/talk-journey.png) 50% -5% / 65% no-repeat" >}}

<span class="menu-title">Follow the journey</span>

{{< speaker_note >}}
What journey will this talk be taking?

Can I refer back to the slides?
{{< /speaker_note >}}

---

{{< slide background="#FFF url(/img/observable-systems/cloud-computing.gif) 50% -50% no-repeat" >}}

# [WHAT IS](#) OBSERVABILITY?

---

{{< slide background="url(/img/observable-systems/overview-rmq-38-gcp-qq.png) 50% 0% / cover no-repeat" >}}

<span class="menu-title">In One Picture</span>

{{< speaker_note >}}
What does this tell you about the system?

This captures what we, the RabbitMQ team, call a Long-Running Environment

This is publicly accessible
{{< /speaker_note >}}

---

# The Key
<br>
### Health Checks
<br>
## [Metrics](#)
<br>
### Events
<br>
### Traces

{{< speaker_note >}}
What does this word arrangement make you think of?

Events can be logged

Exceptions are a type of event

They can be captured in metrics as well

Health checks help with lifecycle, such as upgrades, scale outs, etc.
{{< /speaker_note >}}

---

# This happened when
<br>
## [RabbitMQ became](#) more [observable](#)
<span class="menu-title">OBSERVABILITY BENEFITS</span>

---

# We [explained](#) concepts easier

<img data-src="/img/observable-systems/erlang-distribution.png" />

---

# You were quick to [understand](#)

<img data-src="/img/observable-systems/connections-closed.png" />

---

# You [noticed](#) issues instantly

<img data-src="/img/observable-systems/unroutable-messages-dropped.png" />

---

# ~~RTFM~~ You [read](#) the docs

<img data-src="/img/observable-systems/memory-rtfm.png" />

---

# We [collaborated](#) more

<img data-src="/img/observable-systems/quorum-queues.png" />

---

# We [inspired](#) others to improve

<img data-src="/img/observable-systems/erlang-distribution-2291.png" />

---

# All this [before GA](#)

<img data-src="/img/observable-systems/versions.png" />

---

{{< slide background="url(/img/observable-systems/rabbitmq-prometheus.png) 50% -5% / 80% no-repeat" >}}
<span class="menu-title">Try it</span>

---

# You can [take small steps](#)
<br>
## and [see benefits](#) too

---

# 1/2 &nbsp; [Expose metrics](#)

<img data-src="/img/observable-systems/prometheus-cncf.png" />

{{< speaker_note >}}
Why should you use Prometheus?
{{< /speaker_note >}}

---

# 2/2 &nbsp; [Visualise metrics](#)

<video data-autoplay src="https://grafana.com/video/grafanatour.mp4"></video>

---

## If this feels too low-level
<br>
# Then [do this](#)
<span class="menu-title">If this feels too low-level</span>

---

{{< slide background="url(/img/observable-systems/concourse-dashboard.png) 50% 100% / cover no-repeat" >}}
<span class="menu-title">Then do this</span>

---

# [See](#) value flow

<img data-src="/img/observable-systems/ci-rabbitmq-38.png" />

---

# [Visualise](#) value blockages

<img data-src="/img/observable-systems/pipelineuptime.png" />

---

# [See](#) your Concourse

<img data-src="/img/observable-systems/concourse-metrics.png" />

---

# [Help](#) improve Concourse

<img data-src="/img/observable-systems/concourse-4150.png" />

---

# [WHAT IS](#) OBSERVABILITY?

---

{{< slide class="hiviz-light" background="url(/img/observable-systems/cncf.png) 50% 0% / cover no-repeat" >}}

# Observability is [Highly Relevant](#)
<span class="menu-title">Highly Relevant</span>

{{< speaker_note >}}
The complexity that comes with your container scheduler of choice is going to crush all your hopes and dreams if you don't pay attention.
{{< /speaker_note >}}

---

{{< slide class="hiviz-dark" background="url(/img/observable-systems/infinite-game.jpg) 100% 0% / 56% no-repeat" >}}

# Observability is
<span class="menu-title">An Infinite Game</span>

---

# Observability [Makes Everything Better](#)
<span class="menu-title">Makes Everything Better</span>

---
<section data-background-iframe="https://docs.google.com/forms/d/e/1FAIpQLSfVRyNzZpMnqsOu7f1zDMY-FukgH_3hLsAaLUfwpgcKHYgvCA/viewform?embedded=true" data-background-interactive>
  <span class="menu-title">MAKE THIS TALK BETTER</span>
</section>

---

# ONE MORE THING[...](https://content.pivotal.io/blog/introducing-rabbitmq-for-kubernetes)

---

{{< slide background="url(/img/observable-systems/rabbitmq-for-k8s.png) 50% -5% / 80% no-repeat" >}}
<span class="menu-title">RabbitMQ for K8S</span>
