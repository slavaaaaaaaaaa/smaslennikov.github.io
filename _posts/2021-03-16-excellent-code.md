---
type: posts
tag: opinion
layout: post
title: Excellent Code
author: Svyatoslav I. Maslennikov
---

*This post was cross-published on the [SADA Engineering Blog](https://engineering.sada.com/write-excellent-code-70b66381d625).*

Once upon a time, as I was starting at `NordstromRack.com | Hautelook` as a Platform Engineer, I found myself impressed with a requirement stated in our Employee Handbook: a requirement of generating *Excellent Code*. I haven't been able to confirm its existence in the current handbook (not that I tried very hard), nor did I find a similar description of it elsewhere. However, I do feel like I keep seeing references to it in Hacker News literature: at this point I can no longer confirm that it wasn't a hallucination all along; ["The smell of dry blood, dirty foot prints circling each other, that aroma of old sweat like fried chicken, the feel of a floor still warm the fight the night before"](https://www.imdb.com/title/tt0137523/).

What follows is my attempt of recreating the tenets of *Excellent Code*, five years later.

<!-- toc -->

- [Design and planning](#design-and-planning)
- [Compiled, interpreted and scripting languages](#compiled-interpreted-and-scripting-languages)
- [Documentation](#documentation)
- [Code versioning](#code-versioning)
- [Local development environment](#local-development-environment)
- [Automation](#automation)
- [Further reading](#further-reading)
- [Annotations](#annotations)

<!-- tocstop -->

While relatively opinionated, it is intended as a general overview for more junior developers that are new to the field. I won’t be going into the code itself, so much as the way we think about and plan our code to ensure that we have a clean, effective deployment with fewer hassles.

While imperative to effective project planning, concepts such as database engine, underlying compute infrastructure, and several other global topics are not in scope for this article.

## Design and planning

The larger the task at hand, the higher the risk of time loss due to lack of planning. Consequently, the larger the task, the more planning is required before actual programming work begins. The largest tasks should be planned, designed, and peer reviewed before any code is written. Even some small types of artifacts, such as architecture plans, design plans and diagrams should all be developed in this process.

## Compiled, interpreted and scripting languages

Before getting to work on any programming task, give some thought to deciding which language is most appropriate.

Ask yourself:

* What libraries, SDKs, and APIs are necessary?
* What languages do they support directly?
* How complex is the task?
* What kind of logic is necessary?
* What is the risk associated with logic failures of this codebase?
* What kind of error handling is expected?
* Is the code expected to run in containers?
* What limitations and implications can be expected with your language choice there?
* What automation is expected to manage this codebase, its testing, and deployment?
* How does your language preference support it?
* What language is the most accessible for the rest of your team to manage?

While lightweight shell scripts can manage simple tasks, they tend to be brittle and difficult to unit-test properly. On the other hand, highly critical production elements with a high risk of loss due to malfunction may deserve stricter compiled languages, with specific tests against undefined behaviors and other dangerous circumstances.

For example, I once wrote some code for a [Raspberry Pi cat litter box controller in C](https://litter-controller.slava.lol/). Initially, I wanted to write it in Golang, but the most popular Golang GPIO library for Raspberry PI had [a bug with potential to brick the device](https://github.com/stianeikeland/go-rpio/issues/39). Since WiringPi did not have such a bug while having a larger community, I went with C. This shows the importance of researching design constraints before beginning any work.

## Documentation

Aim to write self-documenting, self-descriptive code. When adding inline commentary, describe the why of your code, not the what. This is important, as it allows someone coming along afterwards to understand the thought process. When making future changes or fixes, understanding why decisions were made can save a lot of time and investigation. As for technical documentation, design choices, and overall code structure — keep it next to the code, in the repository. Ideally ([though not always](https://matklad.github.io//2021/02/06/ARCHITECTURE.md.html)) in a single README.md file. You can also link directly to previously approved external technical design documents.

It’s always easier to use Ctrl-F in a web browser on a single page than having to use a local search function or that of a Git repository host. Things like collapsible sections, tables of contents, and inline diagrams help keep documentation clean and accessible.

## Code versioning

Absolutely all code should be hosted under version control, such as Git. Without this, there is no way of tracking changes, reverting problematic commits, or even effectively tracking versions.

Whether you use others’ Git refs or not, it’s important to realize their potential and necessity. When you [show iterative progress](https://chris.beams.io/posts/git-commit/), you not only allow for reverting of specific changes in time, but also provide developers (yourself included) documentation on the change.

Lastly, a largely overlooked engineering practice is [Git commit signing](https://docs.github.com/en/authentication/managing-commit-signature-verification/signing-commits), which verifies that it is actually you that is committing the code. Without this, it’s [trivial to impersonate Git commits](https://github.com/slavaaaaaaaaaa/impersonate-git-commits) on many popular platforms.

## Local development environment

As difficult as on-boarding usually is, the lack of a push-button local development environment in a code base makes it even harder. Make sure it’s easy to deploy the entire application locally:

1. Use [Vagrant](https://www.vagrantup.com/), [Docker Compose](https://docs.docker.com/compose/), or another platform with similar ease of use.
1. Support dummy endpoints, databases, Cloud APIs, and similar external entities.
1. Provide sample database dumps to develop against.
1. Document the happy path for the local development environment suite.

## Automation

It’s crucial to develop automation around a codebase of any size. This helps not only in abolishment of manual tasks, but can also be referenced during on-boarding for understanding a specific application’s life cycle. Additionally, it also benefits applications with rare changes, for the same reasons.

A generic pipeline around any codebase includes:

1. **Testing:** Unit tests, smoke tests, basically anything that can be done quickly to immediately show the engineer any issues that may have been introduced.
1. **Deployment to a staging environment:** This is where the application is thoroughly tested in interactions with other applications; also known as end-to-end testing.
1. **Manual deployment to a production environment:** This is generally a push-button deployment to a customer-facing environment.

## Conclusion

There you have it. As we talked about earlier, this presents you with some core principles and practices that, if used thoughtfully and consistently, will save considerable time and effort, resulting in reduced frustration and more efficient deployments.

## Further reading

This isn’t quite meant to replicate the notion of a [12 Factor Application](https://12factor.net/), but that methodology is another good resource for additional, more in-depth knowledge on application life cycles.
