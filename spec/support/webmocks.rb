stub_request(:get, "http://tech.rufy.com").to_return(:status => 200, :body => File.open(File.join(File.dirname(__FILE__), "fixtures", "rss20.xml")).read, :headers => {})
stub_request(:get, "http://www.ruby-lang.org/en/feeds/news.rss").to_return(:status => 200, :body => File.open(File.join(File.dirname(__FILE__), "fixtures", "ruby.rss")).read, :headers => {})
stub_request(:get, "http://www.flickr.com/photos/herval/").to_return(:status => 200, :body => File.open(File.join(File.dirname(__FILE__), "fixtures", "media_rss.xml")).read, :headers => {})
stub_request(:get, "http://waxluxembourg.com/feed/").to_return(:status => 200, :body => File.open(File.join(File.dirname(__FILE__), "fixtures", "wax.rss")).read, :headers => {})
stub_request(:get, "http://slashdot.org/").to_return(:status => 200, :body => File.open(File.join(File.dirname(__FILE__), "fixtures", "rss09.rdf")).read, :headers => {})