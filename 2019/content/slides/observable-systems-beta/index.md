---
title: Make Your System Observable
summary: Why should you? What to expect? Where to begin?
authors: []
tags: []
categories: []
date: "2019-09-11T17:30:00Z"
slides:
  # see available slides. options in layouts/slides/baseof.html
  height: 1080
  theme: solarized
  width: 1920
  # https://github.com/hakimel/reveal.js/
  # https://developer.mozilla.org/en-US/docs/Web/CSS/background
---

{{< slide class="hiviz-dark" background="url(/img/observable-systems/exploded-engine.jpg) 50% no-repeat" >}}

# Make your system observable
<span class="menu-title">WHO? WHY?</span>

---

# [What is](#) RabbitMQ?

---

{{< slide background="url(/img/observable-systems/you-imagine-rabbitmq-as.png) 50% 50% / 100% no-repeat" >}}
<span class="menu-title">You imagine this</span>

---

{{< slide background="url(/img/observable-systems/rabbitmq-is-actually-this.png) 50% 50% / 75% no-repeat" >}}
<span class="menu-title">It is actually this</span>

---

{{< slide background="url(/img/observable-systems/rabbitmq-management-overview-dist-tls.png) 50% 50% / cover no-repeat" >}}
<span class="menu-title">But you see this</span>

---

{{< slide class="hiviz-light" background="url(/img/observable-systems/rabbitmq-management-overview-dist-tls.png) 50% 50% / cover no-repeat" >}}

# [WHAT IS](#) OBSERVABILITY?

---

{{< slide background-video="/img/observable-systems/rabbitmq-management-overview-dist-tls-stuck.mp4" background-video-loop="true" background-size="cover" >}}
<span class="menu-title">80/20 Observability</span>

---

{{< slide class="hiviz-light" background="url(/img/observable-systems/rabbitmq-management-overview-dist-tls.png) 50% 50% / cover no-repeat" >}}

# Can we [observe better](#)?

---

{{< slide background-video="/img/observable-systems/rabbitmq-overview-dist-tls.mp4" background-size="cover" >}}
<span class="menu-title">Yes, but it doesn't always help</span>

---

{{< slide class="hiviz-light" background="url(/img/observable-systems/rabbitmq-is-actually-this.png) 50% 50% / 75% no-repeat" >}}

# [What](#) are we missing?

---

{{< slide background-video="/img/observable-systems/erlang-distribution-pressure-dist-tls.mp4" background-size="cover" >}}
<span class="menu-title">Observe Erlang Distribution</span>

---

{{< slide background-video="/img/observable-systems/rabbitmq-prometheus-quick-start.mp4" background-size="cover" >}}
<span class="menu-title">Try it</span>

---

# WHAT HAPPENED [NEXT](#)?

---

{{< slide class="hiviz-light" background="url(/img/observable-systems/rabbitmq-is-actually-this.png) 50% 50% / 75% no-repeat" >}}

# Erlang [improvements](#)

---

{{< slide background="url(/img/observable-systems/erlang-distribution-link-limit-10KB.png) 50% 50% / cover no-repeat" >}}
<span class="menu-title">3.9Gbit/s @ 10KB</span>

---

{{< slide background="url(/img/observable-systems/erlang-distribution-link-limit-60KB.png) 50% 50% / cover no-repeat" >}}
<span class="menu-title">13.6Gbit/s @ 60KB</span>

---

{{< slide background-video="/img/observable-systems/erlang-distribution-stories.mp4" background-size="cover" >}}
<span class="menu-title">Every graph has a story</span>

---

{{< slide class="hiviz-light" background="url(/img/observable-systems/rabbitmq-management-overview.png) 50% 50% / cover no-repeat" >}}
# Tell [a better story](#)

---

{{< slide background-video="/img/observable-systems/rabbitmq-overview-dashboard.mp4" background-size="cover" >}}
<span class="menu-title">See metrics like never before</span>

---

{{< slide class="hiviz-light" background="url(/img/observable-systems/same-metrics-different-contexts.png) 50% 50% / cover no-repeat" >}}
<span class="menu-title">This is just the beginning</span>

---

### I DON'T RABBITMQ
<br>
# But I [CI](#)

---

{{< slide background="url(/img/observable-systems/concourse.png) 50% 50% / cover no-repeat" >}}
<span class="menu-title">A continuous thinger-doer</span>

---

{{< slide background-video="/img/observable-systems/concourse-simple-pipeline.mp4" background-video-loop="true" background-size="cover" >}}
<span class="menu-title">Simple value flow</span>

---

{{< slide background="url(/img/observable-systems/concourse-complex-pipeline.png) 50% 50% / cover no-repeat" >}}
<span class="menu-title">Complex value flow</span>

---

{{< slide background="url(/img/observable-systems/concourse-at-rabbitmq.png) 50% 50% / cover no-repeat" >}}
<span class="menu-title">Value flows</span>

---

{{< slide background="url(/img/observable-systems/pipelineuptime-2019-07-08.png) 50% 50% / cover no-repeat" >}}
<span class="menu-title">Visualise value flow blockages</span>

---

# [WHAT IS](#) OBSERVABILITY?

---

{{< slide class="hiviz-dark" background="url(/img/observable-systems/infinite-game.jpg) 100% 0% / 56% no-repeat" >}}

# Observability is
<span class="menu-title">An Infinite Game</span>

---

{{< slide class="hiviz-light" background="url(/img/observable-systems/cncf.png) 50% 0% / cover no-repeat" >}}

# Observability is [no longer optional](#)
<span class="menu-title">No Longer Optional</span>

---

{{< slide background-video="/img/observable-systems/talk-journey-beta.mp4" background-size="cover" >}}

<span class="menu-title">FOLLOW THE JOURNEY</span>

{{< speaker_note >}}
What journey will this talk be taking?

Can I refer back to the slides?
{{< /speaker_note >}}
