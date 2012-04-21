# encoding: utf-8
require "spec_helper"

describe Urss do
  
  it "should respond to at method" do
    subject.should respond_to(:at)
  end
  describe "#at" do
    describe "argument" do
      context "when passing a string of a URL" do
        it "should accept it" do
          lambda {
            subject.at("http://tech.rufy.com")
          }.should_not raise_error
        end
      end
      context "when passing an empty string" do
        it "should raise an ArgumentError" do
          lambda {
            subject.at("")
          }.should raise_error(ArgumentError)
        end
      end
      context "when passing nil" do
        it "should raise an ArgumentError" do
          lambda {
            subject.at(nil)
          }.should raise_error(ArgumentError)
        end
      end
      context "when passing a Fixnum" do
        it "should raise an ArgumentError" do
          lambda {
            subject.at(1)
          }.should raise_error(ArgumentError)
        end
      end
      context "when passing a Hash" do
        it "should raise an ArgumentError" do
          lambda {
            subject.at({})
          }.should raise_error(ArgumentError)
        end
      end
      context "when passing a Array" do
        it "should raise an ArgumentError" do
          lambda {
            subject.at([])
          }.should raise_error(ArgumentError)
        end
      end
    end

    context "RSS 2.0" do
      context "when parsing the rss20.xml example file at http://tech.rufy.com" do
        before { @parsed_rss = subject.at("http://tech.rufy.com") }
        it "should return an instance of Urss::Rss" do
          @parsed_rss.should be_an_instance_of(Urss::Rss)
        end
        describe "Urss::Rss" do
          describe "title" do
            it "should return \"Technoblog\"" do
              @parsed_rss.title.should == "Technoblog"
            end
          end
          describe "url" do
            it "should return \"http://tech.rufy.com\"" do
              @parsed_rss.url.should == "http://tech.rufy.com"
            end
          end
          describe "description" do
            it "should return \"Lucas Carlson's jounal of the technical ramblings. Contains tutorials, howto's, and rants and ravings.\"" do
              @parsed_rss.description.should == "Lucas Carlson's jounal of the technical ramblings. Contains tutorials, howto's, and rants and ravings."
            end
          end
          describe "updated_at" do
            it "should return \"Thu, 25 Aug 2005 00:16:16 +0000\"" do
              @parsed_rss.updated_at.should == "Thu, 25 Aug 2005 00:16:16 +0000"
            end
          end
          describe"entries" do
            describe "size" do
              it "should be 10" do
                @parsed_rss.entries.size.should be 10
              end
            end
            describe "first" do
              before { @first_parsed_rss = @parsed_rss.entries.first }
              describe "title" do
                it "should return \"some_string.starts_with? “Foo” || some_string.ends_with? “bar.”\"" do
                  @first_parsed_rss.title.should == "some_string.starts_with? “Foo” || some_string.ends_with? “bar.”"
                end
              end
              describe "url" do
                it "should return \"http://feeds.feedburner.com/rufytech?m=68\"" do
                  @first_parsed_rss.url.should == "http://feeds.feedburner.com/rufytech?m=68"
                end
              end
              describe "comments_url" do
                it "should return \"http://tech.rufy.com/entry/82#comments\"" do
                  @first_parsed_rss.comments_url.should == "http://tech.rufy.com/entry/82#comments"
                end
              end
              describe "created_at" do
                it "should return \"Wed, 24 Aug 2005 13:33:34 +0000\"" do
                  @first_parsed_rss.created_at.should == "Wed, 24 Aug 2005 13:33:34 +0000"
                end
              end
              describe "author" do
                it "should return \"Lucas Carlson\"" do
                  @first_parsed_rss.author.should == "Lucas Carlson"
                end
              end
              describe "categories" do
                it "should return \"Programming, Ruby\"" do
                  @first_parsed_rss.categories.should == "Programming, Ruby"
                end
              end
              describe "content" do
                it "should return the description content" do
                  @first_parsed_rss.content.should ==
                  """I also liked:


x = s.startswith('Go')
x = s.endswith('Go')


So I made:


class String
  def starts_with?(str)
    self.index( str ) == 0
  end

  def ends_with?(str)
    self.rindex( str ) == self.length - str.length
  end
end


So you can do this:


some_string.starts_with? 'Foo' || some_string.ends_with? 'bar.'"""
                end
              end
            end
            describe "last" do
              before { @last_parsed_rss = @parsed_rss.entries.last }
              describe "title" do
                it "should return \"A wish: Abolition of passing data with flags and symbol-like options when calling Unix programs\"" do
                  @last_parsed_rss.title.should == "A wish: Abolition of passing data with flags and symbol-like options when calling Unix programs"
                end
              end
              describe "url" do
                it "should return \"http://feeds.feedburner.com/rufytech?m=59\"" do
                  @last_parsed_rss.url.should == "http://feeds.feedburner.com/rufytech?m=59"
                end
              end
              describe "comments_url" do
                it "should return \"http://tech.rufy.com/entry/73#comments\"" do
                  @last_parsed_rss.comments_url.should == "http://tech.rufy.com/entry/73#comments"
                end
              end
              describe "created_at" do
                it "should return \"Tue, 19 Jul 2005 00:16:03 +0000\"" do
                  @last_parsed_rss.created_at.should == "Tue, 19 Jul 2005 00:16:03 +0000"
                end
              end
              describe "author" do
                it "should return \"Lucas Carlson\"" do
                  @last_parsed_rss.author.should == "Lucas Carlson"
                end
              end
              describe "categories" do
                it "should return \"Programming, Ruby\"" do
                  @last_parsed_rss.categories.should == "General"
                end
              end
              describe "content" do
                it "should return the description content" do
                  @last_parsed_rss.content.should ==
                  """I wish I could call every program on the command line like this:

mysql -v :user foo :password bar :host rufy.com :port 3306

For me, this is much easier to type than what I would currently need to do:

mysql -v --user foo --password bar --host rufy.com --port 3306

The difference between -- and : is huge for me [...]"""
                end
              end
            end
          end
        end
      end
    end
  end

  describe "check README.md example" do
    it "should not failed! =)" do
      rss = Urss.at("http://www.ruby-lang.org/en/feeds/news.rss")
      rss.title.should == "Ruby News"
      rss.url.should == "http://www.ruby-lang.org/en/feeds/news.rss/"
      rss.description.should == "The latest news from Ruby-Lang.org."
      rss.updated_at.should be_empty
      rss.entries.size.should be 10
      rss.entries.first.title.should == "Ruby 1.9.3-p194 is released"
      rss.entries.first.created_at.should == "Fri, 20 Apr 2012 03:19:04 GMT"
      rss.entries.first.url.should == "http://www.ruby-lang.org/en/news/2012/04/20/ruby-1-9-3-p194-is-released/"
      rss.entries.first.content.should ==
      """<p>Ruby 1.9.3-p194 is released.</p><p>This release include Security Fix for RubyGems: SSL server verification failure for remote repository.
And many bugs are fixed in this release.</p> <h2><a name=\"label-0\" id=\"label-0\">Security Fix for RubyGems: SSL server verification failure for remote repository</a></h2><!-- RDLabel: \"Security Fix for RubyGems: SSL server verification failure for remote repository\" --><p>This release includes two security fixes in RubyGems.</p><ul>
<li>Turn on verification of server SSL certs</li>
<li>Disallow redirects from https to http</li>
</ul><p>Users who uses https source in .gemrc or /etc/gemrc are encouraged to
upgrade to 1.9.3-p194.</p><p>Following is excerpted from RubyGems 1.8.23 release note [1].</p><p>\"This release increases the security used when RubyGems is talking to
an https server. If you use a custom RubyGems server over SSL, this
release will cause RubyGems to no longer connect unless your SSL cert
is globally valid.</p><p>You can configure SSL certificate usage in RubyGems through the :ssl_ca_cert and :ssl_verify_mode options in ~/.gemrc and /etc/gemrc.
The recommended way is to set :ssl_ca_cert to the CA certificate for
your server or a certificate bundle containing your CA certification.</p><p>You may also set :ssl_verify_mode to 0 to completely disable SSL
certificate checks, but this is not recommended.\"</p><p>Credit to John Firebaugh for reporting this issue.</p><p>[1] <a href=\"https://github.com/rubygems/rubygems/blob/1.8/History.txt\">&lt;URL:https://github.com/rubygems/rubygems/blob/1.8/History.txt&gt;</a></p><h2><a name=\"label-1\" id=\"label-1\">Fixes</a></h2><!-- RDLabel: \"Fixes\" --><ul>
<li>Security Fix for RubyGems: SSL server verification failure for remote repository</li>
<li>other bug fixes</li>
</ul><p>See <a href=\"https://bugs.ruby-lang.org/projects/ruby-193/issues?set_filter=1&amp;status_id=5\">tickets</a> and <a href=\"http://svn.ruby-lang.org/repos/ruby/tags/v1_9_3_194/ChangeLog\">ChangeLog</a> for details.</p><h2><a name=\"label-2\" id=\"label-2\">Downloads</a></h2><!-- RDLabel: \"Downloads\" --><ul>
<li><a href=\"http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.tar.bz2\">&lt;URL:http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.tar.bz2&gt;</a>
<ul>
<li>SIZE:   9841223 bytes</li>
<li>MD5:    2278eff4cfed3cbc0653bc73085caa34</li>
<li>SHA256: a9d1ea9eaea075c60048369a63b35b3b5a06a30aa214a3d990e0bb71212db8fa</li>
</ul></li>
<li><a href=\"http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.tar.gz\">&lt;URL:http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.tar.gz&gt;</a>
<ul>
<li>SIZE:   12432239 bytes</li>
<li>MD5:    bc0c715c69da4d1d8bd57069c19f6c0e</li>
<li>SHA256: 46e2fa80be7efed51bd9cdc529d1fe22ebc7567ee0f91db4ab855438cf4bd8bb</li>
</ul></li>
<li><a href=\"http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.zip\">&lt;URL:http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.zip&gt;</a>
<ul>
<li>SIZE:   13898712 bytes</li>
<li>MD5:    77e67b15234e442d4a3dcc450bc70fea</li>
<li>SHA256: 77474cfb92385b3a0b4c346553048bc65bfe68d4f220128329671a0234cb124d</li>
</ul></li>
</ul>"""
    end
  end
end