# Platform Engineering on Kubernetes

## 1. The rise of platforms on top of Kubernetes

- Platform teams
  - In charge of learning, curating, and integrating tools to make the life of everyone involved with the software delivery process of you organization easier.
  - Platforms are not only about creating environments, managing clusters, and deploying applications. Platforms should provide customized workflows for teams to be productive.
  - The main objective of the platform and platform engineering teams is to enable developers to deliver software more efficiently.
- Platform
  - Platforms are a collection of services that help companies get their software running in front of their customers (internal or external).
  - Cloud Provider's services categories:
    - Infrastructure & Computing Resources (Hardware, Networking, power)
    - Operating System and Base Software (OS, Kernel)
    - Operational tools (Monitoring, Logging, Cost)
    - Application Infrastructure (DB, Message Broker, Identity, Secrets)
    - Development Tools (SDKs, Frameworks)
    - Application Services & Industry specific Services (AI, ML)
  - The higher the category, the more you will need to pay
    - these services usually take care of all the underlying layers and operational costs for you.
  - Cloud platforms (e.g Google Cloud)
    - Service APIs
      - Scripts
      - SDKs (python, java, go)
      - CLIs (gcloud)
    - Dashboard (UI)
  - Kubernetes
    - Service APIs (Kubernetes APIs)
    - CLI (kubectl)
    - Dashboard (Kubernetes Dashboard, k9s)
    - k8s is not a platform, but a meta-platform or a platform to build platforms.
      - provides all the building blocks you need to build concrete platforms that will solve dominion-specific challenges.
  - A good platform
    - An internal product and your dev tema are your customers
    - consistent user experiences for using
    - managing its capabilities and services
      - web portals
      - project templates
      - self-service APIs
  - It's hard to buy a platform
    - To solve specific problems: need to figure out services and tools fit your needs

## 2. Cloud-native application challenges

- Downtime is not allowed
- Service's build-in resiliency
- Dealing with the application state
  - Understanding how much data they are keeping in-memory
  - Web application: keep HTTP sessions and require sticky sessions
    - e.g using cache
- Dealing with inconsistent data
- Understanding how the application is working
  - monitoring, tracing, temeletry
- Security and identity management

## 3. Service pipelines: Building cloud-native applications

- GitHib Actions, Dagger, Tekton
- Platform team
  - service pipelines where they start and end.
  - e.g. start when a change is submitted and end after publishing the container images
  - consider using a Helm chart is a good idea or an overkill

## 4. Environment pipelines: Deploying cloud-native applications

- GitOps(ArgoCD, Flux) ensures no drift in the configuration applied in the cluster
- dev environment: GitOps might not work, since some dev teams will want direct access to clusters

## 5. Multi-cloud (app) infrastructure

## 6. Let's build a platform on top of Kubernetes

## 7. Platform capabilities I: Shared application concerns

## 8. Platform capabilities II: Enabling teams to experiment

## 9. Measuring your platforms