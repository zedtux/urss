require "spec_helper"

describe Urss::Feed::Rss do

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
  end

  describe "Class Methods" do
    it "should respond to build" do
      subject.class.should respond_to(:build)
    end
    describe "#build" do
      describe "arguments" do
        it "should raise an ArgumentError when passing no argument" do
          lambda {
            subject.class.build
          }.should raise_error(ArgumentError)
        end
        it "should raise an Urss::NotANokogiriInstance exception when passing something different than a Nokogiri::XML::Document instance as first parameter" do
          lambda {
            subject.class.build("I'm not a Nokogiri::XML::Document instance", nil, nil)
          }.should raise_error(Urss::NotANokogiriInstance)
        end
        it "should not raise an Urss::NotANokogiriInstance when passing a Nokogiri::XML::Document instance as first parameter" do
          lambda {
            subject.class.build(Nokogiri::XML::NodeSet.new, nil, nil)
          }.should_not raise_error(Urss::NotANokogiriInstance)
        end
      end
    end
  end

  describe "Instance Methods" do
    describe "#entries" do
      context "without entries" do
        it "should return an empty array" do
          subject.entries.should be_an_instance_of(Array)
          subject.entries.should be_empty
        end
      end
      context "with entries" do
        before do
          nokogiri = Nokogiri::XML(open(File.join(File.dirname(__FILE__), "..", "..", "support", "fixtures", "rss20.xml")))
          @urss_rss = Urss::Feed::Rss.build(nokogiri.xpath("//channel"), nil, "channel")
        end
        it "should return an array of Urss::Entry" do
          @urss_rss.entries.should be_an_instance_of(Array)
          @urss_rss.entries.should_not be_empty
          @urss_rss.entries.all?{|entry| entry.should be_an_instance_of(Urss::Feed::Rss::Entry)}
        end
      end
    end
  end

end
