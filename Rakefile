#
#  Setup our bundler environment
#
require 'rubygems'
require 'bundler'
require 'bundler/cli'
begin
  Bundler::CLI.start(['install', '--quiet'])
rescue Bundler::GemNotFound
  Bundler::CLI.start(['update', '--quiet'])
rescue Bundler::BundlerError
  retry
end

Gem.clear_paths

desc 'Runs foodcritic lint checks'
task :lint do
  require 'foodcritic'
  FoodCritic::Rake::LintTask.new
end

desc 'Runs Rubocop sytle checks'
task :style do
  require 'rubocop'
  cli = RuboCop::CLI.new
  results = cli.run(['--display-cop-names'])
  abort('Rubocop failed!') unless results == 0
end

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:unit) do |t|
  t.pattern = "spec/**/*_spec.rb"
end

task :default => [:lint, :style, :unit]
