class Urss::Feed::Atom < Urss::Feed

  # ~~~~ Attributes ~~~~

  # ~~~~ Class methods ~~~~
  def self.build(nokogiri_instance, namespace, root_node)
    raise Urss::NotANokogiriInstance unless nokogiri_instance.is_a?(Nokogiri::XML::NodeSet)
    feed_rss = self.new
    feed_rss.title = nokogiri_instance.xpath("//#{namespace}#{root_node}/title").text
    if (feed_rss.title.nil? || feed_rss.title.empty?)
      feed_rss.title = nokogiri_instance.xpath("//#{namespace}#{root_node}/#{namespace}title").text
    end
    feed_rss.url = nokogiri_instance.xpath("//#{namespace}#{root_node}/#{namespace}link[@rel='self']").attr("href").value
    feed_rss.description = nokogiri_instance.xpath("//#{namespace}#{root_node}/#{namespace}subtitle").text.strip
    feed_rss.updated_at = nokogiri_instance.xpath("//#{namespace}#{root_node}/#{namespace}updated").text
    feed_rss.author = nokogiri_instance.xpath("//#{namespace}#{root_node}/#{namespace}author/#{namespace}name").text
    nokogiri_instance.xpath("//#{namespace}entry").each {|item| feed_rss.entries << Urss::Feed::Atom::Entry.build(item, namespace)}

    feed_rss
  end

  # ~~~~ Instance methods ~~~~

end