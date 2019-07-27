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
  title = "Go, Erlang, RMQ, CF, Concourse, BOSH, Kubernetes, GCP"
  company = "Pivotal"
  company_url = "https://www.pivotal.io/"
  location = ""
  date_start = "2016-11-15"
  date_end = ""
  description = """
* Contributed observability to RabbitMQ via [Prometheus &amp; Grafana](https://next.rabbitmq.com/prometheus.html) <br>
* Set up [long-term RabbitMQ observability](https://grafana.gcp.rabbitmq.com/d/Kn5xm-gZk/rabbitmq-overview?orgId=1) <br>
* Captured [baselines for various RabbitMQ workloads](https://github.com/rabbitmq/workloads) <br>
* Helped put together the [RabbitMQ continuous delivery system](https://ci.rabbitmq.com) <br>
* Ensured that [the RabbitMQ continuous delivery system is observable](https://metrics.ci.rabbitmq.com/d/000000001/concourse?refresh=5m&orgId=1&from=now%2Fd&to=now) <br>
* [Made RabbitMQ count memory correctly](https://github.com/rabbitmq/rabbitmq-server/issues/1223) <br>
* [Optimised Erlang VM memory allocators for RabbitMQ](https://groups.google.com/forum/#!msg/rabbitmq-users/LSYaac9frYw/LNZDZUlrBAAJ) <br>
* Improved Erlang [ERL-430](https://bugs.erlang.org/browse/ERL-430), [ERL-448](https://bugs.erlang.org/browse/ERL-448), [ERL-959](https://bugs.erlang.org/browse/ERL-959) &amp; [PR #2270](https://github.com/erlang/otp/pull/2270) <br>
* Helped Pivotal enterprise customers succeed with RabbitMQ <br>
  """

[[experience]]
  title = "Elixir, PostgreSQL, CircleCI, Docker, Terraform, Linode"
  company = "Changelog"
  company_url = "https://www.changelog.com/"
  location = ""
  date_start = "2016-07-04"
  date_end = ""
  description = """
* Revamped the entire changelog.com setup for 2019: [Blog post](https://changelog.com/posts/the-new-changelog-setup-for-2019) + [Episode #344](https://changelog.com/podcast/344) <br>
* [Open-sourced the code behind Changelog's infrastructure](https://changelog.com/posts/the-code-behind-changelog-infrastructure) <br>
* Set up the initial Changelog infrastructure in 2016: [Episode #254](https://changelog.com/podcast/254) <br>
  """

[[experience]]
  title = "Ruby, Go, Cassandra, RMQ, CF, BOSH, AWS"
  company = "Pivotal"
  company_url = "https://www.pivotal.io/"
  location = ""
  date_start = "2015-12-21"
  date_end = "2016-11-15"
  description = """
* Helped [RabbitMQ for Pivotal Cloud Foundry](https://pivotal.io/platform/services-marketplace/messaging-and-integration/rabbitmq) improve <br>
* Product manager for [DSE Cassandra for Pivotal Cloud Foundry](https://pivotal.io/platform/services-marketplace/data-management/datastax) <br>
* Product manager for Pivotal Labs <br>
  """

[[experience]]
  title = "Ruby, Go, Jenkins, Concourse, CF, BOSH, vSphere"
  company = "CloudCredo"
  company_url = "http://www.cloudcredo.com/"
  location = ""
  date_start = "2014-09-15"
  date_end = "2015-12-21"
  description = """
* From early beginnings up to the [Pivotal acquisition](http://pivotal.io/platform/press-release/pivotal-bolsters-its-cloud-native-platform-team-with-acquisition-of-cloudcredo) <br>
* Anchored the first [IBM Bluemix Garage in Europe](http://garage.mybluemix.net/) <br>
* Helped deliver the CloudCredo Platform (years ahead of its time) <br>
* The CloudCredo Platform MVP managed the entire [Comic Relief 2015 platform](https://cfsummiteu2015.sched.org/event/532d88570fd1a394d599d113f1c5131b#.VkP2866rRTY) <br>
* Was part of the team that built the bulk of [Pivotal Cloud Foundry Services](https://network.pivotal.io/) <br>
  """

[[experience]]
  title = "Ruby on Rails, RMQ, Elasticsearch"
  company = "FreeAgent"
  company_url = "https://www.freeagent.com/"
  location = ""
  date_start = "2014-06-15"
  date_end = "2014-09-15"
  description = """
* Built the SOA foundation for de-composing a mighty Rails monolith <br>
* Leveraged RabbitMQ for event distribution & Elasticsearch for event indexing <br>
* Proposed Fluentd as an alternative to not invented here <br>
  """

[[experience]]
  title = "Ruby, MySQL, Redis, Chef, AWS"
  company = "How Are You?"
  company_url = "https://blog.howareyou.com/"
  location = ""
  date_start = "2012-06-15"
  date_end = "2014-06-15"
  description = """
* Hired & lead the entire technical team <br>
* De-composed a Rails monolith into many microservices <br>
* Set up infrastructure management on AWS with Chef ([open-sourced cookbooks](https://github.com/gchef)) <br>
* Set up continuous deployment with Jenkins <br>
* Wrote about [using Jenkins with Docker for continuous deployment](http://blog.howareyou.com/post/65048170054/continuous-delivery-with-docker-and-jenkins-part) <br>
  """

[[experience]]
  title = "Ruby, node.js, MySQL, Redis, RMQ, Chef, AWS"
  company = "GoSquared"
  company_url = "https://www.gosquared.com/"
  location = ""
  date_start = "2011-06-15"
  date_end = "2012-06-15"
  description = """
* Built a dozen Ruby microservices, half of them in EventMachine/Goliath <br>
* Set up and configured Graphite as the primary analytics data store <br>
* Managed a hybrid, clustered infrastructure with Chef ([open-sourced cookbooks](https://github.com/gchef])) <br>
* Created a [pure bash deployment tool](https://github.com/gerhard/deliver) <br>
* Inspired the [Elixir & Erlang deployment tool](https://github.com/boldpoker/edeliver) <br>
* [Mitigated a botnet attack with awk + iptables](https://www.gosquared.com/blog/how-to-stop-a-botnet-attack) <br>
  """

[[experience]]
  title = "Ruby, PostgreSQL, MongoDB, Redis, Chef, AWS"
  company = "Paper Cavalier"
  company_url = "https://www.papercavalier.com/"
  location = ""
  date_start = "2010-06-15"
  date_end = "2011-06-15"
  description = """
* Rewrote a legacy AWS arbitrage engine from PHP to Ruby & EventMachine <br>
* Kept ~350mil Amazon book offers in sync within the Amazon API limitations <br>
* Managed a hybrid, clustered infrastructure with Chef - [gchef](https://github.com/gchef) <br>
* Wrote about [knife integration with AWS](http://gerhardlazu.com.s3-website-eu-west-1.amazonaws.com/2010/08/using-chef-to-manage-amazon-ec2-instances-part2/) <br>
  """

[[experience]]
  title = "HTML, CSS, Prototype, Ruby, MySQL"
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
  """

[[experience]]
  title = "HTML, CSS, Prototype, Ruby on Rails, MySQL, Capistrano"
  company = "Jobsgopublic"
  company_url = ""
  location = ""
  date_start = "2008-06-15"
  date_end = "2009-06-15"
  description = """
* Front-end developer on one of the busiest Ruby on Rails sites of its time <br>
* Solved all memory leaks by migrating production from Mongrel to Passenger <br>
* Set up zero-downtime deployments <br>
  """

[[experience]]
  title = "HTML, CSS, jQuery, Zend, Ruby on Rails, MySQL, cPanel"
  company = "Ultraspeed Group"
  company_url = ""
  location = ""
  date_start = "2007-06-15"
  date_end = "2008-06-15"
  description = """
* Designed and developed websites for various company divisions <br>
* Worked on the in-house PHP & MySQL customer portal <br>
* Switched customer portal to Ruby on Rails so that we could iterate quicker <br>
  """

[[experience]]
  title = "HTML, CSS, JS, PHP, MySQL, Textpattern, Plesk"
  company = "Freelancer"
  company_url = ""
  location = ""
  date_start = "2003-06-15"
  date_end = "2007-06-15"
  description = """
* Promoted the use of CSS on Hayes & Finch microsites <br>
* Spearheaded AJAX in plain Javascript - a revoluion at the time <br>
* Wrote PHP 4 &amp; MySQL 3 with no frameworks, not even Zend <br>
* Developed one of the most popular [Textpattern](https://textpattern.com/) plugins: [glz_custom_fields](https://forum.textpattern.com/viewtopic.php?id=23996) <br>
* I still do web hosting for websites that I have designed and built in early 2000s <br>
  """

+++
