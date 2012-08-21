require "spec_helper"

describe Urss::Feed do

  describe "Attributes" do
    it "should have an attribute :title" do
      subject.should respond_to(:title)
      subject.should respond_to(:title=)
    end

    it "should have an attribute :url" do
      subject.should respond_to(:url)
      subject.should respond_to(:url=)
    end

    it "should have an attribute :description" do
      subject.should respond_to(:description)
      subject.should respond_to(:description=)
    end

    it "should have an attribute :updated_at" do
      subject.should respond_to(:updated_at)
      subject.should respond_to(:updated_at=)
    end

    it "should have an attribute :entries" do
      subject.should respond_to(:entries)
      subject.should respond_to(:entries=)
    end

    it "should have an attribute :author" do
      subject.should respond_to(:author)
      subject.should respond_to(:author=)
    end
  end

end