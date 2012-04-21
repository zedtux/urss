class Urss::Entry

  # ~~~~ Attributes ~~~~
  attr_accessor :title, :url, :comments_url, :created_at, :author, :categories, :content

  # ~~~~ Class methods ~~~~
  def self.build(nokogiri_instance)
    raise Urss::NotANokogiriInstance unless nokogiri_instance.is_a?(Nokogiri::XML::Element)

    entry = self.new
    entry.title = nokogiri_instance.xpath(".//*[local-name()='title']").text
    entry.url = nokogiri_instance.xpath(".//*[local-name()='link']").text
    entry.comments_url = nokogiri_instance.xpath(".//*[local-name()='comments']").text
    entry.created_at = nokogiri_instance.xpath(".//*[local-name()='pubDate']").text
    entry.author = nokogiri_instance.xpath(".//*[local-name()='creator']").text
    entry.categories = nokogiri_instance.search("category").collect(&:text).join(", ")
    entry.content = nokogiri_instance.xpath(".//*[local-name()='description']").text

    entry
  end

  # ~~~~ Instance methods ~~~~
  def initialize
    self.title = nil
    self.url = nil
    self.comments_url = nil
    self.created_at = nil
    self.author = nil
    self.categories = []
    self.content = nil
  end

end