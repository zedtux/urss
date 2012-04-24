# Urss [![Build Status](https://secure.travis-ci.org/zedtux/urss.png)](http://travis-ci.org/zedtux/urss) [![Dependency Status](https://gemnasium.com/zedtux/urss.png)](http://gemnasium.com/zedtux/urss)

URSS or Ultra RSS is another ruby library to parse Feed RSS that has been created because there was no existing one that support multiple media:content or media:thumbnail.

## Installation

Add this line to your application's Gemfile:

    gem 'urss'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install urss

## Usage

### Simple RSS

````ruby
rss = Urss.at("http://www.ruby-lang.org/en/feeds/news.rss")
rss.title
#=> "Ruby News"
rss.url
#=> "http://www.ruby-lang.org/en/feeds/news.rss/"
rss.description
#=> "The latest news from Ruby-Lang.org."
rss.updated_at
#=> ""
rss.entries.size
#=> 10
rss.entries.first.title
#=> "Ruby 1.9.3-p194 is released"
rss.entries.first.created_at
#=> "Fri, 20 Apr 2012 03:19:04 GMT"
rss.entries.first.url
#=> "http://www.ruby-lang.org/en/news/2012/04/20/ruby-1-9-3-p194-is-released/"
rss.entries.first.content.truncate(200)
#=> "<p>Ruby 1.9.2-p320 is released.</p><p>This release include Security Fix for RubyGems: SSL server verification failure for remote repository.\nAnd many bugs are fixed in this release.</p> <h2><a name..."
````

### RSS With medias

````ruby
rss = Urss.at("http://api.flickr.com/services/feeds/photos_public.gne?id=90313708@N00&lang=en-us&format=rss_200")
rss.title
#=> "Uploads from CoolbieRe"
rss.updated_at
#=> "Mon, 23 Apr 2012 09:48:57 -0700"
rss.entries.first.title
#=> "vertical panorama"
rss.entries.first.medias.size
#=> 1
rss.entries.first.medias.first.title
#=> "vertical panorama"
rss.entries.first.medias.first.thumbnail_url
#=> http://farm9.staticflickr.com/8159/6960539484_56665aba46_s.jpg
rss.entries.first.medias.first.content_url
#=> http://farm9.staticflickr.com/8159/6960539484_56665aba46_b.jpg
````

### Atom With medias

````ruby
rss = Urss.at("http://api.flickr.com/services/feeds/photos_public.gne?id=90313708@N00&lang=en-us&format=atom")
rss.title
#=> "Uploads from CoolbieRe"
rss.updated_at
#=> "2012-04-23T16:48:57Z"
rss.entries.first.title
#=> "vertical panorama"
rss.entries.first.medias.size
#=> 1
rss.entries.first.medias.first.title
#=> nil
rss.entries.first.medias.first.thumbnail_url
#=> nil
rss.entries.first.medias.first.content_url
#=> http://farm9.staticflickr.com/8159/6960539484_56665aba46_b.jpg
````

## Reporting not working Feed

If you encounter a Feed (RSS or Atom) where an attribute is not well parsed: Open an issue with a dump of the feed.

You can use `curl` to do this and post the output (Use [gists](https://gist.github.com/) if it is very long).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
