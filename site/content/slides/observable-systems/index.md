---
date: "2019-12-09T18:00:00Z"
title: Make Your System Observable
summary: This is what happened when RabbitMQ became more observable
footer:
  left: gerhard.io
  right: Make Your System Observable, LRUG, 2019-12-09
authors: []
tags: []
categories: []
slides:
  # see available slides. options in layouts/slides/baseof.html
  height: 1080
  theme: solarized
  width: 1920
  style: |
    body {
      background: #FFF;
      background-color: #FFF;
    }
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

{{< slide class="hiviz-dark" background-video="/img/observable-systems/intro-20191206.mp4" background-video-loop="true" background-size="cover" >}}

# Make <br>[your system](#) <br>observable
<span class="menu-title">INTRO</span>

---

## RabbitMQ Core Engineer
<span class="menu-title">Gerhard Lazu</span>

<img src="/img/observable-systems/gerhard.png" height="600">

## <i class="fab fa-twitter"></i> <a href="https://twitter.com/gerhardlazu" target="_blank">gerhardlazu</a> &nbsp; <i class="fab fa-github"></i> <a href="https://github.com/gerhard" target="_blank">gerhard</a>

---

{{< slide class="hiviz-light" background="url(/img/observable-systems/rabbitmq-management-overview-dist-tls.png) 50% 50% / cover no-repeat" >}}

# 😤 🤬 🤯
<span class="menu-title">Context</span>

---

{{< slide background-video="/img/observable-systems/rabbitmq-management-overview-dist-tls-stuck.mp4" background-video-loop="true" background-size="cover" >}}
# 😤
<span class="menu-title">Peekaboo! 😤</span>

---

# [WHAT IS](#) RABBITMQ?
<br>
## It's not what you think

---

{{< slide class="hiviz-light" background="url(/img/observable-systems/rabbitmq-is-actually-this.png) 50% 50% / 75% no-repeat" >}}

# [Many distributed sets of apps](#)

---

{{< slide class="hiviz-light" background="url(/img/observable-systems/rabbitmq-is-actually-this.png) 50% 50% / 75% no-repeat" >}}

# [Many distributed sets of apps](#)
# With shared & non-shared state
<span class="menu-title">Shared & non-shared state</span>

---

{{< slide class="hiviz-light" background="url(/img/observable-systems/rabbitmq-is-actually-this.png) 50% 50% / 75% no-repeat" >}}

# [Many distributed sets of apps](#)
# With shared & non-shared state
# That is continuously flowing
<span class="menu-title">That is continuously flowing</span>

---

{{< slide class="hiviz-light" background="url(/img/observable-systems/rabbitmq-is-actually-this.png) 50% 50% / 75% no-repeat" >}}

# [Many distributed sets of apps](#)
# With shared & non-shared state
# That is continuously flowing
# [In a complete graph cluster](#)
<span class="menu-title">In a complete graph cluster</span>

---

{{< slide class="hiviz-light" background="url(/img/observable-systems/rabbitmq-is-actually-this.png) 50% 50% / 75% no-repeat" >}}

# [Many distributed sets of apps](#)
# With shared & non-shared state
# That is continuously flowing
# [In a complete graph cluster](#)
# [Which is adapting to the cloud](#)
<span class="menu-title">Which is adapting to the cloud</span>

---

{{< slide class="hiviz-light" background="url(/img/observable-systems/rabbitmq-is-actually-this.png) 50% 50% / 75% no-repeat" >}}
# Not born, <br>[adapted](#)

---

# Great, but I don't 🤬 care
<br>
# [Why is the page not loading?](#)

---

{{< slide background-video="/img/observable-systems/erlang-distribution-pressure-dist-tls.mp4" background-size="cover" >}}
# 🤯
<span class="menu-title">Make me understand 🤯</span>

---

<span class="menu-title">Make it scale</span>
# 😤 🤬 🤯
<br>
## 😤 🤬 🤯
<br>
### 😤 🤬 🤯

---

# How does this relate to [my Ruby](#)?
<span class="menu-title">How does this relate?</span>

| ERLANG                             | RUBY                               |
| --------                           | -----------                        |
| Message passing                    | Message passing                    |
| [Processes](#) respond to messages | [Objects](#) respond to messages   |
| Love-hate relationship with memory | Love-hate relationship with memory |
| [Phoenix](#) web framework         | [Rails](#) web framework           |
| @michaelklishin                    | @michaelklishin                    |

---

{{< slide class="hiviz-light" background="url(/img/observable-systems/cncf-2019-12.png) 50% 50% / cover no-repeat" >}}

# Expected to [run well in](#) ~~the cloud~~ [K8S](#)
<span class="menu-title">The great UNIFIER</span>
<br>
## [Or at least explain, understand & improve](#)

---

{{< slide class="hiviz-dark" background-color="#161719">}}
<span class="menu-title">WHERE SHOULD I BEGIN?</span>

What is RabbitMQ?

# [WHERE SHOULD I BEGIN?](#)

**What is most important?**

**Why does this matter?**

---

# 1/2 [Expose metrics](#)
<img data-src="/img/observable-systems/prometheus.png" />

---

{{< slide background-color="#161719">}}
<span class="menu-title">Choose standards</span>

# [Choose standards](#), not products

<img data-src="/img/observable-systems/openmetrics.png" />

---

# 2/2 [Visualize metrics](#)
<img data-src="/img/observable-systems/grafana.png" />

---

{{< slide class="hiviz-dark" background-video="/img/observable-systems/intro-20191206.mp4" background-video-loop="true" background-size="cover" >}}
# Et voilá!

---

{{< slide class="hiviz-dark" background="url(/img/observable-systems/we-started-by-visualising-memory.png) 50% 50% / cover no-repeat" >}}

# We [started](#) by

---

{{< slide class="hiviz-dark" background="url(/img/observable-systems/same-metrics-different-contexts.png) 50% 50% / cover no-repeat" >}}

# We [continued](#) by

---

{{< slide class="hiviz-dark" background="url(/img/observable-systems/rabbitmq-summit-2019-jack-vanlightly.png) 50% 50% / cover no-repeat" >}}

# We [are](#) now

---

# Because [sharing is caring](#)

<img data-src="/img/observable-systems/grafana-rabbitmq-org-2019-12.png" />

---

# Other [alternatives](#)

* New Relic / Datadog / Dynatrace / Grafana E.
* LighStep / Honeycomb / Wavefront
* etc.

---

# [Do what works for you](#)
<br>
## Only you can answer this

---

{{< slide class="hiviz-dark" background-color="#161719">}}

<span class="menu-title">WHAT IS IMPORTANT?</span>

What is RabbitMQ?

Where should I begin?

# [WHAT IS MOST IMPORTANT?](#)

**Why does this matter?**

---

# [Focus on the story](#) that you are telling
<span class="menu-title">Focus on the story</span>

* What questions are you answering?
* Which part of the system are you describing?
* What is the correlation between various elements shown?

---

# Let me share [a story about memory](#)
<span class="menu-title">Let me share a story</span>

---

# Out of [1,000 issues](#)

<img data-src="/img/observable-systems/rabbitmq-server-issues.png" />

---

# [200 are](#) about [memory](#)

<img data-src="/img/observable-systems/rabbitmq-server-memory-issues.png" />

---

# Start by [counting the right memory](#)
<span class="menu-title">So counting the right memory</span>

<img data-src="/img/observable-systems/rabbitmq-server-1223.png" />

---

# Improve [memory allocators defaults](#)
<span class="menu-title">and better mem_alloc defaults</span>

<img data-src="/img/observable-systems/rabbitmq-users-better-erlang-mem-alloc-defaults.png" />

---

{{< slide background-video="/img/observable-systems/erlang-memory-allocators-part-1.mp4" background-size="cover" >}}
<span class="menu-title">and easy concepts</span>

---

{{< slide background-video="/img/observable-systems/erlang-memory-allocators-part-2.mp4" background-size="cover" >}}
<span class="menu-title">that are well-correlated</span>

---

{{< slide background-video="/img/observable-systems/erlang-memory-allocators-part-3.mp4" background-size="cover" >}}
<span class="menu-title">at the right level</span>

---

{{< slide background-video="/img/observable-systems/erlang-memory-allocators-part-4.mp4" background-size="cover" >}}
<span class="menu-title">made improving easy</span>

---

# [Make it easy to improve,](#) <br>so that improving is easy, <br>[and so that anyone can do it](#)
<span class="menu-title">Make it easy to improve</span>

---

{{< slide class="hiviz-dark" background-color="#161719">}}

<span class="menu-title">WHY DOES THIS MATTER?</span>

What is RabbitMQ?

Where should I begin?

What is most important?

# [WHY DOES THIS MATTER?](#)

---

# An increasing number of people <br>[depend on the software](#) <br>that you develop.
<span class="menu-title">People depend on it</span>

---

# [Make it understandable](#), <br>simple to work with, <br>[and predictable](#).
<span class="menu-title">People appreciate simple</span>

---

# [Software is means to an end](#), <br>it's not an end in itself.
<span class="menu-title">It's means to an end</span>

---

{{< slide class="hiviz-light" background="url(/img/observable-systems/cncf-2019-12.png) 50% 50% / cover no-repeat" >}}
<span class="menu-title">Look around...</span>

---

# [You are not alone, first or last.](#) <br>Learn from others, and pass it on, <br>like I am doing now.
<span class="menu-title">Learn from others & pass it on</span>

---

{{< slide class="hiviz-dark" background="url(/img/observable-systems/concourse-complex-pipeline.png) 50% 50% / cover no-repeat" >}}

# That's what makes nice things

---

{{< slide class="hiviz-dark" background="url(/img/observable-systems/concourse-dashboard-2019-12.png) 50% 40% / 110% no-repeat" >}}

# And builds healthy ecosystems

---

{{< slide class="hiviz-dark" background-video="/img/observable-systems/rabbitmq-prometheus-local-part-1.mp4" background-size="cover" >}}
<span class="menu-title">Download it</span>

---

{{< slide class="hiviz-dark" background-video="/img/observable-systems/rabbitmq-prometheus-local-part-2.mp4" background-size="cover" >}}
<span class="menu-title">Look at it</span>

---

{{< slide class="hiviz-dark" background-video="/img/observable-systems/rabbitmq-prometheus-local-part-3.mp4" background-size="cover" >}}
<span class="menu-title">Read about it</span>

---

{{< slide class="hiviz-dark" background-video="/img/observable-systems/rabbitmq-prometheus-local-part-4.mp4" background-size="cover" >}}
<span class="menu-title">Understand it</span>

---

{{< slide class="hiviz-dark" background-video="/img/observable-systems/rabbitmq-prometheus-local-part-5.mp4" background-size="cover" >}}
<span class="menu-title">Explore further</span>

---

# Maybe learn more [this coming Thursday](https://content.pivotal.io/webinars/dec-12-understand-rabbitmq-for-developers-and-operators-webinar?utm_campaign=rabbitmq-devops-erlang_q419&utm_source=gerhard&utm_medium=social)
<span class="menu-title">And maybe learn more</span>

<img data-src="/img/observable-systems/understand-rabbitmq-webinar-2019-12-12.png" />

---

{{< slide class="hiviz-dark" background-color="#161719">}}

# Four [other versions of this talk](#)

<img data-src="/img/observable-systems/talk-journey-2019-12.png" />
