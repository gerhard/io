---
date: "2020-10-31T12:00:00Z"
title: How to monitor RabbitMQ?
summary: You have a few RabbitMQ deployments. How do you monitor them?

abstract: |
  You have a few RabbitMQ deployments. How do you monitor them?

  You have heard of the [Grafana dashboards that team RabbitMQ maintains](https://grafana.com/orgs/rabbitmq),
  maybe from this [RabbitMQ Summit 2019 talk](https://www.youtube.com/watch?v=L-tYXpirbpA) or from the official [Monitoring with Prometheus & Grafana](https://www.rabbitmq.com/prometheus.html) guide.
  But how do you actually set them up?

  And what about the default metrics configuration? Can this be improved?

  For speed and convenience, we set up K3S on a Linux host ([we had some Equinix Metal credits](https://info.equinixmetal.com/changelog) that we put to good use) and then:

  * We integrate Prometheus & Grafana with K3S, all running inside K3S.
  * We set up RabbitMQ Grafana dashboards & deploy the RabbitMQ Cluster Operator, which makes deploying RabbitMQ on K8S as easy as it gets.
  * We deploy a few RabbitMQ workloads and look at their behaviour via Grafana, paying special attention to memory pressure coming from the metrics system.

  If your RabbitMQ nodes run many queues, channels & connections and you are using the default metrics configuration, this will help you understand how to optimise that.

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

url_code: https://github.com/rabbitmq/tgir/tree/S01E07/s01/e07
url_pdf:
url_slides:
url_video: https://www.youtube.com/watch?v=NWISW6AwpOE

slides:

---
