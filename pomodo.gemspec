lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pomodo/version"

Gem::Specification.new do |spec|
  spec.name          = "pomodo"
  spec.version       = Pomodo::VERSION
  spec.authors       = ["Pierre-Arnaud Baciocchini"]
  spec.email         = ["pierre.baciocchini@gmail.com"]

  spec.summary       = %q{Simple pomodoro CLI tool with Luxafor Flag support}
  spec.homepage      = "https://github.com/prrrnd/pomodo"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "http://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "luxafor"
end
