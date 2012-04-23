class Urss::Feed

  # ~~~~ Attributes ~~~~
  attr_accessor :title, :url, :description, :updated_at, :entries

  # ~~~~ Class methods ~~~~

  # ~~~~ Instance methods ~~~~
  def initialize
    self.title = nil
    self.url = nil
    self.description = nil
    self.updated_at = nil
    self.entries = []
  end

end