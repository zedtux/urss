class Urss::Media

  # ~~~~ Attributes ~~~~
  attr_accessor :content_url, :title, :thumbnail_url

  # ~~~~ Class methods ~~~~

  # ~~~~ Instance methods ~~~~
  def initialize(options={})
    self.content_url = options[:content_url] || nil
    self.title = options[:title] || nil
    self.thumbnail_url = options[:thumbnail_url] || nil
  end

  def update(nokogiri_instance)
    raise Urss::NotANokogiriInstance unless nokogiri_instance.is_a?(Nokogiri::XML::Element)

    if nokogiri_instance.attributes["url"]
      if nokogiri_instance.name == "thumbnail"
        self.thumbnail_url = nokogiri_instance.attributes["url"].value
      else
        self.content_url = nokogiri_instance.attributes["url"].value
      end
    else
      if nokogiri_instance.name == "title"
        self.title = nokogiri_instance.text
      end
    end
  end

end