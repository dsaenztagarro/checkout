source 'http://rubygems.org'

gem 'rake'
gem 'yard'

group :development do
  gem 'cane'
  gem 'reek'
  gem 'rubocop'

  gem 'rb-fchange', require: false # Windows
  gem 'rb-fsevent', require: false # OS X
  gem 'rb-inotify', require: false # Linux
  gem 'terminal-notifier-guard'

  gem 'guard'
  gem 'guard-bundler'
  gem 'guard-cucumber'
  gem 'guard-rspec'
end

group :test do
  gem 'codeclimate-test-reporter', require: nil
  gem 'coveralls', require: false
  gem 'cucumber'
  gem 'rspec', '~> 3.3'
end
