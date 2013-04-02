require 'bundler'
require 'rubygems'
require 'rubygems/package_task'

Bundler::GemHelper.install_tasks

GEM_NAME = "mesh"

spec = eval(File.read("mesh.gemspec"))

begin
  require 'rspec/core/rake_task'

  task :default => :spec

  desc "Run all specs in spec directory"
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = 'spec/**/*_spec.rb'
  end

rescue LoadError
  STDERR.puts "\n*** RSpec not available. (sudo) gem install rspec to run unit tests. ***\n\n"
end

