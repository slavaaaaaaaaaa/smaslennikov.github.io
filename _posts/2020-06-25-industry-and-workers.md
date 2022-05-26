---
type: posts
tag: opinion
layout: post
title: "Industry and workers"
author: "Svyatoslav I. Maslennikov"
---

In a [previous post](https://slava.lol/posts/innovation-and-dependence/) I mentioned the Industrial Revolution as a good early example of exploitation of workers for the benefit of industry owners. Naturally, this wasn't the first or only time this happened[^1]. The Industrial Revolution, however, is specifically an example of technologies driving out the workers, while their marketing suggested otherwise. The hope was that technological improvements were supposed to make life easier, to decrease manufacturing costs, therefore increasing resources for the people. Of course, that never happened: the income flowed to the owners and founders, then due to competition and product pricing adjustments - into the ether, though we can speculate that theoretically the better price point did help the people in the end.

Currently, in the tech industry there's a lot of motion towards useless churning: while in a classic industrial complex workers are to produce more product in a given time frame, in today's tech industry engineers are to put out more features, more product complexity, scale the product and its dependencies according to suggested needs. Sometimes it seems like the purpose is just to keep people busy, justify the paycheck. There's no question that some of this work is necessary, however what I advocate is a notion of a *finalized product*.

For several years now I had the perfect organization style in mind that stems from the above concepts:

1. As usual, the first step is to generate a minimal product, prove its value in the market, ensure that it'll have positive cash flow, etcetera[^2].
1. Once the product is proven and further work is greenlit, it's a good time to scope out the specific staff needs
1. Once a team is built, a complete feature list must be decided and planned. The key here is to keep it minimal but relatively final: the product shouldn't need mindless features. While the product itself is likely groundbreaking and innovative (otherwise did it *really* pass step 1?), its features should not be: they should be stable and using proven technologies.
1. Finally, when the product is built and deployed, robust monitoring, alerting and autoscaling should be put in place.
1. Once all of the above is complete, there's no reason for engineers to sit on their hands at work - send them home with a paycheck keeping them on an on-call rotation.

From outer space, this plan can be seen as such: when the product is released, it starts generating income (due to a successful step 1). This income would usually flow in an uneven way to the founders and employees: don't allow for this to happen; instead, have equal salaries across the entire company. In order for the company to save some cash for a rainy day, salaries are lower than the entire income, the rest is saved and dispersed equally to all employees regularly through bonus programs and such. After the initial stride of excruciatingly hard work, largely all features in step 3 must be completed - there's nothing else to be done. Using proper automation and modern technologies ensures stability of the product and reduces dependencies on technologies that eventually become outdated and vulnerable: operating systems, system libraries[^3].

Naturally, changes to codebases will have to be made, vulnerabilities patched. Few feature additions per year may be acceptable. Overall, however, if the product, its implementation, automation and the team are truly excellent, provide the latter the paycheck and let them go home after 5-10 hours of work per week when needed.

There's another good reason to do this: in economics there's a notion that the delta of net income decreases with expansion[^4]. Building a complete product and stopping there allows your team to reap the benefits and potentially continue onto the next similar venture. This may remind the reader of Google's products: when was the last time there was an update to Gmail, GSuite? Bugfixes and feature additions for GCP are similarly limited.

Overall, this does what the industrial revolution failed to do: give time and resources to the people to allow them to focus on other problems. Following this technique, several advantages spring up: there's no room for bloat and useless features[^5], engineers have an end goal they're motivated to achieve: finish work and automate the job away.

Some may say that this strategy has already been at least partially implemented through the use of unlimited PTO, but when an employer provides such an option it's never analogous with going home and getting paid until there's a call for a bugfix. This may also sound similar to founding teams: once a product is largely built, sold or successfully IPOs, the founders get a cut of the final benefits, while newer team members are the ones continuing the work. It seems many of these notions are partially implemented in some organizations, but not at full scale.

Naturally, this strategy only really fits a small niche of products that *can* be finalized and left making money. Without a really innovative, fitting idea this is all nonsense. The biggest issue that comes to mind is capitalist competition: another organization can replicate the product and potentially offer features the initial one does not, or even offering a better price point. This is a dangerous enemy that unfortunately collapses the entire scheme.

[^1]: Just one example is society in the Russian Empire, which was basically [split into two classes](https://en.wikipedia.org/wiki/Russian_Empire#Society): landowners and peasants. Moving up from peasantry was practically impossible. For those interested in the subject, I strongly recommend Lev Tolstoy's works: namely, [Anna Karenina](https://www.goodreads.com/book/show/15823480-anna-karenina), but also [War and Peace](https://www.goodreads.com/book/show/656.War_and_Peace). Both were written in mid to late 19th century and are not only a pleasure to read, but portray the sequence of events leading up to our revolutions.

[^2]: This is best done at the most minimal level, with few folks involved to minimize losses in case of failure of any of the necessary proofs. I've always been a proponent of quick and dirty POCs, and I'm fond of working for companies that allocate time to prove a concept before throwing resources at a large-scale implementation - no matter whether the concept is as trivial as a new CI/CD system or as serious as major code refactoring: POCs should be developed for each iteration of work required to achieve the end goal.

[^3]: For example, using a managed Kubernetes cluster allows abstraction from the operating system, its libraries, while using a managed load balancer solution distances machines and services you would otherwise worry about exposing directly.

[^4]: As embarrassing as it is, I can't find any information on the subject. This was taught in my high school economics class. The overall explanation is: once a shop opens and generates income, the obvious next step is to open more shops to duplicate the income. However, due to rising operational overhead (staffing, management) the income doesn't simply double with another shop: it increases less with each new shop. The same notion can be seen with software development: supporting new features requires more infrastructure, engineering time, staffing, the same operational overhead as before.

[^5]: Have you ever tried travelling in a city by foot without taxis? Effective transit systems do exist, but often they're overly complex and badly documented (largely in the States). Google Maps put in a lot of effort to congregate all this information in one place, but their accuracy has recently fallen - partly due to exceptions such as COVID-19, but also due to transit companies failing to update schedules and lines. Even Amtrak fails to display a large portion of its train system on Google Maps. Outside of Google Maps, on transit systems' own websites, the situation grows somehow worse, where heavy user interfaces are prioritised over easy access to information.
