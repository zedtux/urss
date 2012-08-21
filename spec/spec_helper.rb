require "simplecov"
SimpleCov.start

require "rubygems"
require "bundler/setup"

# require "webmock/rspec" is not working. So:
require "webmock"
include WebMock::API

require "support/webmocks"

require "urss"

# Logging is enabled when logs/ folder exists
logs_path = "logs"
if File.exists?(logs_path)
  require "logger"
  log_file_path = File.join(logs_path, "test.log")
  FileUtils.touch(log_file_path) unless File.exists?(log_file_path)
  @@logger = Logger.new(log_file_path)
end

RSpec.configure do |config|
  
end