require 'coveralls/rake/task'
require 'cucumber'
require 'cucumber/rake/task'
require 'rspec/core/rake_task'

Coveralls::RakeTask.new
task test_with_coveralls: ['test:unit', 'test:acceptance', 'coveralls:push']

namespace :test do
  RSpec::Core::RakeTask.new(:unit) do |t|
    t.rspec_opts = '--format documentation'
  end

  Cucumber::Rake::Task.new(:acceptance) do |t|
    t.cucumber_opts = 'features --format pretty'
  end
end
