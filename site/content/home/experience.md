+++
# Experience widget.
widget = "experience"  # See https://sourcethemes.com/academic/docs/page-builder/
headless = true  # This file represents a page section.
active = true  # Activate this widget? true/false
weight = 30  # Order that this section will appear.

title = "Experience"
subtitle = ""

# Date format for experience
#   Refer to https://sourcethemes.com/academic/docs/customization/#date-format
date_format = "2006"

# Experiences.
#   Add/remove as many `[[experience]]` blocks below as you like.
#   Required fields are `title`, `company`, and `date_start`.
#   Leave `date_end` empty if it's your current employer.
#   Begin/end multi-line descriptions with 3 quotes `"""`.

[[experience]]
  title = "Staff Software Engineer"
  company = "VMware"
  company_url = "https://www.vmware.com/"
  location = ""
  date_start = "2020-04-06"
  date_end = ""
  description = """
* Shipped [Tanzu RabbitMQ](https://rabbitmq.com/tanzu), the commercial edition of RabbitMQ<br>
* Championed the [monorepo](https://github.com/rabbitmq/rabbitmq-server) as an alternative to 44 repositories, one per plugin
* Invested in Basecamp to improve remote work & have healthier conversations
* Created [TGIR](https://www.youtube.com/playlist?list=PLfX-LA-Cf6rE16woOuRmi3goM_K8PUAhQ), a semi-regular video series on RabbitMQ<br>
* Battle-hardened RabbitMQ on Kubernetes <br>
* **Erlang, RabbitMQ, Prometheus, Grafana, Kubernetes, AWS, Azure & GCP**<br>
  """

[[experience]]
  title = "Tech Lead"
  company = "Changelog"
  company_url = "https://www.changelog.com/"
  location = ""
  date_start = "2016-07-04"
  date_end = ""
  description = """
* [Running in Production #63](https://runninginproduction.com/podcast/63-changelog-is-a-news-and-podcast-platform-for-developers) <br>
* New changelog.com setup for 2020: [Blog post](https://changelog.com/posts/the-new-changelog-setup-for-2020) + [Episode #419](https://changelog.com/podcast/419) <br>
* New changelog.com setup for 2019: [Blog post](https://changelog.com/posts/the-new-changelog-setup-for-2019) + [Episode #344](https://changelog.com/podcast/344) <br>
* [Open-sourced the code behind changelog.com infrastructure](https://changelog.com/posts/the-code-behind-changelog-infrastructure) <br>
* Set up the initial changelog.com infrastructure: [Episode #254](https://changelog.com/podcast/254) <br>
* **Elixir, PostgreSQL, Prometheus, Grafana, Loki, Kubernetes, Terraform & Linode** <br>
  """

[[experience]]
  title = "Principal Software Engineer"
  company = "Pivotal"
  company_url = "https://www.pivotal.io/"
  location = ""
  date_start = "2015-12-21"
  date_end = "2020-04-06"
  description = """
* [Acquired by VMware](https://blogs.vmware.com/cloudnative/2019/08/22/transforming-software-on-kubernetes/) <br>
* Contributed observability to RabbitMQ via [Prometheus &amp; Grafana](https://next.rabbitmq.com/prometheus.html) <br>
* Set up long-term RabbitMQ observability <br>
* Captured [baselines for various RabbitMQ workloads](https://github.com/rabbitmq/workloads) <br>
* Helped put together the [RabbitMQ continuous delivery system](https://ci.rabbitmq.com) <br>
* Ensured that [the RabbitMQ continuous delivery system is observable](https://metrics.ci.rabbitmq.com/d/000000001/concourse?refresh=5m&orgId=1&from=now%2Fd&to=now) <br>
* [Made RabbitMQ count memory correctly](https://github.com/rabbitmq/rabbitmq-server/issues/1223) <br>
* [Optimised Erlang VM memory allocators for RabbitMQ](https://groups.google.com/forum/#!msg/rabbitmq-users/LSYaac9frYw/LNZDZUlrBAAJ) <br>
* Improved Erlang [ERL-430](https://bugs.erlang.org/browse/ERL-430), [ERL-448](https://bugs.erlang.org/browse/ERL-448), [ERL-959](https://bugs.erlang.org/browse/ERL-959) &amp; [PR #2270](https://github.com/erlang/otp/pull/2270) <br>
* Helped Pivotal enterprise customers succeed with RabbitMQ <br>
* **Erlang, RabbitMQ, Concourse, BOSH, vSphere, AWS & GCP** <br>
  """

[[experience]]
  title = "CloudFoundry & BOSH Consultant"
  company = "CloudCredo"
  company_url = "http://www.cloudcredo.com/"
  location = ""
  date_start = "2014-09-15"
  date_end = "2015-12-21"
  description = """
* [Acquired by Pivotal](http://pivotal.io/platform/press-release/pivotal-bolsters-its-cloud-native-platform-team-with-acquisition-of-cloudcredo) <br>
* Anchored the first [IBM Bluemix Garage in Europe](http://garage.mybluemix.net/) <br>
* Contributed to [Comic Relief 2015](https://cfsummiteu2015.sched.org/event/532d88570fd1a394d599d113f1c5131b#.VkP2866rRTY) via the CloudCredo Platform <br>
* Helped deliver the CloudCredo Platform <br>
* Was part of the team that kicked off [Pivotal Cloud Foundry Services](https://network.pivotal.io/) <br>
* **Ruby, Golang, Concourse, CloudFoundry, BOSH & vSphere** <br>
  """

[[experience]]
  title = "Ruby Consultant"
  company = "FreeAgent"
  company_url = "https://www.freeagent.com/"
  location = ""
  date_start = "2014-06-15"
  date_end = "2014-09-15"
  description = """
* Built the SOA foundation for de-composing a mighty Rails monolith <br>
* Used RabbitMQ for event distribution & Elasticsearch for indexing <br>
* Proposed Fluentd as an alternative to Not Invented Here (NIH) <br>
*  **Ruby on Rails, RabbitMQ, Elasticsearch** <br>
  """

[[experience]]
  title = "Lead Engineer"
  company = "How Are You?"
  company_url = "https://blog.howareyou.com/"
  location = ""
  date_start = "2012-06-15"
  date_end = "2014-06-15"
  description = """
* Hired & lead the entire technical team <br>
* De-composed a Rails monolith into many microservices <br>
* Set up all infrastructure on AWS with Chef ([OSS cookbooks](https://github.com/gchef)) <br>
* Set up continuous deployment with Jenkins <br>
* Blogged about [using Jenkins with Docker for continuous deployment](http://blog.howareyou.com/post/65048170054/continuous-delivery-with-docker-and-jenkins-part) <br>
* **Ruby, MySQL, Redis, Jenkins, Chef & AWS** <br>
  """

[[experience]]
  title = "Senior Software Engineer"
  company = "GoSquared"
  company_url = "https://www.gosquared.com/"
  location = ""
  date_start = "2011-06-15"
  date_end = "2012-06-15"
  description = """
* Built a dozen Ruby microservices, mostly in EventMachine/Goliath <br>
* Set up and configured Graphite as the primary analytics data store <br>
* Managed a hybrid infrastructure with Chef ([OSS cookbooks](https://github.com/gchef])) <br>
* Created a better alternative to Capistrano, [deliver](https://github.com/gerhard/deliver) <br>
* Inspired the Elixir & Erlang deployment tool [edeliver](https://github.com/boldpoker/edeliver) <br>
* [Mitigated a botnet attack with awk + iptables](https://www.gosquared.com/blog/how-to-stop-a-botnet-attack) <br>
* **Ruby, node.js, MySQL, Redis, Graphite, RabbitMQ, Chef & AWS** <br>
  """

[[experience]]
  title = "Software Engineer"
  company = "Paper Cavalier"
  company_url = "https://www.papercavalier.com/"
  location = ""
  date_start = "2010-06-15"
  date_end = "2011-06-15"
  description = """
* Rewrote an Amazon arbitrage engine from PHP to Ruby <br>
* Kept ~350mil Amazon book offers in sync with Amazon API limits <br>
* Managed a hybrid infrastructure with [gchef](https://github.com/gchef) <br>
* Blogged about [knife integration with AWS](http://gerhardlazu.com.s3-website-eu-west-1.amazonaws.com/2010/08/using-chef-to-manage-amazon-ec2-instances-part2/) <br>
* **Ruby, EventMachine, PostgreSQL, MongoDB, Redis, Chef & AWS** <br>
  """

[[experience]]
  title = "Front-end Developer"
  company = "1 Click 2 Fame"
  company_url = ""
  location = ""
  date_start = "2009-06-15"
  date_end = "2010-06-15"
  description = """
* Took ownership of the JS & CSS for the main Merb app <br>
* Wrote my first JS unit tests in the framework that inspired mocha <br>
* Built an iTunes carousel clone in plain JS and CSS <br>
* Promoted CSS 3 transformations and animations <br>
* **HTML, CSS, Prototype.js, Merb, MySQL, Capistrano** <br>
  """

[[experience]]
  title = "Ruby-on-Rails Developer"
  company = "Jobsgopublic"
  company_url = ""
  location = ""
  date_start = "2008-06-15"
  date_end = "2009-06-15"
  description = """
* Worked on one of the busiest Ruby on Rails sites of its time <br>
* Solved all memory leaks by migrating from Mongrel to Passenger <br>
* Set up zero-downtime deployments <br>
* **HTML, CSS, Prototype.js, Ruby on Rails, MySQL, Capistrano** <br>
  """

[[experience]]
  title = "Front-end Developer"
  company = "Ultraspeed Group"
  company_url = ""
  location = ""
  date_start = "2007-06-15"
  date_end = "2008-06-15"
  description = """
* Designed and developed websites for various departments <br>
* Worked on the in-house PHP & MySQL customer portal <br>
* Migrated customer portal to Ruby on Rails <br>
* **HTML, CSS, jQuery, Zend, Ruby on Rails, MySQL, cPanel** <br>
  """

[[experience]]
  title = "Front-end & Back-end Developer"
  company = "Freelancer"
  company_url = ""
  location = ""
  date_start = "2003-06-15"
  date_end = "2007-06-15"
  description = """
* Promoted the use of CSS on Hayes & Finch microsites <br>
* Spearheaded AJAX in plain Javascript - a revoluion at the time <br>
* Wrote PHP 4 &amp; MySQL 3 with no frameworks, not even Zend <br>
* [Developed one of the most popular Textpattern plugins](https://forum.textpattern.com/viewtopic.php?id=23996) <br>
* I still do web hosting for websites that I have built in early 2000s <br>
* **HTML, CSS, JS, PHP, MySQL, Textpattern, Plesk** <br>
  """

+++
