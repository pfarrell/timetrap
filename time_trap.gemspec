# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'timetrap/version'

Gem::Specification.new do |spec|
  spec.name          = "timetrap"
  spec.version       = Timetrap::VERSION
  spec.authors       = ["Pat Farrell"]
  spec.email         = ["pfarrell@ulive.com"]
  spec.summary       = %q{"exposes a data structure suitable for capturing and inspecting moving windows of data"}
  spec.description   = %q{"timetrap is a work in progress to create a simple data strucutre that allows for windowed inspection of counts added to a hash"}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]


  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "yard"
  spec.add_development_dependency "byebug"
end
