---
date: "2022-09-14T13:00:00Z"
title: An Electric Automation Engine
summary: We are trying to build the electric car equivalent of CI/CD
footer:
  left: dagger.io
  right: Electric Automation Engine - Gerhard Lazu - Cloud Native Day 🇨🇭 - September 14, 2022
authors: []
tags: []
categories: []
slides:
  # see available slides. options in layouts/slides/baseof.html
  height: 1080
  # https://github.com/hakimel/reveal.js/tree/3.8.0/css/theme
  theme: simple
  width: 1920
  # https://github.com/hakimel/reveal.js/blob/3.8.0/README.md
  #
  # https://animagraffs.com/how-a-car-engine-works/
  # https://developer.mozilla.org/en-US/docs/Web/CSS/background-position
  # https://unsplash.com/s/photos/engine
  style: |
    .reveal a {
      color: #13daec;
    }
    .reveal .progress {
      color: #13daec;
    }
  # reveal.js ALT: https://github.com/gnab/remark
  # https://generator-qr.com/url-to-qr-code
  # https://www.audi-mediacenter.com/en/photos/album/audi-e-tron-1269
  # https://pixlr.com/x/
  # https://fontawesome.com/v5/search?o=r&m=free
---

<span class="menu-title">2 problems in 2021</span>

# I had **[2 problems](#)** in 2021

1. Big tech job
2. CI/CD

---

{{< slide background="/img/electric-automation-engine/changelog-pull-request-395+qr.png" background-position="0 0" >}}
<span class="menu-title">shipit.show/33</span>

---

{{< slide background="/img/electric-automation-engine/gerhard-joins-dagger.png" background-size="contain" background-color="#FFFFFF" >}}
<span class="menu-title">Gerhard joins Dagger</span>

---

{{< slide background="/img/electric-automation-engine/camille-boulestin-diagram.jpeg" >}}
<span class="menu-title">Electric Automation Engine</span>

---

# What is [good CI/CD](#)?

1. Can run locally - [easy](#)
1. Efficient & seamless caching - [fast](#)
1. Runs the same on any platform - [portable](#)

---

{{< slide background="/img/electric-automation-engine/ossinsight.io_ci-cd_november-2021.png" background-position="0 100px" >}}
<span class="menu-title">Top 10 CI/CD - Nov 2021</span>

---

{{< slide background="/img/electric-automation-engine/ossinsight.io_ci-cd_august-2022.png" >}}
<span class="menu-title">Top 10 CI/CD - Augut 2021</span>

---

<span class="menu-title">CI/CD pipelines locally</span>
# How many here want to <br>[run CI/CD pipelines locally](#)?

---

<span class="menu-title">Someone else's pipeline locally</span>
# [I only have `git`](#). How can I run someone else's pipeline locally?


---

{{< slide background="/img/electric-automation-engine/neofetch.gif" background-size="100%" background-position="0 0" >}}
<span class="menu-title">Linux host, 8 vCPU, 16GB RAM</span>

{{< speaker_note >}}
apt-get update
apt-get install htop dstat git tmux asciinema neofetch

apt-get install ca-certificates curl gnupg lsb-release
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
{{< /speaker_note >}}

---

{{< slide background="/img/electric-automation-engine/dagger-install.gif" background-size="100%" background-position="0 0" >}}
<span class="menu-title">git new repo</span>

{{< speaker_note >}}
asciinema rec -i 0.5 dagger-install.cast
git clone https://github.com/dagger/dagger
cd dagger
./install.sh
./bin/dagger/version

~/github.com/asciinema/agg/target/release/agg --speed=2 --font-size=24 --font-dir=$HOME/Downloads/Noto_Emoji/static --theme=monokai dagger-install.cast dagger-install-loop.gif
gifsicle --no-loopcount dagger-install-loop.gif > dagger-install.gif
{{< /speaker_note >}}

---

{{< slide background="/img/electric-automation-engine/dagger-do.gif" background-size="100%" background-position="0 0" >}}
<span class="menu-title">What should we run?</span>

---

{{< slide background="/img/electric-automation-engine/dagger-do-lint-no-docker.gif" background-size="100%" background-position="0 0" >}}
<span class="menu-title">💥</span>

---

{{< slide background="/img/electric-automation-engine/dagger__buildkit___docker.png" background-size="contain" >}}
<span class="menu-title">Dagger, BuildKit & Docker</span>

---

{{< slide background="/img/electric-automation-engine/dagger___buildkit.png" background-size="contain" >}}
<span class="menu-title">Dagger & BuildKit</span>

---

# I only have [`git` & `docker`](#)

## Nothing else.

---

{{< slide background="/img/electric-automation-engine/dagger-do-lint-cold-cache.gif" background-size="100%" background-position="0 0" >}}
<span class="menu-title">Run someone else's pipeline</span>

{{< speaker_note >}}
docker rm -f dagger-buildkitd
docker volume prune -f
cd dagger

asciinema rec -i 0.5 ../dagger-do-lint-cold-cache.cast
time ./bin/dagger do lint
{{< /speaker_note >}}

---

{{< slide background="/img/electric-automation-engine/erik-bernhardsson-tweet.png" background-size="75%" >}}
<span class="menu-title">Erik Bernhardsson tweet</span>

---

{{< slide background="/img/electric-automation-engine/dagger-do-lint-cached.gif" background-size="100%" background-position="0 0" >}}
<span class="menu-title">Run someone else's pipeline 2</span>

---

{{< slide background="/img/electric-automation-engine/dagger_runs_ops_in_buildkit.png" background-size="contain" >}}
<span class="menu-title">Dagger, BuildKit & OPs</span>

---

# [3.2x](#) faster when cached
### `26s` instead of `84s`

---

{{< slide class="hiviz-light" background="/img/electric-automation-engine/A221242_large.jpeg" background-size="200%" background-position="100% 30%" >}}
<span class="menu-title">Electric vs ICE efficiency</span>

# Electric motors are <br>[4x more efficient](#)
<p></p>
### than internal combustion engines

---

{{< slide background="/img/electric-automation-engine/dagger-do-lint-rs.png" >}}
<span class="menu-title">dagger do lint - RS</span>

---

{{< slide background="/img/electric-automation-engine/erik-sipsma-1-platformcon-2022.png" >}}
<span class="menu-title">Erik Sipmsa, PlatformCon 22 - 1</span>

---

{{< slide background="/img/electric-automation-engine/erik-sipsma-2-platformcon-2022.png" >}}
<span class="menu-title">Erik Sipmsa, PlatformCon 22 - 2</span>

---

{{< slide background="/img/electric-automation-engine/erik-sipsma-3-platformcon-2022.png" >}}
<span class="menu-title">Erik Sipmsa, PlatformCon 22 - 3</span>

---

{{< slide class="hiviz-light" background="/img/electric-automation-engine/A221239_large.jpeg" background-size="150%" background-position="0 80%" >}}
<span class="menu-title">🤔 Electric Automation Engine</span>

# Why do I think of [Dagger](#) as an
# [electric automation engine](#)?

---

{{< slide background-video="/img/electric-automation-engine/solomon-dagger-engine.mp4" >}}
<span class="menu-title">Dagger is two things</span>

{{< speaker_note >}}
Dagger is 2 things:
1. A tool
2. An engine

...
{{< /speaker_note >}}

---

{{< slide background="/img/electric-automation-engine/A215683_large.jpeg" >}}
<span class="menu-title">The car that I imagine...</span>

---

# Can we go [one step further](#)?

---

{{< slide background-video="/img/electric-automation-engine/solomon-dagger-bridge.mp4" >}}
<span class="menu-title">Dagger is also a bridge</span>

{{< speaker_note >}}
Dagger is also a bridge...
{{< /speaker_note >}}

---

{{< slide background="/img/electric-automation-engine/launching-dagger-ep-48.png" background-size="70%" background-position="50% 90%" >}}
<span class="menu-title">shipit.show/48</span>

---

{{< slide background="/img/electric-automation-engine/physical-buttons-vs-digital-ones.jpeg" >}}

# [But](#) <br>people <br>like <br>different <br>things

---

{{< slide background="/img/electric-automation-engine/dagger_reads_config_from_cue_files___runs_ops_in_buildkit.png" background-size="contain" >}}
<span class="menu-title">CUE, Dagger & BuildKit</span>

---

{{< slide background="/img/electric-automation-engine/camille-boulestin-diagram-no-title.jpeg" >}}
<span class="menu-title">Users know what they like</span>

---

{{< slide background="/img/electric-automation-engine/versinetic-types-of-chargers.png" background-size="80%" background-position="50% 90%" >}}
<span class="menu-title">How many types of chargers?</span>

---

{{< slide background="/img/electric-automation-engine/dagger___project_cloak.png" background-size="contain" >}}
<span class="menu-title">Project Cloak</span>

---

{{< slide background="/img/electric-automation-engine/solomon-vmware-explore-2022.png" background-size="contain" >}}
<span class="menu-title">Dagger, VMware Explore 2022</span>

---

{{< slide background="/img/electric-automation-engine/dagger-io-cloak.png" background-size="106%" background-position="50% 47%" >}}
<span class="menu-title">dagger.io/cloak</span>

---

{{< slide background="/img/electric-automation-engine/long-way-up-1.png" background-size="90%" background-position="50% 29%" >}}
<span class="menu-title">Long Way Up</span>

---

{{< slide background="/img/electric-automation-engine/andrew-gazdecki-tweet.png" background-size="68%" background-position="50% 0" >}}
<span class="menu-title">Andrew Gazdecki Tweet</span>

{{< speaker_note >}}
v0.2 with your CI of choice

Next iteration is mostly about supporting your language of choice.
{{< /speaker_note >}}

---

{{< slide background="/img/electric-automation-engine/github-dagger-dagger.png" background-size="100%" background-position="50% 95%" >}}
<span class="menu-title">github.com/dagger/dagger</span>

---

# <i class="fa fa-rocket"></i> <a href="https://dagger.io" target="_blank">dagger.io</a>
## <i class="fab fa-twitter"></i> <a href="https://twitter.com/gerhardlazu" target="_blank">gerhardlazu</a>
### <i class="fa fa-home"></i> <a href="https://gerhard.io" target="_blank">gerhard.io</a>

---

# One last thought...

---

{{< slide background-video="/img/electric-automation-engine/kelsey-hightower-fundamentals.mp4" >}}
<span class="menu-title">Fundamentals</span>
