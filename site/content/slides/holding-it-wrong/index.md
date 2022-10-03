---
date: "2022-10-03T10:50:00Z"
title: You are holding it wrong
summary: What if I told you that you've been holding CI/CD wrong all this time?
footer:
  left: dagger.io
  right: You are holding it wrong - Gerhard Lazu - KubeHuddle 🏴󠁧󠁢󠁳󠁣󠁴󠁿 October 3, 2022
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

<span class="menu-title">How do you deploy to K8s?</span>
# How do you deploy to [Kubernetes](#)?

---

{{< slide background="/img/holding-it-wrong/robot.gif" >}}
# [GitOps](#)

---

{{< slide background="/img/holding-it-wrong/truck-on-truck.gif">}}
<span class="menu-title">Need K8s to K8s 🐣</span>

# [You need Kubernetes](#)
## before you can deploy to Kubernetes

---

{{< slide background="/img/holding-it-wrong/coding.gif" >}}

# [`kubectl`](#)

---

<span class="menu-title">Encode & share devops</span>

# Could we [encode devops knowledge](#)? 🙇‍♀️

## 🙇‍♂️  Maybe share it as artefacts?

---

{{< slide background="/img/holding-it-wrong/dagger-plan-k8s-action.png" background-size="contain" >}}
<span class="menu-title">dagger plan 👉 k8s action</span>

---

{{< slide background="/img/holding-it-wrong/civo-k8s-create.png" background-size="contain" >}}
<span class="menu-title">civo.#K8s.create</span>

---

# `dagger do k8s`
## `dagger do k8s_info`

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
<span class="menu-title">ArgoCD</span>

---

{{< slide background="/img/holding-it-wrong/argocd-app.png" background-size="contain" >}}
<span class="menu-title">ArgoCD app</span>

---

{{< slide background="/img/holding-it-wrong/just-push.gif" background-size="contain" >}}
<span class="menu-title">Devs should just git push</span>

---

<span class="menu-title">GitOps: GHA, Dagger & ArgoCD</span>

# How to GitOps with
## [GitHub Actions](#), [Dagger](#) & [ArgoCD](#)?

---

{{< slide background="/img/holding-it-wrong/github-actions-workflow.png" >}}
<span class="menu-title">GitHub Actions Workflow</span>

---

{{< slide background="/img/holding-it-wrong/github-actions-workflow-run.png" background-size="contain" >}}
<span class="menu-title">GitHub Actions Workflow - 15s</span>

---

{{< slide background="/img/holding-it-wrong/github-actions-workflow-commit.png" background-size="contain" >}}
<span class="menu-title">GHA Workflow - Commit</span>

---

# What should we GitOps?

https://argocd.kubehuddle.gerhard.io

---

<span class="menu-title">app.kubehuddle.gerhard.io</span>
https://app.kubehuddle.gerhard.io

---

{{< slide background-color="#FFFFFF" background="/img/electric-automation-engine/dagger_reads_config_from_cue_files___runs_ops_in_buildkit.png" background-size="contain" >}}
<span class="menu-title">dagger v0.2.x</span>

---

{{< slide background-color="#FFFFFF" background="/img/holding-it-wrong/dagger_v0_3.png" background-size="contain" >}}
<span class="menu-title">dagger v0.3.x</span>

---

{{< slide background-color="#FFFFFF" background="/img/electric-automation-engine/solomon-vmware-explore-2022.png" background-size="contain" >}}
<span class="menu-title">Dagger, VMware Explore 2022</span>

---

{{< slide background-color="#FFFFFF" background="/img/holding-it-wrong/graphiql.png" background-position="0 0" >}}
<span class="menu-title">dagger v0.3 PEEK</span>

---

{{< slide background-color="#FFFFFF" background="/img/holding-it-wrong/cloak-do-file.png" background-position="0 0" >}}
<span class="menu-title">cloak do -f k8s.graphql</span>

---

{{< slide background-color="#FFFFFF" background="/img/holding-it-wrong/cloak-do-file-stdout.png" background-position="0 0" >}}
<span class="menu-title">cloak do -f k8s.graphql stdout</span>

---

{{< slide background-color="#FFFFFF" background="/img/holding-it-wrong/github-dagger-cloak.png" background-position="0 0" >}}
<span class="menu-title">github.com/dagger cloak branch</span>

---

# <i class="fa fa-users"></i> <a href="https://dagger.io" target="_blank">dagger.io</a>
## <i class="fab fa-twitter"></i> gerhardlazu
### <br>
### <i class="fab fa-github"></i> <a href="https://github.com/gerhard/kubehuddle" target="_blank">github.com/gerhard/kubehuddle</a>

---

{{< slide background-color="#FFFFFF" >}}
# [One more thing...](#)

---

{{< slide background-color="#FFFFFF" background="/img/holding-it-wrong/app-verify.png" background-size="contain" >}}
<span class="menu-title">Verify your images</span>
