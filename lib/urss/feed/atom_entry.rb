class Urss::Feed::Atom::Entry < Urss::Feed::Entry

  # ~~~~ Attributes ~~~~

  # ~~~~ Class methods ~~~~
  def self.build(nokogiri_instance, namespace=nil)
    raise Urss::NotANokogiriInstance unless nokogiri_instance.is_a?(Nokogiri::XML::Element)

    entry = self.new
    entry.title = nokogiri_instance.xpath("./#{namespace}title").text
    entry.url = nokogiri_instance.xpath("./#{namespace}link[@rel='alternate']").attr("href").value
    entry.created_at = nokogiri_instance.xpath("./#{namespace}published").text
    entry.author = nokogiri_instance.xpath("./#{namespace}author/#{namespace}name").text
    entry.content = case nokogiri_instance.xpath("./#{namespace}content").attr("type").value
    when "xhtml", "html"
      nokogiri_instance.xpath("./#{namespace}content").inner_html
    else
      nokogiri_instance.xpath("./#{namespace}content").text
    end

    unless (media = nokogiri_instance.xpath("./#{namespace}link[@rel='enclosure']")).empty?
      if media_url = media.attr("href").value
        entry.medias << Urss::Media.new(:content_url => media_url)
      end
    end

    entry
  end

  # ~~~~ Instance methods ~~~~

end