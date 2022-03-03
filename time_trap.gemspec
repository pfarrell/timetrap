# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "time_trap"
  spec.version       = "0.2.0"
  spec.authors       = ["Pat Farrell"]
  spec.email         = ["mr.patfarrell@gmail.com"]
  spec.summary       = %q{TimeTrap impelents a moving window data structure for keeping track of top-k things}
  spec.description   = %q{TimeTrap is a sorted set which keeps track of the times values are added allowing for investigation of a set over time intervals.}
  spec.homepage      = "https://rubygems.org/gems/time_trap"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "bundler", ">= 2.2.33"
  spec.add_development_dependency "rake", "~> 10.1"
  spec.add_development_dependency "rspec", "~> 2.14"
  spec.add_development_dependency "simplecov", "~> 0.8"
  spec.add_dependency "yard", ">= 0.9.20"
  spec.add_development_dependency "byebug", "~> 2.7"
  spec.add_development_dependency "markdown", "~> 1.1"
end
