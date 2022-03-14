# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'autocomplete_zipcode/version'

Gem::Specification.new do |spec|
  spec.name          = 'autocomplete_zipcode'
  spec.version       = AutocompleteZicode::VERSION
  spec.required_ruby_version = Gem::Requirement.new('>= 2.6')
  spec.authors       = ['Marcelo Barreto (@marcelobarreto)']
  spec.email         = ['marcelobarretojunior@gmail.com']

  spec.summary       = 'Fill in your brazillian addresses automagically'
  spec.homepage      = 'https://github.com/marcelobarreto/autocomplete_zipcode'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rails', '>= 3.1.0'

  spec.add_development_dependency 'jquery-rails', '~> 4.4.0'
  spec.add_development_dependency 'pry', '~> 0.14.0'
  spec.add_development_dependency 'rake', '~> 13.0.3'
  spec.add_development_dependency 'rspec-rails', '~> 5.0.0'
  spec.add_development_dependency 'rubocop', '~> 1.26.0'
  spec.add_development_dependency 'simplecov', '~> 0.21.2'
  spec.add_development_dependency 'simple_form', '>= 5.1.0'
  spec.add_development_dependency 'sqlite3', '~> 1.4.2'
end
