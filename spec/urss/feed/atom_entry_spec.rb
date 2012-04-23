require "spec_helper"

describe Urss::Feed::Atom::Entry do

  describe "Class Methods" do
    describe "#build" do
      describe "argument" do
        it "should raise an Urss::NotANokogiriInstance exception when passing something different than a Nokogiri::XML::Element instance" do
          lambda {
            subject.class.build("I'm not a Nokogiri::XML::Element instance")
          }.should raise_error(Urss::NotANokogiriInstance)
        end
        it "should not raise an Urss::NotANokogiriInstance when passing a Nokogiri::XML::Element instance" do
          lambda {
            subject.class.build(Nokogiri::XML::Element.new("item", Nokogiri::XML::Document.new))
          }.should_not raise_error(Urss::NotANokogiriInstance)
        end
      end
    end
  end

end
