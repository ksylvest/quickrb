$LOAD_PATH.push File.join(File.dirname(__FILE__), 'lib')
require 'quickrb/version'

Gem::Specification.new do |spec|
  spec.name = 'QuickRB'
  spec.version = QuickRB::VERSION
  spec.authors = ['Kevin Sylvestre']
  spec.email = ['kevin@ksylvest.com']
  spec.files = Dir.glob('{bin,lib,vendor}/**/*') + %w[README.md LICENSE Gemfile]

  spec.summary = 'Embedded QuickJS for Ruby'
  spec.description = 'An embedded QuickJS engine for Ruby'

  spec.license = 'MIT'

  spec.extensions = ['ext/quickrb/extconf.rb']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rake-compiler'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-rspec'
end
