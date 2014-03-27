# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "time_trap"
  spec.version       = "0.0.3"
  spec.authors       = ["Pat Farrell"]
  spec.email         = ["mr.patfarrell@gmail.com"]
  spec.summary       = %q{"exposes a data structure suitable for capturing and inspecting moving windows of data"}
  spec.description   = %q{"timetrap is a work in progress to create a simple data strucutre that allows for windowed inspection of counts added to a hash"}
  spec.homepage      = "http://github.com/pfarrell/timetrap"
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
  spec.add_development_dependency "markdown"
end
