require "spec_helper"

describe Urss::Feed::Atom do

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
          nokogiri = Nokogiri::XML(open(File.join(File.dirname(__FILE__), "..", "support", "fixtures", "atom.xml")))
          @urss_rss = Urss::Feed::Atom.build(nokogiri.xpath("//xmlns:feed"), "xmlns:", "feed")
        end
        it "should return an array of Urss::Entry" do
          @urss_rss.entries.should be_an_instance_of(Array)
          @urss_rss.entries.should_not be_empty
          @urss_rss.entries.all?{|entry| entry.should be_an_instance_of(Urss::Feed::Atom::Entry)}
        end
      end
    end
  end

end