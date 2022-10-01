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
  style: |
    .reveal a {
      color: #0065BF;
    }
    .reveal .progress {
      color: #0065BF;
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

# You are holding it wrong

---

# How do you deploy your code to Kubernetes?

---

# _One does not simply deploy to Kubernetes_ (Ned)

## You have to GitOps

---

# You need Kubernetes before you can deploy to Kubernetes

## Control plane vs workload plane

---

# YOLO

## `kubectl`

---

# Could we encode ops knowledge

## Share as immutable artefacts

---

# <i class="fa fa-rocket"></i> <a href="https://dagger.io" target="_blank">dagger.io</a>
## <i class="fab fa-twitter"></i> <a href="https://twitter.com/gerhardlazu" target="_blank">gerhardlazu</a>
### <i class="fa fa-home"></i> <a href="https://gerhard.io" target="_blank">k8s.gerhard.io</a>
