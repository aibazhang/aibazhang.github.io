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
    - Service APIs (Google Cloud APIs)
    - SDKs (python, java, go)
    - CLIs (gcloud)
    - Dashboard (Console)
  - Kubernetes
    - Service APIs (Kubernetes APIs)
    - SDKs (client-go)
    - CLI (kubectl)
    - Dashboard (Kubernetes Dashboard, k9s)
    - A platform to build platforms
      - provides all the building blocks you need to build concrete platforms that will solve dominion-specific challenges.
  - A good platform
    - An internal product and your dev team are your customers
    - consistent user experiences for using
    - managing its capabilities and services
      - web portals
      - project templates
      - self-service APIs
    - The relationship between the platform team and the dev team
      - Platform team: focus on internal development teams' satisfaction while using the platform's tools
      - The synergy between the platform team and the dev team would improve the entire organization's software delivery practices
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

- The platform engineering understand what dev teams need
  - what they will work on
  - what tools they need
  - which other services must be integrated
- -> define an API to provision new development environments (or other services)
  - encode what a development environment means for our teams
  - provision and configure components and tools
  - enable teams to the newly provisioned environments
- Not a black-box approach
  - Temas have the technical experience to interact with the underlying layers and tools -> they should be able to do so
- Document your journey with each of the tools as part of your platform initiatives
- Platform tools and worklaods need to be separated
- How much you lean on the k8s APIs is a decision that platform engineering teams will need to make
- Start with simple solution such ns isolation -> single cluster with tons of ns -> a more robust plan
- Implementation scenarios
  - Purchase a solution (but limited platform engineering customization or operability)
  - Build
    - Scripting languages (BASH, Python)
    - Declarative infra languages (Terraform, Crossplane)
    - Workflow engines (Argo Workflows, GitHub Actions)

## 7. Platform capabilities I: Shared application concerns

- Most apps doing 95% of the time
  - Call other services to send or receive infromation
  - Store and read data from persistent storage
  - Emit and consume events or messages async
  - Accessing credentials to connect to services
- Increase velocity in software delivery pipelines
  - go one level down to understand the intricate relationships between the components of our platform
- Decouple responsibilities from app dev teams and platform capabilities
  - Platform team: Statestore API, PubSub API, Credential Store API, Resiliency Policies
  - If you move toward platform-provided capabilities, you must ensure that you can provide a local dev experience for dev teams
  - Good platforms will promote APIs that cover a wide range of use cases

## 8. Platform capabilities II: Enabling teams to experiment

## 9. Measuring your platforms
