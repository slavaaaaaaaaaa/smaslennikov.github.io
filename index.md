# I am Slava [![](https://travis-ci.org/smaslennikov/smaslennikov.github.io.svg?branch=master)](https://travis-ci.org/smaslennikov/smaslennikov.github.io)

Best way to reach me is [email](mailto:me@smaslennikov.com?Subject=beer%20time)

Pizza donations are always welcome

Here's my [resume](docs/resume.pdf)

## Notable projects

* A replacement [controller for my Litter Robot 3](https://litter-controller.smaslennikov.com/) written in C
* A website for a [chess club](https://chessand.beer) I frequent
* A website for [the Rainier fan club](https://rainier.beer)
* A website for [my cat](https://devopscat.com)
* I define frequent commands as [`make` target](https://github.com/smaslennikov/include.mk) includes
* A recent [GnuPG](https://github.com/smaslennikov/packages) version packaged for CentOS and Debian
* Not that great of a script for [migrating off PostgreSQL BDR](https://github.com/smaslennikov/smaslennikov.github.io/blob/master/bin/migrate_bdr_to_postgres.sh)
* A [devops clock](https://smaslennikov.com/whattimeisitrightmeow/), and [another](https://smaslennikov.com/whattravisisitrightmeow/)
* Some [haikus and rhymes](haikus)
* [Beer and kombucha labels](beers)
* My ongoing [book list](books)
* Some [cat pictures](https://devopscat.com/selfies)
* In emergency, [break open](in_emergency)

## Opinions

<table class="posts">
{% for post in site.posts %}
  <tr>
  {% if post.tag == "opinion" %}
    <th><li><a href="{{ post.url }}">{{ post.title }}</a></li></th>
    <th>{{ post.date | date: "%m/%d/%Y" }}</th>
  {% endif %}
  </tr>
{% endfor %}
</table>

## Reference

<table class="posts">
{% for post in site.posts %}
  <tr>
  {% if post.tag == "reference" %}
    <th><li><a href="{{ post.url }}">{{ post.title }}</a></li></th>
    <th>{{ post.date | date: "%m/%d/%Y" }}</th>
  {% endif %}
  </tr>
{% endfor %}
</table>

## City guides

<table class="posts">
{% for post in site.posts %}
  <tr>
  {% if post.tag == "guide" %}
    <th><li><a href="{{ post.url }}">{{ post.title }}</a></li></th>
  {% endif %}
  </tr>
{% endfor %}
</table>

## Presentations

* Another presentation [about secret storage](https://smaslennikov.com/sada-beer-and-learn-1/) given at SADA
* Grindr birthed
    * a presentation [about secret storage](grindr-demo-day-1) as well as
    * one about a [failed POC of GoCD](grindr-demo-day-2)
* At `NordstromRack.com|Hautelook` I produced [a presentation on a few CISSP chapters](cissp-access-mgmt-presentation/) with a partner
    * though it's not as useful without our [notes](https://github.com/smaslennikov/cissp-access-mgmt-presentation/blob/master/presentation.md)

## [Folks](https://github.com/smaslennikov/smaslennikov.github.io/blob/master/ansible/roles/dotfiles/files/.newsboat/urls)

* John Paul Hayes II and has a pretty cool [personal site and home API](https://jph2.net)
* Bryce Case makes music and talks shit on the internet like a [boss](https://ytcracker.com)
* Naftuli Kay is an engineer (not of trains), he does things [right](https://naftuli.wtf)
* James Khang was taking control of his skillset by building a [game](https://20minutesadayblog.wordpress.com)
    * ...now he's got a [blog](https://medium.com/@jahmezz)
* Jonathan M. Tran [breaks linux and messes with photos](https://blog.jonathanmtran.com/)
* Vetsin does [infosec stuff](http://0x.c0ffee.me/)
* [Jave](https://github.com/JaveLLC/) is the future of programming I collaborate on
