# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ost-sdk-ruby/version'

Gem::Specification.new do |spec|

  spec.name          = "ost-sdk-ruby"
  spec.version       = OSTSdk::VERSION
  spec.authors       = ['OST.com Inc.']
  spec.email         = []
  spec.summary       = 'OST Ruby SDK'
  spec.description   = 'OST Platform SDK for Ruby'
  spec.homepage      = "https://platform.ost.com"
  spec.license       = "MIT"
  spec.metadata      = {
                        "documentation_uri" => "https://dev.ost.com"
                      }

  spec.files         = Dir['{lib}/**/*']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "test-unit", "3.2.9"

  spec.add_development_dependency "bundler", "2.0.1"

end
