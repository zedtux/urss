class Urss::Feed

  # ~~~~ Attributes ~~~~
  attr_accessor :title, :url, :description, :updated_at, :entries, :author

  # ~~~~ Class methods ~~~~

  # ~~~~ Instance methods ~~~~
  def initialize
    self.title = nil
    self.url = nil
    self.description = nil
    self.updated_at = nil
    self.entries = []
    self.author = nil
  end

  def finalize!
    # Fill in all entries author field with the Feed#author content when entry author field is empty
    self.entries.each{|entry| entry.author = self.author if entry.author.nil? || entry.author == ""}
  end

end