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

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
