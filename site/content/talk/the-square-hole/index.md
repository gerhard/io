---
date: "2024-03-23T12:00:00Z"
title: The Square Hole
summary: How to leverage Kubernetes for efficient CI/CD processes, exemplified through a live setup of a European Kubernetes cluster.
abstract: |
    We highlight the flexibility and standardization Kubernetes offers for
    deployment, and Argo CD's role in automating and managing deployments to
    reduce human error.

    We discuss leveraging Kubernetes for efficient CI/CD processes, exemplified
    through a live setup of a European Kubernetes cluster. We highlight the
    flexibility and standardization Kubernetes offers for deployment, and Argo
    CD's role in automating and managing deployments to reduce human error.

    Our demonstration includes creating a Kubernetes cluster using Omni &
    Talos, emphasizing the efficiency and geographic distribution of nodes
    across Europe. A distributed Daggerverse deployment from backup is used as
    a real-world use case. We also discuss cost comparisons, and the potential
    savings outside traditional cloud services like AWS EKS.

    Here is a summary of the key points in our conversation:
    1. Kick off an AWS EKS cluster deployment with Dagger
    2. Provision a 5-node Kubernetes 1.29 cluster across VMs in London, Paris,
       Amsterdam, Düsseldorf and Warsaw using Omni and Talos. This takes around
    3 minutes.
    3. Walk through installing Argo CD on the European cluster and use it to
       manage core components such as ingress-nginx, cert-manager,
    external-dns, kube-prometheus-stack etc.
    4. Deploy a real-world stateful application - Daggerverse - and show how
       requests hit different nodes across the European locations.
    5. Discuss cost, especially for data transfer/egress fees.
    6. Highlight the improved tooling that enables more flexibility in running
       Kubernetes outside of major cloud providers.

event: KubeCon EU 2024
location: Online

image:
  caption:
  focal_point: Center

links: []

url_code:
url_pdf:
url_slides:
url_video: https://www.youtube.com/watch?v=s_Fxpm1pp3I

---
