---
date: "2019-12-09T18:00:00Z"
title: Make Your System Observable
summary: This is what happened when RabbitMQ became more observable
authors: []
tags: []
categories: []
slides:
  # see available slides. options in layouts/slides/baseof.html
  height: 1080
  theme: solarized
  width: 1920
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

{{< slide class="hiviz-dark" background-video="/img/observable-systems/intro-20191206.mp4" background-video-loop="true" background-size="cover" >}}

# Make <br>[your system](#) <br>observable
<span class="menu-title">INTRO</span>

---

## RabbitMQ Core Engineer
<span class="menu-title">Gerhard Lazu</span>

<img src="/img/observable-systems/gerhard.png" height="600">

## <i class="fab fa-twitter"></i> <a href="https://twitter.com/gerhardlazu" target="_blank">gerhardlazu</a> &nbsp; <i class="fab fa-github"></i> <a href="https://github.com/gerhard" target="_blank">gerhard</a>

---

# 😤 🤬 🤯
<span class="menu-title">Context</span>

---

{{< slide background-video="/img/observable-systems/rabbitmq-management-overview-dist-tls-stuck.mp4" background-video-loop="true" background-size="cover" >}}
# 😤
<span class="menu-title">Peakaboo! 😤</span>

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
<span class="menu-title">Make me understand</span>

---

<span class="menu-title">Make it scale</span>
# 😤 🤬 🤯
<br>
## 😤 🤬 🤯
<br>
### 😤 🤬 🤯
<br>
#### 😤 🤬 🤯

---

{{< slide class="hiviz-dark" background-color="#161719">}}
<span class="menu-title">WHERE SHOULD I BEGIN?</span>

What is RabbitMQ?

# [WHERE SHOULD I BEGIN?](#)

**What is most important?**

**Why does this matter?**

**When am I done?**

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
# [You are in](#) <br>the game

---

{{< slide class="hiviz-dark" background="url(/img/observable-systems/same-metrics-different-contexts.png) 50% 50% / cover no-repeat" >}}
<span class="menu-title">We started by...</span>

# We started by <br>[understanding <br>user issues](#)

---

## We continued by [providing a better way to talk about issues](#)
<span class="menu-title">We continued by...</span>

<img data-src="/img/observable-systems/erlang-distribution-2291.png" />

---

{{< slide background="url(/img/observable-systems/red_crayon.jpg) 50% 50% / cover no-repeat" >}}
## You may want to start with...
<br><br>
# LETS [USE](#) RED

---

# [Or maybe](#) a Saas?

* Datadog / New Relic / Dynatrace
* Honeycomb / LighStep / Wavefront
* etc.

---

# [Do what works for you](#)
<br>
## Only you know what that is

---

{{< slide class="hiviz-dark" background-color="#161719">}}

<span class="menu-title">WHAT IS MOST IMPORTANT?</span>

What is RabbitMQ?

Where should I begin?

# [WHAT IS MOST IMPORTANT?](#)

**Why does it matter?**

**When am I done?**
