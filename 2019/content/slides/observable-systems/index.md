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
  # https://github.com/hakimel/reveal.js/
  # https://developer.mozilla.org/en-US/docs/Web/CSS/background
---

{{< slide class="hiviz-dark" background-video="/img/observable-systems/intro.mp4" background-video-loop="true" background-size="cover" >}}

# Make [your system](#) observable
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
<span class="menu-title">Peakaboo!</span>

---

# [What is](#) RabbitMQ?
<br>
## It's not what you think you know

---

{{< slide class="hiviz-light" background="url(/img/observable-systems/rabbitmq-is-actually-this.png) 50% 50% / 75% no-repeat" >}}

# Many [distributed sets of apps](#)

---

{{< slide class="hiviz-light" background="url(/img/observable-systems/rabbitmq-is-actually-this.png) 50% 50% / 75% no-repeat" >}}

# Many [distributed sets of apps](#)
# With shared & non-shared [state](#)
<span class="menu-title">With shared & non-shared state</span>

---

{{< slide class="hiviz-light" background="url(/img/observable-systems/rabbitmq-is-actually-this.png) 50% 50% / 75% no-repeat" >}}

# Many [distributed sets of apps](#)
# With shared & non-shared [state](#)
# That is continuously [changing](#)
<span class="menu-title">That is continuously changing</span>

---

{{< slide class="hiviz-light" background="url(/img/observable-systems/rabbitmq-is-actually-this.png) 50% 50% / 75% no-repeat" >}}

# Many [distributed sets of apps](#)
# With shared & non-shared [state](#)
# That is continuously [changing](#)
# Running as a [complete graph](#)
<span class="menu-title">Running as a complete graph</span>

---

{{< slide class="hiviz-light" background="url(/img/observable-systems/rabbitmq-is-actually-this.png) 50% 50% / 75% no-repeat" >}}

# Many [distributed sets of apps](#)
# With shared & non-shared [state](#)
# That is continuously [changing](#)
# Running as a [complete graph](#)
# On a [hyper-scalable runtime](#)
<span class="menu-title">On a hyper-scalable runtime</span>

---

# Great, but I don't care
<br>
# [Why is the page not loading?](#)

---

{{< slide background-video="/img/observable-systems/erlang-distribution-pressure-dist-tls.mp4" background-size="cover" >}}
<span class="menu-title">Make me care</span>
