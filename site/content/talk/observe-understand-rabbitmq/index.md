---
date: "2019-11-04T12:00:00Z"
title: Observe and Understand RabbitMQ
summary: Start having different conversations - the goal is to understand & improve
abstract: |
  RabbitMQ 3.8 ships observability features that make it easy to understand what happens in the different layers of this complex, distributed stateful system.

  We will share why what we had didn't work, how we went about rethinking our approach to metrics and the unexpected benefits that we have uncovered while on this journey.

  **Agenda**

  * RabbitMQ Management Limitations
  * New metrics system in RabbitMQ 3.8
  * Understand like never before
  * More CLI power to you
  * What happens next?

event: RabbitMQ Summit
event_url: https://rabbitmqsummit.com
location: London

image:
  caption:
  focal_point: Center

links:
  - icon: twitter
    icon_pack: fab
    name: RabbitMQSummit
    url: https://twitter.com/rabbitmqsummit

url_code: https://github.com/rabbitmq/rabbitmq-prometheus/tree/v3.8.0
url_pdf:
url_slides:
url_video: https://www.youtube.com/watch?v=L-tYXpirbpA

slides: observe-understand-rabbitmq

---

<!--

# FEEDBACK for MK

* Add PerfTest dashboard
* Clarify the first Grafana graph - axes, etc.
* Make it clearer that these are 3.8 features only
* Emphasize that everybody needs to upgrade to 3.8 - these features are not available in 3.7

* Mention that Mirrors & Slaves are used interchangeably - ask Michael
* Only mention Erlang-Memory-Allocators dashboard, do not go into any details

-->
