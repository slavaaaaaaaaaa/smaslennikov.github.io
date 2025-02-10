# [I am Slava](mailto:me@slava.lol?Subject=beer%20time) ![](https://github.com/slavaaaaaaaaaa/smaslennikov.github.io/actions/workflows/pages/pages-build-deployment/badge.svg)

Check out my [resume](docs/resume.pdf)!

## Notable projects

* A replacement [controller for my Litter Robot 3](https://litter-controller.slava.lol/) written in C
* I define frequent commands as [`make` target](https://github.com/slavaaaaaaaaaa/include.mk) includes
* A recent [GnuPG](https://github.com/slavaaaaaaaaaa/packages) version packaged for CentOS and Debian
* Not that great of a script for [migrating off PostgreSQL BDR](https://github.com/slavaaaaaaaaaa/smaslennikov.github.io/blob/master/bin/migrate_bdr_to_postgres.sh)
* A [devops clock](https://slava.lol/whattimeisitrightmeow/), and [another](https://slava.lol/whattravisisitrightmeow/)

## Blog posts

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

## Websites

* [A chess club](https://chessand.beer) I frequent
* [The Rainier fan club](https://rainier.beer)
* [My cat](https://devopscat.com)

## Resources

* [Recipes](recipes)
* Some [haikus and rhymes](haikus)
* [Beer and kombucha labels](beers)
* My ongoing [book list](books)
* My [garage listing](garage)
* Some [cat pictures](https://devopscat.com/selfies)
* In emergency, [break open](in_emergency)

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

## Presentations

* Another presentation [about secret storage](https://slava.lol/sada-beer-and-learn-1/) given at SADA
* Grindr birthed
    * a presentation [about secret storage](grindr-demo-day-1) as well as
    * one about a [failed POC of GoCD](grindr-demo-day-2)
* At `NordstromRack.com|Hautelook` I produced [a presentation on a few CISSP chapters](cissp-access-mgmt-presentation/) with a partner
    * though it's not as useful without our [notes](https://github.com/slavaaaaaaaaaa/cissp-access-mgmt-presentation/blob/master/presentation.md)

## [Folks](https://github.com/slavaaaaaaaaaa/smaslennikov.github.io/blob/master/ansible/roles/dotfiles/files/.newsboat/urls)

* Ian Eusebio is kicking off his containerization knowledge through a [regular blog](https://iangge.github.io/)
* John Paul Hayes II has a pretty cool [personal site and home API](https://jph2.net)
* Bryce Case makes music and talks shit on the internet like a [boss](https://ytcracker.com)
* Naftuli Kay is an engineer (not of trains), he does things [right](https://naftuli.wtf)
* James Khang was taking control of his skillset by building a [game](https://20minutesadayblog.wordpress.com)
    * ...now he's got a [blog](https://medium.com/@jahmezz)
* Jonathan M. Tran [breaks linux and messes with photos](https://blog.jonathanmtran.com/)
* Vetsin does [infosec stuff](http://0x.c0ffee.me/)
* [Jave](https://github.com/JaveLLC/) is the future of programming I collaborate on
