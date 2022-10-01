---
date: "2022-10-03T10:50:00Z"
title: You're holding it wrong
summary: What if I told you that you've been holding CI/CD wrong all this time?
footer:
  left: dagger.io
  right: You're holding it wrong - Gerhard Lazu - KubeHuddle 🏴󠁧󠁢󠁳󠁣󠁴󠁿 October 3, 2022
authors: []
tags: []
categories: []
slides:
  # see available slides. options in layouts/slides/baseof.html
  height: 1080
  # https://github.com/hakimel/reveal.js/tree/3.8.0/css/theme
  theme: league
  width: 1920
  # https://github.com/hakimel/reveal.js/blob/3.8.0/README.md
  #
  # https://developer.mozilla.org/en-US/docs/Web/CSS/background-position
  #
  # https://www.flagcolorcodes.com/royal-banner-of-scotland
  # https://www.flagcolorcodes.com/scotland
  style: |
    .reveal a {
      color: #FFD228;
    }
    .reveal a:hover {
      color: #FFFFFF;
    }
    .reveal .progress {
      color: #FFD228;
    }
    footer {
      color: #FFFFFF;
    }
  # reveal.js ALT: https://github.com/gnab/remark
  # https://generator-qr.com/url-to-qr-code
  # https://www.audi-mediacenter.com/en/photos/album/audi-e-tron-1269
  # https://pixlr.com/x/
  # https://fontawesome.com/v5/search?o=r&m=free
---

{{< slide background="/img/holding-it-wrong/blueballfixed.ytmnd.com.gif" background-size="initial" background-repeat="repeat" >}}
<span class="menu-title">A typical pipeline</span>

# [You are holding it wrong](#)

---

# How do you deploy to K8s?

---

{{< slide background="/img/holding-it-wrong/robot.gif" >}}
# [GitOps](#)

---

<span class="menu-title">Need K8s to K8s 🐣</span>

# [You need Kubernetes](#)
## before you can deploy to Kubernetes

<img src="/img/holding-it-wrong/truck-on-truck.gif"/>

---

{{< slide background="/img/holding-it-wrong/coding.gif" >}}

# [`kubectl`](#)

---

<span class="menu-title">Encode & share devops</span>

# Could we encode devops knowledge? 🙇‍♀️

## 🙇‍♂️  Maybe share it as artefacts?

---

# `dagger do k8s`
## `dagger do k8s_info`

---

{{< slide background="/img/holding-it-wrong/dagger-plan-k8s-action.png" background-size="contain" >}}
<span class="menu-title">dagger plan 👉 k8s action</span>

---

{{< slide background="/img/holding-it-wrong/civo-k8s-create.png" background-size="contain" >}}
<span class="menu-title">civo.#K8s.create</span>

---

# I didn't have to use [Dagger](#)
### It was just convenient

---

# `dagger do k8s_dns`
## [🤔](https://github.com/kubernetes-sigs/external-dns/pull/2852)
## `dagger do k8s_bootstrap`

---

{{< slide background="/img/holding-it-wrong/dagger-do-k8s_config.png" background-size="contain" >}}
<span class="menu-title">dagger do k8s_config</span>

---

{{< slide background="/img/holding-it-wrong/k9s.png" background-size="contain" >}}
<span class="menu-title">k9s</span>

---

{{< slide background="/img/holding-it-wrong/argocd.png" background-size="contain" >}}
<span class="menu-title">argocd</span>

---

{{< slide background="/img/holding-it-wrong/argocd-app.png" background-size="contain" >}}
<span class="menu-title">argocd app</span>

---

<span class="menu-title">GitOps: GHA, Dagger & ArgoCD</span>

# How do we GitOps with
## [GitHub Actions](#), [Dagger](#) & [ArgoCD](#)?

---

# GitHub Actions Workflow

---

{{< slide background="/img/holding-it-wrong/app-verify.png" background-size="contain" >}}
<span class="menu-title">cosign</span>

---

# What should we GitOps?

https://argocd.kubehuddle.gerhard.io

---

{{< slide background-color="#FFFFFF" >}}

# And...

---

{{< slide background-color="#FFFFFF" background="/img/electric-automation-engine/andrew-gazdecki-tweet.png" background-size="68%" background-position="50% 0" >}}
<span class="menu-title">How you build a startup</span>

---

{{< slide background-color="#FFFFFF" background="/img/electric-automation-engine/dagger___project_cloak.png" background-size="contain" >}}
<span class="menu-title">Project Cloak</span>

---

{{< slide background-color="#FFFFFF" >}}
# `dagger v0.3.x` peek

---

# <i class="fa fa-users"></i> <a href="https://dagger.io" target="_blank">dagger.io</a>
## <i class="fab fa-twitter"></i> gerhardlazu
### <i class="fab fa-github"></i> <a href="https://gerhard.io" target="_blank">github.com/gerhard/kubehuddle22</a>
