# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'autocomplete_zipcode/version'

Gem::Specification.new do |spec|
  spec.name          = "autocomplete_zipcode"
  spec.version       = AutocompleteZicode::VERSION
  spec.authors       = ["Marcelo Barreto"]
  spec.email         = ["marcelobarretojunior@gmail.com"]

  spec.summary       = %q{Fill in your brazilian addresses automagically}
  spec.homepage      = "https://github.com/marcelobarreto/autocomplete_zipcode"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.1"
  spec.add_development_dependency "rake", "~> 10.0"
  #spec.add_runtime_dependency 'rails-assets-jquery'
end
