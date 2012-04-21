require "simplecov"
SimpleCov.start

require "rubygems"
require "bundler/setup"

# require "webmock/rspec" is not working. So:
require "webmock"
include WebMock::API

require "support/webmocks"

require "urss"

RSpec.configure do |config|
  
end