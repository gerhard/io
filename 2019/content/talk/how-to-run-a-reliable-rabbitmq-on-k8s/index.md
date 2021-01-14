---
date: "2020-09-30T12:00:00Z"
title: How to run a reliable RabbitMQ on K8S?
summary: With the RabbitMQ on K8S basics understood, it's time to deploy a RabbitMQ cluster and tackle more advanced topics.

abstract: |
  You have a single RabbitMQ node running on Kubernetes (K8S).
  [TGIR S01E05](https://github.com/rabbitmq/tgir/tree/S01E05/s01/e05) covered the getting started part well.
  [Deploying RabbitMQ to Kubernetes: What’s Involved?](https://www.rabbitmq.com/blog/2020/08/10/deploying-rabbitmq-to-kubernetes-whats-involved/) blog post added more detail.

  With the RabbitMQ on K8S basics understood, it's time to deploy a RabbitMQ cluster and tackle more advanced topics:

  1. What are good liveness & readiness probes?
  2. How to configure RabbitMQ for availability during RabbitMQ upgrades?
  3. How to configure RabbitMQ for availability during K8S upgrades?
  4. How to configure clients for handling a minority of RabbitMQ nodes becoming unavailable?
  5. What to expect when a majority of RabbitMQ nodes go away?
  6. What happens when all RabbitMQ nodes go away?

event: TGIR
event_url: https://tgi.rabbitmq.com
location: YouTube

image:
  caption:
  focal_point: Center

links:
- icon: twitter
  icon_pack: fab
  name: RabbitMQ
  url: https://twitter.com/RabbitMQ

url_code: https://github.com/rabbitmq/tgir/tree/S01E06/s01/e06
url_pdf:
url_slides:
url_video: https://www.youtube.com/watch?v=I02oKJlOnR4

slides:

---
