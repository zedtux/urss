require "urss/version"
require "open-uri"
require "nokogiri"

require "urss/rss"
require "urss/entry"

module Urss
  class NotANokogiriInstance < StandardError; end

  def self.at(url)
    raise ArgumentError if url.nil? || !url.is_a?(String) || url.empty?

    Rss.build(Nokogiri::XML(open(url)))
  end

end