# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "time_trap"
  spec.version       = "0.0.5"
  spec.authors       = ["Pat Farrell"]
  spec.email         = ["mr.patfarrell@gmail.com"]
  spec.summary       = %q{"exposes a data structure suitable for capturing and inspecting moving windows of data"}
  spec.description   = %q{"timetrap is a work in progress to create a simple data strucutre that allows for windowed inspection of counts added to a hash"}
  spec.homepage      = "https://rubygems.org/gems/time_trap"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]


  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", "~> 10.1"
  spec.add_development_dependency "rspec", "~> 2.14"
  spec.add_development_dependency "simplecov", "~> 0.8"
  spec.add_development_dependency "yard", "~> 0.8"
  spec.add_development_dependency "byebug", "~> 2.7"
  spec.add_development_dependency "markdown", "~> 1.1"
end
