module UrssRequestStubs
  def load_request_stubs
    stub_request(:get, "http://tech.rufy.com").to_return(:status => 200, :body => File.open(File.join(File.dirname(__FILE__), "fixtures", "rss20.xml")).read, :headers => {})
    stub_request(:get, "http://www.ruby-lang.org/en/feeds/news.rss").to_return(:status => 200, :body => File.open(File.join(File.dirname(__FILE__), "fixtures", "ruby.rss")).read, :headers => {})
    stub_request(:get, "http://www.flickr.com/photos/herval/").to_return(:status => 200, :body => File.open(File.join(File.dirname(__FILE__), "fixtures", "media_rss.xml")).read, :headers => {})
    stub_request(:get, "http://waxluxembourg.com/feed/").to_return(:status => 200, :body => File.open(File.join(File.dirname(__FILE__), "fixtures", "wax.rss")).read, :headers => {})
    stub_request(:get, "http://slashdot.org/").to_return(:status => 200, :body => File.open(File.join(File.dirname(__FILE__), "fixtures", "rss09.rdf")).read, :headers => {})
    stub_request(:get, "http://example.org/feed.atom").to_return(:status => 200, :body => File.open(File.join(File.dirname(__FILE__), "fixtures", "atom.xml")).read, :headers => {})
    stub_request(:get, "http://api.flickr.com/services/feeds/photos_public.gne?format=rss_200&id=90313708@N00&lang=en-us").to_return(:status => 200, :body => File.open(File.join(File.dirname(__FILE__), "fixtures", "flickr_rss_200.xml")).read, :headers => {})
    stub_request(:get, "http://api.flickr.com/services/feeds/photos_public.gne?id=90313708@N00&lang=en-us&format=atom").to_return(:status => 200, :body => File.open(File.join(File.dirname(__FILE__), "fixtures", "flickr_atom.xml")).read, :headers => {})
    stub_request(:get, "http://api.flickr.com/services/feeds/geo/?id=90313708@N00&lang=en-us").to_return(:status => 200, :body => File.open(File.join(File.dirname(__FILE__), "fixtures", "flickr_geo.xml")).read, :headers => {})
  end
end