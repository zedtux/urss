class Urss::Feed::Entry

  # ~~~~ Attributes ~~~~
  attr_accessor :title, :url, :comments_url, :created_at, :author, :categories, :content, :medias

  # ~~~~ Class methods ~~~~

  # ~~~~ Instance methods ~~~~
  def initialize
    self.title = nil
    self.url = nil
    self.comments_url = nil
    self.created_at = nil
    self.author = nil
    self.categories = []
    self.content = nil
    self.medias = []
  end

end