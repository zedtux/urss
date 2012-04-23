require "spec_helper"

describe Urss::Rss do

  describe "Class Methods" do
    it "should respond to build" do
      subject.class.should respond_to(:build)
    end
    describe "#build" do
      describe "argument" do
        it "should raise an Urss::NotANokogiriInstance exception when passing something different than a Nokogiri::XML::Document instance" do
          lambda {
            subject.class.build("I'm not a Nokogiri::XML::Document instance")
          }.should raise_error(Urss::NotANokogiriInstance)
        end
        it "should not raise an Urss::NotANokogiriInstance when passing a Nokogiri::XML::Document instance" do
          lambda {
            subject.class.build(Nokogiri::XML::Document.new)
          }.should_not raise_error
        end
      end
    end
  end

end