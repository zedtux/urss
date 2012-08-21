class Urss::Rss

  # ~~~~ Attributes ~~~~

  # ~~~~ Class methods ~~~~
  def self.build(nokogiri_instance)
    raise Urss::NotANokogiriInstance unless nokogiri_instance.is_a?(Nokogiri::XML::Document)

    namespace = nokogiri_instance.namespaces["xmlns"] ? "xmlns:" : nil

    # Factory
    ["channel", "feed"].each do |root|
      unless (root_instance = nokogiri_instance.xpath("//#{namespace}#{root}")).empty?
        rss_object = case root
        when "channel"
          Urss::Feed::Rss
        when "feed"
          Urss::Feed::Atom
        end.build(root_instance, namespace, root)

        rss_object.finalize!

        return rss_object
        break
      end
    end
  end

  # ~~~~ Instance methods ~~~~

end