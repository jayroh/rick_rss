# RickRss

This exists because there's gold in them feeds, and I want to boss the RSS around

![](http://wpcurve-wpengine.netdna-ssl.com/wp-content/uploads/2015/05/DP-RR.jpg)

RickRss is a CLI utility that consumes, archives, displays, and searches rss feeds of your choosing.

## Requirements

Some sort of database. Set up your credentials with an environment variable like so:

```
RICK_RSS_DB="sqlite://~/.rick_rss.db"
RICK_RSS_DB="mysql://root@localhost/rick_rss")
RICK_RSS_DB="postgresql://root@localhost/rick_rss")
```

Set everything up:

```
rick install
```

## TODO

- [x] `rick install` set up the tables in your database
- [ ] config: define feeds that need monitoring
- [ ] `rick rss start` poll your feeds
- [ ] `rick rss stop` stop polling
- [ ] `rick latest` display list of recent blog posts
