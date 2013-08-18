# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'release_notes/version'

Gem::Specification.new do |spec|
  spec.name          = "release_notes"
  spec.version       = ReleaseNotes::VERSION
  spec.authors       = ["Seth Call"]
  spec.email         = ["sethcall@gmail.com"]
  spec.description   = %q{Generates release notes from Jenkins/JIRA/Git}
  spec.summary       = %q{Using Jenkins/Jira/Git as data sources, generates release notes}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
