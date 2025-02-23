---
type: posts
tag: blag
layout: post
title: READABLE documentation
haiku: |
    write docs all you want,
    but to get good attention
    write some good haikus
---

Documentation is only as powerful as its reader. Bring your writing closer to your audience with a few extra steps. Make it READABLE: **R**eadable, **E**njoyable, **A**ccessible, **D**ocumentation is **A**lways **B**etter than **L**azy **E**ntertainment. Ok, yeah, that's silly, but more about that later.

<!-- toc -->

- [Individual need](#individual-need)
- [Use your silly voice](#use-your-silly-voice)
    * [How to come up with an acronym](#how-to-come-up-with-an-acronym)
- [Simple structure and flow](#simple-structure-and-flow)
- [Automate instead of document](#automate-instead-of-document)

<!-- tocstop -->

## Individual need

How does the documented process affect the reader as a person? What role do they play in it? Make sure these are immediately outlined in the first couple of sections.

When you document a process for an engineer, why should they care? No matter the business importance, without motivation, tasks will be routinely delayed or ignored.

**Example:** submitting time sheets in a consulting business. If it's not done every Friday or Monday, accuracy will inevitably drop - and you can forget about any useful task notes. This isn't immediately important for an engineer: they aren't involved in business metrics, or billing, or the managerial tasks of explaining to the client what their hours have been spent on. What an engineer does care about, though, is their bonus, utilization, and future project assignments. A better explanation is: *time sheets give the business visibility into past utilization and availability for future projects. Allocation alone is a poor indicator of time use.*

## Use your silly voice

People like humour. That's why for every piece of process or documentation I write in a professional setting, I add a touch of fun:

1. In the top-right corner, you'll generally see a haiku. It doesn't have to be good, it doesn't have to make sense, it doesn't have to take long: it takes the edge off the daily routine. If I was of a different generation, I'd probably use a meme instead: that's just another approach to the same problem; just make sure you're not overdoing it.
1. When I start initiatives, I spend the first 30 minutes by generating:
    1. An acronym for it. I'd quote some, but they're past employers' property now. I will, however, outline my process for coming up with them in the following section.
    1. A logo. I build this in [Pixlr](https://pixlr.com/editor/) because it's free and fast. Make a background shape, add some relevant transparent clipart you found on Google Images, change some colours, and you're good to go!

### How to come up with an acronym

It's simple:

1. Brainstorm a list of all words relevant to your initiative that you can think of.
1. Can you use any of the words in the list as an acronym? If you're close on one, spread it out vertically letter by letter, and fill it out. Try to make a sensible sentence.

Hints:

* [Predictable words](https://english.stackexchange.com/questions/458089/is-there-a-list-of-words-that-dont-need-their-own-letters-in-an-acronym) (or really, any words you choose) may not be included in the acronym. Or include some and skip others, depending on your own imposed difficulty level.
* You may use multiple first letters from a given word.
* Use and abuse ChatGPT for some of the brainstorming. You can also try it for the entire process, but as of writing it provides invalid results most of the time.

As an example, this took me ten minutes to come up with:

![READABLE acronym](/assets/posts/documentation.png)

## Simple structure and flow

Make sure your writing is easy to follow:

- Are you providing examples?
- Are you using bullet points instead of large paragraphs?
- Do you prioritize most frequently-used information on top?
- Do you have a table of contents that shows flow?
    - Google Docs and Confluence have built-in generators for TOCs. For Markdown, I use [a lightly modified version of markdown-toc](https://github.com/slavaaaaaaaaaa/markdown-toc)
- When generating documentation with AI, are you pre-feeding it your voice by submitting past writings?

## Automate instead of document

Lastly, instead of going through the trouble of documenting a process well, consider two forms of automation:

* [Do-nothing code](https://blog.danslimmon.com/2019/07/15/do-nothing-scripting-the-key-to-gradual-automation/) is an excellent alternative to **some** process documentation.
* [Zapier](https://zapier.com/) is a great way to automate some or all steps of certain processes, but functionality is is very limited. I was able to automate numerous manual tasks through a mixed use of Zapier and home-brewn microservices at my last company.
* Simplification: time sheets at my previous company were too much effort to automate, but I did write a [time calculator](https://github.com/slavaaaaaaaaaa/cal-calc) that pulled meetings data out of Google Calendar and spit out the time use for the previous week.