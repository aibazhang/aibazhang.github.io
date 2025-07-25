# Becoming SRE

## Introduction to SRE

### Ch1: First Things First

- DeveOps: laptop to production
- SRE: create a reliable production environment
- The same tools might be used

### Ch2: SRE Mindset

- How does a system work?
  - How will the system work if we scale it?
  - How can the system work with less operational load?
  - How can the system work reliably for more people?
    - For people who create things that go to production: o11y, better monitoring, better alerting, better logging, better release tools, easy-to-use documentation
    - For people who consume things from production: CDN setup, degrade gracefully, accessibility testing tools
- How does it fail?
  - How does the system fail when the service/product succeeds?
  - When will it cease to work as needed?
    - thinking about how to replace it

### Ch3: SRE Culture

- Culture as a Vehicle or a Lever
  - decide where you want to go
- Building culture: give yourself the leeway to not only break things into relatively small parts but also to focus on the processes that bring them together
  - self-service, well-documented, extensible, instrumented, accessibility
- Focus intently and intentionally on your incident handling and review.
  - post-incident reviews are currently yielding new and useful information about your systems and how they can fail
  - Not only SRE at this point, but also the entire organization
- Nurture SRE culture
  - "book club" idea. 3 questions.
    - What is missing from the write-up we have here?
    - What do we still not know, or what may we never know?
    - Why wasn't this worse? (for outages)
  - Rotations
    - To the development team

## Becoming SRE for the Individual

### Ch5: Preparing to become an SRE

- Know how to code
  - If you don't know how something is built, your ability to understand how it can fail is limited
  - Learning to code will help teach you how to debug or troubleshoot
- Single/Basic systems and how they fail, Distributed systems and how they fail
  - active/passive or primary/secondary configurations, latency, consensus algorithms, distributed timekeeping, and data consistency
- Storytelling
  - A post-incident review/postmortem is a story
- Performance engineering and Chaos engineering
- ML and AI
  - Reliable Machine Learning

### Ch7: Hints for getting hired as an SRE

#### Preparing for an SRE Interview

- NALSD (non-abstract large system design)
- Monitoring/observability
  - Practical Monitoring
  - Observability Engineering
  - OSS monitoring tool: Prometheus
- Computing Fundamentals
  - OS: Linux and the Linux kernel works at the operating system level
  - Networks: OSI model, playing with real networking protocols in a home lab
- Troubleshooting/debugging

### Ch8: A Day in the Life of an SRE

- Incident/Outage Mode
- Postincident Learning Mode
- Builder/Project/Learn Mode
  - Coding a custom application to perform Self-service interface
  - Provision: IaC
  - Improve monitoring/o11y/alerting
  - Writing docs
  - Learning a new technology
- Architecture Mode
  - Bring the expertise and experience to bear at the planning stages of a project
- Management Mode
- Planning Mode
- Collaboration Mode
  - SLI/SLO definition
  - Prelaunch review
- Recovery and Self-Care Mode

### Ch9: Establishing a Relationship to Toil

- Automation is not the silver bullet
  - It doesn't handle a particular use case
  - Too onerous to configure
- Transform toil into Complexity
- Single system -> 
  - Do I allocate my finite capacity to address past toil (established), current toil (early), or future toil?

### Ch10: Learning from Failure

- Nontrivial incidents just didn't work that way -> The five whys
- post-incident review
  - As soon as possible the incident is resolved 0-2 days
  - After a significant incident, kick off a post-incident
  - Create a shared chronology in a document
    - What decisions were made
    - What information the people involved
    - Who was involved and who was not
    - What the resources were consulted
- Common Traps
  - Attribution of the issue to "human error"
    - -> identifying the personal, systemic, or organizational context
  - Counterfactual reasoning
    - -> Focus on what happened
  - Judge the situation and people for something they didn't do or have
  - Ignoring the positive
- Resilience Engineering
- Chaos Engineering


## Becoming SRE for the Organization

### Ch11: Organizational Factors for Success

- Contributing Factor 1: What’s the Problem?
  - Problem statement, not a feature statement
  - "We are spending too much time dealing with outages running the system (i.e., on toil)"
- Contributing Factor 2: What Is the Org Willing to Do to Get There?
  - "reliability important" is obvious
  - Ask questions about "What Is the Org Willing to Do to Get There?"
- Contributing Factor 3: Does the Org Have the Requisite Patience?
  - Cumulative: Actual reliability dose not really happen util the capability is built up
  - Be sure to communicate your incremental successes as it happens
- Contributing Factor 4: Can We Collaborate?
- Contributing Factor 5: Does the Org Make Decisions Based on Data?
- Contributing Factor 6: Can the Org Learn and Act on What It Learns?

### Ch12: How SRE Can Fail

- Contributing Factor 1: Title Flipping to Create SREs
- 2: Converting Tier 3 Support to SRE
  - Tier 3 (L3): Advanced support, custom fixes, identifying product defects.
- 3: On Call and That's All
- 4: Wrong Org Chart
  - More people involved -> more hops -> harder decisions can be
- 5: SRE by Rote
  - Attemping to replicate everything in the Google SRE book is not possible
- 6: Gatekeeping
  - people will "route around damage"
- 7: Death Through Success
- 8: A Collection of Smaller Factors
  - I'm here to save the kingdom
  - Lack of intreospection, balance (reactive vs. project work), a culture of curiosity...
  - Forgetting the customer
  - Forgetting to have fun

## Ch13: SRE from a Business Perspective

- Communicating about SRE
  - Reliability is a feature
  - SREs are feature devs focused on the feature of reliability
  - Metrics
    - e.g. put 5 SREs there and the sercie gets a thousand times bigger and doesn't fall over
  - Don't try to justify your own existence, figure out a path where they don't have to keep doing the job for that service 
- Budgeting for SRE
  - Reliability work should never be viewed as a tax on development works. It's a kind of feature work
  - Not fall into the "SRE is going to make all of your problems go away" trap of selling these promises
  - Say "You done stuff in a way that isn't gonna grow or isn't gonna scale longitudinally

## Ch14: The Dickerson Hierarchy of Reliability (A Good Place to Start)

- Any organization that designs a system will produce a design whose structure is a copy of the organization's communication structure
- Wrong turns
  - "SRE would eb a cheaper way of handling on-call so their engineers could work on more import things"
  - All of your time has been spent working on postincident reviews
  - SREs are considered just "engineer" and therefore fungible or convertible to generic SWEs
  - Convert existing SRE headcount to just "engineer" headcount

## Ch15: Fitting SRE into Your Organization

- Pre-role practives: even pilot or proof-of-concept SRE work can be beneficial
- Integration models
  - Centrailized/Partnered Model
  - Distributed/Embedded Model

## Ch16: Growing SRE in Your Organization

- SREs must be agents of convergence and connection—not agents of conformity, deindividualization, or removing distinction.
