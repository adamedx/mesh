# -*- encoding: utf-8 -*-
$:.push File.expand_path("./lib", __FILE__)
require "./lib/version"

Gem::Specification.new do |s|
  s.name        = "mesh"
  s.version     = Mesh::VERSION
  s.platform    = Gem::Platform::RUBY
  s.has_rdoc = false
#  s.extra_rdoc_files = ["README.rdoc", "LICENSE" ]
  s.authors     = ["Adam Edwards"]
  s.email       = ["adamed@opscode.com"]
  s.homepage    = "https://github.com/adamedx/mesh"
  s.summary     = %q{A bridge from the CLR to Ruby}
  s.description = s.summary

  s.required_ruby_version	= ">= 1.9.1"
  s.add_dependency "mixlib-shellout" #, "= 0.5.4"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
#  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
