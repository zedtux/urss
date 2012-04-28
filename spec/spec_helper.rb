require "simplecov"
SimpleCov.start

require "rubygems"
require "bundler/setup"

require "webmock/rspec"

require "support/webmocks"

require "urss"

RSpec.configure do |config|
  config.include UrssRequestStubs

  config.before(:each) do
    load_request_stubs
  end
end