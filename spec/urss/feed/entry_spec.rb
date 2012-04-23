require "spec_helper"

describe Urss::Feed::Entry do

  describe "Attributes" do
    it "should have an attribute :title" do
      subject.should respond_to(:title)
      subject.should respond_to(:title=)
    end

    it "should have an attribute :url" do
      subject.should respond_to(:url)
      subject.should respond_to(:url=)
    end

    it "should have an attribute :comments_url" do
      subject.should respond_to(:comments_url)
      subject.should respond_to(:comments_url=)
    end

    it "should have an attribute :created_at" do
      subject.should respond_to(:created_at)
      subject.should respond_to(:created_at=)
    end

    it "should have an attribute :author" do
      subject.should respond_to(:author)
      subject.should respond_to(:author=)
    end

    it "should have an attribute :categories" do
      subject.should respond_to(:categories)
      subject.should respond_to(:categories=)
    end

    it "should have an attribute :content" do
      subject.should respond_to(:content)
      subject.should respond_to(:content=)
    end
  end

end
