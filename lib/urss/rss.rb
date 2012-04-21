class Urss::Rss

  # ~~~~ Attributes ~~~~
  attr_accessor :title, :url, :description, :updated_at, :entries

  # ~~~~ Class methods ~~~~
  def self.build(nokogiri_instance)
    raise Urss::NotANokogiriInstance unless nokogiri_instance.is_a?(Nokogiri::XML::Document)

    namespace = nokogiri_instance.namespaces["xmlns"] ? "xmlns:" : nil

    rss = self.new
    rss.title = nokogiri_instance.xpath("//#{namespace}channel/#{namespace}title").text
    rss.url = nokogiri_instance.xpath("//#{namespace}channel/#{namespace}link").text
    rss.description = nokogiri_instance.xpath("//#{namespace}channel/#{namespace}description").text
    rss.updated_at = nokogiri_instance.xpath("//#{namespace}channel/#{namespace}pubDate").text
    if rss.updated_at.nil? || rss.updated_at.empty?
      begin
        rss.updated_at = nokogiri_instance.xpath("//#{namespace}channel/dc:date").text
      rescue Nokogiri::XML::XPath::SyntaxError
        # No pubDate or date field
      end
    end
    nokogiri_instance.xpath("//#{namespace}item").each {|item| rss.entries << Urss::Entry.build(item, namespace)}

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