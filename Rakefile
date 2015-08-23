require 'cane/rake_task'
require 'coveralls/rake/task'
require 'cucumber'
require 'cucumber/rake/task'
require 'reek/rake/task'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

Coveralls::RakeTask.new

namespace :quality_metrics do
  desc 'Run rubocop'
  RuboCop::RakeTask.new(:rubocop) do |task|
    task.patterns = ['lib/**/*.rb']
    # only show the files with failures
    task.formatters = ['progress']
    # don't abort rake on failure
    task.fail_on_error = true
  end

  desc 'Run reek to report code smells'
  Reek::Rake::Task.new do |t|
    t.fail_on_error = true
    t.verbose = false
  end

  desc 'Run cane to check quality metrics'
  Cane::RakeTask.new(:cane) do |cane|
    cane.abc_max = 10
    cane.no_style = true
  end

  task all: [:rubocop, :reek, :cane]
end

namespace :test do
  RSpec::Core::RakeTask.new(:unit) do |t|
    t.rspec_opts = '--format documentation'
  end

  Cucumber::Rake::Task.new(:acceptance) do |t|
    t.cucumber_opts = 'features --format pretty'
  end

  task all: ['test:unit', 'test:acceptance', 'coveralls:push']
end
