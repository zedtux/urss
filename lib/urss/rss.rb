class Urss::Rss

  # ~~~~ Attributes ~~~~
  attr_accessor :title, :url, :description, :updated_at, :entries

  # ~~~~ Class methods ~~~~
  def self.build(nokogiri_instance)
    raise Urss::NotANokogiriInstance unless nokogiri_instance.is_a?(Nokogiri::XML::Document)

    rss = self.new
    rss.title = nokogiri_instance.xpath("//channel/*[local-name()='title']").text
    rss.url = nokogiri_instance.xpath("//channel/*[local-name()='link']").text
    rss.description = nokogiri_instance.xpath("//channel/*[local-name()='description']").text
    rss.updated_at = nokogiri_instance.xpath("//channel/*[local-name()='pubDate']").text

    nokogiri_instance.xpath("//item").each {|item| rss.entries << Urss::Entry.build(item)}

    rss
  end

  # ~~~~ Instance methods ~~~~
  def initialize
    self.title = nil
    self.url = nil
    self.description = nil
    self.updated_at = nil
    self.entries = []
  end

end