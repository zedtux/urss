# -*- encoding: utf-8 -*-
require File.expand_path('../lib/urss/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["zedtux"]
  gem.email         = ["zedtux@zedroot.org"]
  gem.description   = %q{Ultra RSS is a Feed RSS parser that support multiple subitems (media:content and media:thumbnail)}
  gem.summary       = %q{Ultra RSS is a Feed RSS parser.}
  gem.homepage      = "https://github.com/zedtux/urss"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "urss"
  gem.require_paths = ["lib"]
  gem.version       = Urss::VERSION

  gem.add_dependency "nokogiri"
end