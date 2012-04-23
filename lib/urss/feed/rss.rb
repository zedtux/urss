class Urss::Feed::Rss < Urss::Feed

  # ~~~~ Attributes ~~~~

  # ~~~~ Class methods ~~~~
  def self.build(nokogiri_instance, namespace, root_node)
    raise Urss::NotANokogiriInstance unless nokogiri_instance.is_a?(Nokogiri::XML::NodeSet)
    feed_rss = self.new
    feed_rss.title = nokogiri_instance.xpath("//#{namespace}#{root_node}/#{namespace}title").text
    feed_rss.url = nokogiri_instance.xpath("//#{namespace}#{root_node}/#{namespace}link").text
    feed_rss.description = nokogiri_instance.xpath("//#{namespace}#{root_node}/#{namespace}description").text
    feed_rss.updated_at = nokogiri_instance.xpath("//#{namespace}#{root_node}/#{namespace}pubDate").text
    if feed_rss.updated_at.nil? || feed_rss.updated_at.empty?
      begin
        feed_rss.updated_at = nokogiri_instance.xpath("//#{namespace}#{root_node}/dc:date").text
      rescue Nokogiri::XML::XPath::SyntaxError
        # No pubDate or date field
      end
    end
    nokogiri_instance.xpath("//#{namespace}item").each {|item| feed_rss.entries << Urss::Feed::Rss::Entry.build(item, namespace)}

    feed_rss
  end

  # ~~~~ Instance methods ~~~~

end