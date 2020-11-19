# I am Slava [![](https://travis-ci.org/smaslennikov/smaslennikov.github.io.svg?branch=master)](https://travis-ci.org/smaslennikov/smaslennikov.github.io)

Best way to reach me is [email](mailto:me@smaslennikov.com?Subject=beer%20time)

Pizza donations are always welcome

Here's my [resume](docs/resume.pdf)

## Notable projects

* I [wrote and built](https://litter-controller.smaslennikov.com/) a replacement controller for my Litter Robot 3
* [Here](https://chessand.beer) is a website I threw together for a chess club I frequent
* I [define](https://github.com/smaslennikov/include.mk) frequent commands as `make` target includes
* A recent [GnuPG](https://github.com/smaslennikov/packages) version packaged for CentOS
* [Here](https://github.com/smaslennikov/smaslennikov.github.io/blob/master/bin/migrate_bdr_to_postgres.sh) is a not-great script for migrating off PostgreSQL BDR
* [Here's](https://smaslennikov.com/whattimeisitrightmeow/) a devops clock I made. Here's [another](https://smaslennikov.com/whattravisisitrightmeow/)
* [Here](haikus) are some haikus and rhymes
* [Here](beers) are some of my beer and kombucha labels
* [Here](books) is my ongoing book list
* [Here](in_emergency) are some images in case of emergency

## Blog posts

<ul class="posts">
{% for post in site.posts %}
    <li><a href="{{ post.url }}">{{ post.date | date_to_long_string }}: {{ post.title }}</a></li>
{% endfor %}
</ul>


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
