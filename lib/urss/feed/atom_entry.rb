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
    entry.content = nokogiri_instance.xpath("./description").text

    begin
      # When having only one media:content then all media:* nodes are used to create one Urss::Media
      # Otherwise each media:* are different Urss::Media
      single_media = nokogiri_instance.xpath("./media:content").size == 1
      media = nil
      nokogiri_instance.xpath("./media:*").each do |media_attributes|
        if single_media
          media = Urss::Media.new if media.nil?
          media.update(media_attributes)
        else
          media = Urss::Media.new
          media.update(media_attributes)
          media_attributes.children.select{|child| child.class == Nokogiri::XML::Element}.each do |element|
            media.update(element)
          end
          entry.medias << media
        end
      end
      entry.medias << media if single_media
    rescue Nokogiri::XML::XPath::SyntaxError
      # No media element
    end

    entry
  end

  # ~~~~ Instance methods ~~~~

end