---
type: posts
tag: opinion
layout: post
title: Excellent Code
author: Svyatoslav I. Maslennikov
---

Once upon a time, as I was starting at NordstromRack.com | Hautelook as a Platform Engineer, I found myself impressed with a requirement stated in our Employee Handbook: a requirement of generating *Excellent Code*. I haven't been able to confirm its existence in the current handbook (not that I tried very hard), nor did I find a similar description of it elsewhere. However, I do feel like I keep seeing references to it in Hacker News literature: at this point I can no longer confirm that it wasn't a hallucination all along; "The smell of dry blood, dirty foot prints circling each other, that aroma of old sweat like fried chicken, the feel of a floor still warm the fight the night before"[^1].

What follows is my attempt of recreating the tenets of *Excellent Code*, five years later.

<!-- toc -->

- [Design and planning](#design-and-planning)
- [Compiled, interpreted and scripting languages](#compiled-interpreted-and-scripting-languages)
- [Documentation](#documentation)
- [Code versioning](#code-versioning)
- [Local development environment](#local-development-environment)
- [Automation](#automation)
- [Further reading](#further-reading)

<!-- tocstop -->

## Design and planning

The larger the task at hand, the higher the risk of time loss due to lack of planning, the more thought should be given to it before actual programming work begins. The largest tasks should be planned, designed and peer reviewed before any code is written. Specific artifacts like Architecture Plans, Design Plans, diagrams should all be developed in this process.

## Compiled, interpreted and scripting languages

Before getting to work on any programming task, some thought should be given to decide what language is more appropriate for it. Ask yourself:

* What libraries, SDKs, APIs are necessary? What languages are supported directly?[^2]
* How complex is the task? What kind of logic is necessary?
* What is the risk associated with logic failures of this codebase? What kind of error handling is expected?
* Is the code expected to run in containers? What limitations can be expected with your language choice there?
* What automation is expected to manage this codebase, its testing and deployment? How does your language preference support it?
* What language is the most accessible for the rest of your team to manage?

While simplest tasks can be managed with lightweight shell scripts, they tend to be brittle and difficult to unit test properly. On the other hand, highly critical production elements with high risk of losses due to malfunction may deserve stricter compiled languages with specific tests against undefined behaviours and other dangerous circumstances.

## Documentation

Aim to write self-documenting, self-descriptive code. When adding inline commentary, describe the _why_ of your code, not the _what_. As for technical documentation, design choices and overall code structure - keep it next to the code, in the repository, ideally ([though not always](https://matklad.github.io//2021/02/06/ARCHITECTURE.md.html)) all in a single `README.md` file[^3]. Previously approved external technical design documents can be linked to directly.

## Code versioning

Absolutely all code should be hosted under version control, such as Git. Without this, there is no way of tracking changes, reverting issuous commits or even effectively tracking versions.

Whether you use others' Git refs or not, it's important to realize their potential and necessity. When you show [iterative progress](https://chris.beams.io/posts/git-commit/), you not only allow for reverting of specific changes in time, but also provide developers (yourself included) documentation on the change.

Lastly, a largely overlooked Engineering practice is Git commit signing. Without it, it's trivial to [impersonate Git commits on popular platforms](https://github.com/smaslennikov/faking-gabriel-fok).

## Local development environment

As difficult as on-boarding usually is, a lack of a push-button local development environment in a code base makes it even harder. Make sure it's easy to deploy the entire application locally:

1. Use [Vagrant](https://www.vagrantup.com/), [`docker-compose`](https://docs.docker.com/compose/) or another platform with similar ease of use
1. Support dummy endpoints, databases, Cloud APIs and similar external entities
1. Provide sample development database dumps
1. Document the happy path for the local development environment suite: when an Engineer wants to commit changes, the absolute first thing they'll want to do is spin it up and test the changes locally

## Automation

It's crucial to develop automation around any size of a codebase. This helps not only in abolishment of manual tasks, but can also be referenced during on-boarding for understanding a specific application's life cycle. It also benefits applications with rare changes for the same reasons.

A generic pipeline around any codebase includes:

1. *Testing*: unit tests, smoke tests, basically anything that can be done quickly to immediately show the Engineer any issues that may have been introduced
1. *Deployment to a Staging environment*: this is where the application should be thoroughly tested in interactions with other applications; also known as end-to-end testing
1. *Manual deployment to a Production environment*: this is generally a push-button deployment to a customer-facing environment

## Further reading

This isn't quite meant to replicate the notion of a [12 Factor Application](https://12factor.net/), but that is another good resource for additional, more in-depth knowledge on application life cycles.

[^1]: From Fight Club, the movie (1999)
[^2]: I recently wrote some code for a [Raspberry Pi litter box controller](https://litter-controller.smaslennikov.com) in C. Initially, I wanted to write it in Golang, but the most popular Golang GPIO library for Raspberry PI had a [bug with potential to brick the device](https://github.com/stianeikeland/go-rpio/issues/38). Since [WiringPi](http://wiringpi.com/) did not have such a bug while having a larger community, I went with C. This shows the importance of researching design constraints before beginning any work.
[^3]: It's always easier to Ctrl-F in a web browser on a single page than having to use a local search function or that of a Git repository host. Things like collapsible sections, [tables of contents](https://github.com/smaslennikov/markdown-toc) and inline diagrams help keeping documentation clean and accessible.
