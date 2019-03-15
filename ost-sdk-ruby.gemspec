# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ost-sdk-ruby/version'

Gem::Specification.new do |spec|

  spec.name          = "ost-sdk-ruby"
  spec.version       = OSTSdk::VERSION
  spec.authors       = ['OST.COM LTD.']
  spec.email         = []
  spec.summary       = 'OST Ruby SDK'
  spec.description   = 'The official OST Ruby SDK'
  spec.homepage      = "https://kit.ost.com"
  spec.license       = "MIT"
  spec.metadata      = {
                        "documentation_uri" => "https://dev.ost.com"
                      }

  spec.files         = Dir['{lib}/**/*']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "test-unit", "3.2.9"

  spec.add_development_dependency "bundler", "~> 1.6"

end
