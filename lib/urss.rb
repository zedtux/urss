require "urss/version"
require "open-uri"
require "nokogiri"

require "urss/rss"
require "urss/feed"
require "urss/feed/entry"
require "urss/feed/atom"
require "urss/feed/atom_entry"
require "urss/feed/rss"
require "urss/feed/rss_entry"
require "urss/media"

module Urss
  class NotANokogiriInstance < StandardError; end

  def self.at(url)
    raise ArgumentError if url.nil? || !url.is_a?(String) || url.empty?

    Rss.build(Nokogiri::XML(open(url)))
  end

end