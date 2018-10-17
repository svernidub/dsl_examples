# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dsl_examples/version'

Gem::Specification.new do |spec|
  spec.name          = 'dsl_examples'
  spec.version       = DslExamples::VERSION
  spec.authors       = %w(Sergey Vernidub)
  spec.email         = %w(svernidub@gmail.com)

  spec.summary       = 'Simple examples of Ruby DSL'
  spec.description   = 'Simple DSL implementations in Ruby'
  spec.license       = 'MIT'

  spec.require_paths = %w(lib)

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "http://example.com"
  else
    e = 'RubyGems 2.0 or newer is required to protect against public gem pushes'
    raise e
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake',    '~> 10.0'
  spec.add_development_dependency 'pry'
end
