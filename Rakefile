require 'coveralls/rake/task'
require 'rspec/core/rake_task'
require 'cucumber'
require 'cucumber/rake/task'

Coveralls::RakeTask.new
task test_with_coveralls: [:spec, :features, 'coveralls:push']

namespace :test do
  RSpec::Core::RakeTask.new(:units)

  Cucumber::Rake::Task.new(:integration) do |t|
    t.cucumber_opts = 'features --format pretty'
  end
end
