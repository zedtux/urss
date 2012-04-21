require "spec_helper"

describe Urss::Media do

  describe "Attributes" do
    it "should have an attribute :content_url" do
      subject.should respond_to(:content_url)
      subject.should respond_to(:content_url=)
    end

    it "should have an attribute :title" do
      subject.should respond_to(:title)
      subject.should respond_to(:title=)
    end

    it "should have an attribute :thumbnail_url" do
      subject.should respond_to(:thumbnail_url)
      subject.should respond_to(:thumbnail_url=)
    end
  end

  describe "Instance methods" do
    describe "#update" do
      it "should raise an Urss::NotANokogiriInstance exception when passing something different than a Nokogiri::XML::Element instance" do
        lambda {
          subject.update("I'm not a Nokogiri::XML::Element instance")
        }.should raise_error(Urss::NotANokogiriInstance)
      end
      it "should not raise an Urss::NotANokogiriInstance when passing a Nokogiri::XML::Element instance" do
        lambda {
          subject.update(Nokogiri::XML::Element.new("item", Nokogiri::XML::Document.new))
        }.should_not raise_error(Urss::NotANokogiriInstance)
      end
    end
  end

end
