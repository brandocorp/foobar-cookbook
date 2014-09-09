
#
#  Bundler Setup
#
desc 'Runs bundler to install required gems'
task :bundler do
  require 'bundler'
  require 'bundler/cli'
  begin
    Bundler::CLI.start(['install', '--clean'])
  rescue Bundler::GemNotFound
    Bundler::CLI.start(['update', '--clean'])
  rescue Bundler::BundlerError
    retry
  end
  Gem.clear_paths
end


#
# Foodcritic
#
desc 'Runs foodcritic lint checks'
task :lint => :bundler do
  require 'foodcritic'
  FoodCritic::Rake::LintTask.new
end

#
# RuboCop
#
desc 'Runs Rubocop sytle checks'
task :style => :bundler do
  require 'rubocop'
  cli = RuboCop::CLI.new
  results = cli.run(['--display-cop-names'])
  abort('Rubocop failed!') unless results == 0
end

#
# ChefSpec and RSpec
#
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:unit => :bundler) do |t|
  t.pattern = "spec/**/*_spec.rb"
end

require 'kitchen/rake_tasks'
Kitchen::RakeTasks.new

task :default => [:lint, :style, :unit]
