lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tplink_smarthome_api/version"

Gem::Specification.new do |spec|
  spec.name          = "tplink_smarthome_api"
  spec.version       = TplinkSmarthomeApi::VERSION
  spec.authors       = ["Carl Mercier"]
  spec.email         = ["foss@carlmercier.com"]

  spec.summary       = %q{A simple Ruby library to control TP-Link smart plugs}
  spec.description   = %q{A simple Ruby library to control TP-Link smart plugs}
  spec.homepage      = "https://www.github.com/cmer/tplink_smarthome_api"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "json"
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "shell_mock", "~> 0.7"
  spec.add_development_dependency "irb"
end
